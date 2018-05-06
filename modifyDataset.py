# movieId,imdbId,tmdbId
import csv
import json
import urllib.request
import urllib.error
from decimal import *
import imdb
import ast
import socket
from omdb import Client
import omdb
from dbConnection import dbConnection
omdb.set_default('apikey', "f0a91da4")
from astropy.io.ascii.connect import read_csv
import time

timeout = 10
socket.setdefaulttimeout(timeout)

# filepath = "E:/Poralekha/Programming/python/movie_recommendation/kaggle/the-movies-dataset/credits.csv"
filepath = "E:/Poralekha/Programming/python/movie_recommendation/kaggle/the-movies-dataset/movies_metadata.csv"
image_file_path = "E:/Poralekha/Programming/python/movie_recommendation/images/"
baseURL = "http://image.tmdb.org/t/p/w185/"

#to insert the poster path in the database.
client = Client(apikey="f0a91da4")
dbobj = dbConnection()
imdbList = dbobj.fetchAllWithoutPoster()
for eachRow in imdbList:
    print("Start working for IMDB ID :: " + str(eachRow['imdb_id']))
    try:
        posterURL = omdb.imdbid(eachRow['imdb_id'])['poster']
    except Exception as e:
        continue
    try:
        print("Image url ::" + posterURL)
        img_path = posterURL.split("/")[-1]
        opener = urllib.request.build_opener()
        opener.addheaders = [('User-Agent',
                              'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1941.0 Safari/537.36')]
        urllib.request.install_opener(opener)
        urllib.request.urlretrieve(posterURL, image_file_path + img_path)

    except Exception as e:
        print(e)
        img_path = "No image"
    if dbobj.updatePosterURL(img_path, eachRow['imdb_id']):
        print(eachRow['imdb_id'] + "updated")
    else:
        print(eachRow['imdb_id'] + "did not update")
    # print(omdb.imdbid())
    # for eachRow in readCSV:
    #     try:
    #         actors = ast.literal_eval(eachRow[0])
    #         actorInfo = []
    #         for eachActor in actors:
    #             actorInfo.append(list([eachActor['name'], eachRow[2], eachActor['character']]))
    #         dbobj = dbConnection()
    #         dbobj.createMultiCastActorRow(actorInfo)
    #     except:
    #         continue