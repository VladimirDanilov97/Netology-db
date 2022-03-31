import spotipy
import sqlalchemy
import os


class MyDb():
    def __init__(self, user, password, db_name):
        self.db = f'postgresql+psycopg2://{user}:{password}@localhost:5432/{db_name}'
        self.engine = sqlalchemy.create_engine(self.db)
        self.connection = self.engine.connect()

    def insert(self, table, columns_to_insert, values):
        quotted_values = [f"'{value}'" for value in values]
        joined_values = ', '.join(quotted_values)
        joined_columns_to_insert = ', '.join(columns_to_insert)

        self.connection.execute(f'''INSERT INTO {table}({joined_columns_to_insert})
                                    VALUES({joined_values});''')

    def execute(self, text):
        self.connection.execute(text)

    def clear_table(self, table):
        self.connection.execute(f"DELETE FROM {table};")

    def alter_sequence(self, table):
        self.connection.execute(f"ALTER SEQUENCE {table}_id_seq RESTART WITH 1;")

    def select_all(self, text):
        execute = self.connection.execute(text)
        return execute.fetchall()

    def select_one(self, text):
        execute = self.connection.execute(text)
        return execute.fetchone()


def clear_music_database(my_db):
    if isinstance(my_db, MyDb):
        my_db.clear_table('artist_album')
        my_db.clear_table('artist_category')
        my_db.clear_table('collection_track')
        my_db.clear_table('collection')
        my_db.clear_table('artist')
        my_db.clear_table('category')
        my_db.clear_table('track')
        my_db.clear_table('album')
        my_db.alter_sequence('artist')
        my_db.alter_sequence('collection')
        my_db.alter_sequence('category')
        my_db.alter_sequence('track')
        my_db.alter_sequence('album')
    else:
        print('Error')


def main(artists):
    password = os.getenv('db_pass')
    my_db = MyDb('netology', password, 'music')

    client_secret = os.getenv('secret')
    client_id = os.getenv('client_id')
    credentials = spotipy.oauth2.SpotifyClientCredentials(
        client_id=client_id,
        client_secret=client_secret)
    spotify = spotipy.Spotify(client_credentials_manager=credentials)
    response = spotify.search(q='The Weeknd', type='artist', limit=1)

    # clear_music_database(my_db) Clear all database

    for artist in artists:
        my_db.insert('artist', ['artist_name'], [artist])
        artist_id = my_db.select_one(f'''SELECT id FROM artist
                                         WHERE artist_name='{artist}';''')[0]
        response = spotify.search(q=artist, type='artist', limit=1)

        cats = response['artists']['items'][0]['genres']
        added_cats = [columns[0] for columns in my_db.select_all(
            'SELECT category_name FROM category')]
        for cat in cats:
            if cat not in added_cats:
                my_db.insert('category', ['category_name'], [cat])
                cat_id = my_db.select_one(f'''SELECT id FROM category
                                              WHERE category_name='{cat}';''')[0]
                my_db.insert('artist_category', ['artist_id', 'category_id'], [artist_id, cat_id])

        uri = response['artists']['items'][0]['uri']
        top_tracks_response = spotify.artist_top_tracks(artist_id=uri, country='US')['tracks']

        for track in top_tracks_response:
            album_name = track['album']['name']
            album_release = int(track['album']['release_date'].split('-')[0])

            track_name = track['name']
            track_duration = track['duration_ms']

            all_albums = [(columns[0], columns[1]) for columns in my_db.select_all(
                'SELECT album_name, release_date FROM album')]

            if (album_name, album_release) not in all_albums:
                album_name = album_name.replace("'", "''")
                my_db.insert('album', ['album_name', 'release_date'], [album_name, album_release])
            else:
                album_name = album_name.replace("'", "''")

            album_id = my_db.select_one(
                f'''SELECT id FROM album
                    WHERE album_name='{album_name}' and release_date={album_release};''')[0]
            artist_album = [
                columns for columns in my_db.select_all(
                    'SELECT artist_id, album_id FROM artist_album')]
            if (artist_id, album_id) not in artist_album:
                my_db.insert('artist_album', ['artist_id', 'album_id'], [artist_id, album_id])

            track_name = track_name.replace("'", "''")
            my_db.insert('track', ['track_name', 'duration', 'album_id'],
                                  [track_name, track_duration, album_id])


if __name__== '__main__':
    artists = ['Placebo', 'The Weeknd', 'Metallica', 'Daft Punk',
               'Red Hot Chili Peppers', 'Kendrick Lamar', 'Linkin Park',
               'The Cure']
    main(artists)
