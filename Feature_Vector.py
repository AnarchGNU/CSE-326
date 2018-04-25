import time     # Used to convert release date to numeric value
from dbConnection import dbConnection
import pandas as pd
import numpy as np

# List of every genre that occurs in the database - should be populated immediately
dbobj = dbConnection()
list_genres = pd.DataFrame(dbobj.fetchAllGenre())
list_genres = list_genres['genre_name'].values.tolist()


### Takes a movie id and uses data from the SQL to craft a feature vector
def mid_to_fv(movie):

    #   Feature Vector:
    #       Popularity          Float
    #       Runtime             Integer
    #       Vote Average        Float
    #       Vote Count          Integer
    #       Release Date        Integer
    #       Genres              Boolean Array
    #       Original Language   Boolean Array
    #       Companies           Boolean Array
    #       Countries           Boolean Array
    #       Spoken Language     Boolean Array
    #
    #       Arrays appended to end of feature vector - not array sub-elements

    # NOTE: If values are not present for a given movie, the variable is set to None

    # Simple numeric values
    runtime = float(movie['runtime'])                       # Should be set to None if not available
    if runtime == 0:
        runtime = None

    vote_average = float(movie['avg_rating_imdb'])          # Should be set to None if not available
    if vote_average == 0:
        vote_average = None

    vote_count = float(movie['votes_count'])                # Should be set to None if not available
    if vote_count == 0:
        vote_count = None

    # Convert release date to numeric value (Assumes YYYY-MM-DD format)
    release_date = ""
    try:
        release_date = movie['release_date']
        rd_tup = time.strptime(release_date, '%Y-%m-%d')
        release_date = time.mktime(rd_tup)
    except:
        release_date = None



    # If no genre data, genres = [None] * len(list_genres)
    # Assumes movieGenre.values returns a list of genres as string types
    try:
        movieGenre = movie['movie_genres'].split(",")  # Access genre list of database object
        if len(movieGenre) == 0:
            genres = [None] * len(list_genres)
        else:
            genres = [0.0] * len(list_genres)
            for genre in movieGenre:
                genres[list_genres.index(genre)] = 1.0
    except:
        genres = [None] * len(list_genres)

    # Construct final feature vector
    vec = [
        runtime,
        vote_average,
        vote_count,
        release_date
    ]
    vec += genres   # Append genre boolean list

    # Return vector as flattened (1-dimensional) NumPy array
    return( np.array(vec).flatten() )
