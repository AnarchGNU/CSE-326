# NOTE: In addition to the mid_to_fv method, we also need:
#           1) A method that returns a list of all movie ids in the database
#           2) A method that returns all "preferred" movie ids for a single user

import time     # Used to convert release date to numeric value
from dbConnection import dbConnection
import pandas as pd

# List of every genre that occurs in the database - should be populated immediately

# list_genres = []
dbobj = dbConnection()
list_genres = pd.DataFrame(dbobj.fetchAllGenre())
print(list_genres.values)
### Takes a movie id and uses data from the SQL to craft a feature vector
def mid_to_fv(mid):

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
    # Psuedocode format: field value = sql_entry['field']

    movie = pd.DataFrame(dbobj.getByMID(mid)); # However you need to access a database object
    movieGenre = pd.DataFrame(dbobj.getMovieGenre(mid))
    # Simple numeric values
    # popularity = float(movie['popularity']) # Should be set to None if not available
    runtime = float(movie['runtime']) # Should be set to None if not available
    vote_average = float(movie['avg_rating_imdb']) # Should be set to None if not available
    vote_count = float(movie['votes_count']) # Should be set to None if not available

    # Convert release date to numeric value (Assumes YYYY-MM-DD format)
    # release_date = movie['release_date'][0]
    # rd_tup = time.strptime(release_date, '%Y-%m-%d')
    # release_date = time.mktime(rd_tup)

    # If no genre data, genres = [None] * len(list_genres)
    genres = [0.0] * len(list_genres)
    # Assumes movie['genres'] returns a list of genres as string types
    for genre in movieGenre.values:
        genres[list_genres.index(genre)] = 1.0

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


mid_to_fv(21)