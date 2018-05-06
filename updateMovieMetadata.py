# movieId,imdbId,tmdbId
import csv
import json
import urllib.request
from decimal import *
from dbConnection import dbConnection
import time
import ast
import pandas as pd;
import math

def isNaN(x):
    return x != x

filepath = "E:/Poralekha/Programming/python/movie_recommendation/dataset/movies_metadata.csv"
image_file_path = "E:/Poralekha/Programming/python/movie_recommendation/images/"

creditsData = pd.read_csv(filepath, index_col=0, parse_dates=True)

for eachElement in creditsData.values:

    movieID = int(eachElement[4])
    overview = eachElement[8]
    if isNaN(overview):
        overview = ""
    runtime = Decimal(eachElement[15])
    if isNaN(runtime):
        runtime = ""
    tagline = eachElement[18]
    if isNaN(tagline):
        tagline = ""


    dbobj = dbConnection()
    argument = list([overview, runtime, tagline, movieID])
    print("Update start: " + str(movieID))
    dbobj.updateMovieMetadata(argument)
    print("Update end: " + str(movieID))


