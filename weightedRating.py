from dbConnection import dbConnection
import pandas as pd
from pandas import DataFrame
from pandas.io import sql
from sqlalchemy import create_engine

# Function that computes the weighted rating of each movie

engine = create_engine("mysql+mysqldb://root:"+''+"@localhost/movie_recommend")
dbobj = dbConnection()
allmovies = DataFrame(dbobj.selectAllMovie())

#     calculating C, where C means : mean vote across the whole movie dataset

c = allmovies['avg_rating_imdb'].mean();
print(c)

# Calculate the minimum number of votes required to be in the chart, m
m = allmovies['votes_count'].quantile(0.99)
print(m)

# Filtered all the movies which have more that 90% vote counts.

filtered_movies = allmovies.copy().loc[allmovies['votes_count'] >=m]
print(len(filtered_movies))

# Function that computes the weighted rating of each movie
def weighted_rating(x, m=m, C=c):
    v = x['votes_count']
    R = float(x['avg_rating_imdb'])
    # Calculation based on the IMDB formula
    return (v/(v+m) * R) + (m/(m+v) * C)

# Define a new feature 'score' and calculate its value with `weighted_rating()`
filtered_movies['score'] = filtered_movies.apply(weighted_rating, axis=1)

#Sort movies based on score calculated above
filtered_movies = filtered_movies.sort_values('score', ascending=False)

#Print the top 15 movies
# print(filtered_movies[['title', 'votes_count', 'avg_rating_imdb', 'score']].head(250))
insertedMovies = filtered_movies[['movie_id','title', 'votes_count', 'avg_rating_imdb', 'score']].head(250);
deletedRows = dbobj.deleteSimpleRecommendation();
if deletedRows>-1:
    insertedMovies.to_sql(con=engine, name = 'simple_recommendation', if_exists='append', index=False)