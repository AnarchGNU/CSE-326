import numpy as np
from dbConnection import dbConnection
import pandas as pd
from pandas import DataFrame
from pandas.io import sql
from sqlalchemy import create_engine

########################
#   Global variables   #
########################

# List of all genres in database
list_genres = []
# List of all languages in database
list_languages = []
# List of all companies in database
list_companies = []
# List of all countries in database
list_countries = []

# List of identifiers for all movies
list_mids = []
# List of feature vectors for all movies
list_movies = []

###########################
#   Feature vector code   #
###########################

# Available fields in the database:
#
# adult                 belongs_to_collection   budget          genres
# homepage              id                      imdb_id         original_language
# original_title        overview                popularity      poster_path
# production_companies  production_countries    release_date    revenue
# runtime               spoken_languages        status          tagline
# title                 video                   vote_average    vote_count

#   Feature Vector:
#       Adult               Boolean             [0]
#       Popularity          Float               [10]
#       Release Date        Integer             [14]
#       Runtime             Integer             [16]
#       Vote Average        Float               [22]
#       Vote Count          Integer             [23]
#       Genres              Boolean Array       [3]
#       Original Language   Boolean Array       [7]
#       Companies           Boolean Array       [12]
#       Countries           Boolean Array       [13]
#       Spoken Language     Boolean Array       [17]
#
#       Arrays appended to end of feature vector - not array sub-elements

def get_vector(movie):

    # Adult filter
    if movie['adult'] == 'false':
        is_adult = 0.0
    else:
        is_adult = 1.0

    # Genre filter
    try:
        genres = [0.0] * len(list_genres)

        for i in movie['genres']:
                if i in list_genres:
                    genres[list_genres.index(i)] = (1.0 * genre_weight)
    except:
        genres = [None] * len(list_genres)

    # Popularity filter
    try:
        popularity = float(movie['popularity'])
    except:
        popularity = None

    # Release date filter
    try:
        rd_tup = time.strptime(movie['release_date'], '%Y-%m-%d')
        release_date = time.mktime(rd_tup)
    except:
        release_date = None

    # Runtime filter
    try:
        runtime = float(movie['runtime'])
    except:
        runtime = None

    # Vote average filter
    try:
        vote_average = float(movie['vote_average'])
    except:
        vote_average = None

    # Vote count filter
    try:
        vote_count = float(movie['vote_count'])
    except:
        vote_count = None

    vec = [
        is_adult,
        popularity,
        release_date,
        runtime,
        vote_average,
        vote_count
    ]

    vec += genres
    # Original Language
    # Companies
    # Countries
    # Spoken Language

    # Returns vector as flattened NumPy array
    return( np.array(vec).flatten() )


################################
#   This code runs on import   #
################################
engine = create_engine("mysql+mysqldb://root:"+''+"@localhost/movie_recommend")
dbobj = dbConnection()
allmovies = DataFrame(dbobj.selectAllMovie())
