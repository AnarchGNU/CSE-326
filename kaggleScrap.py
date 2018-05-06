# movieId,imdbId,tmdbId
import csv
import json
import urllib.request
import urllib.error
from decimal import *
import imdb
import ast
import socket

from astropy.io.ascii.connect import read_csv

from dbConnection import dbConnection
import time

timeout = 10
socket.setdefaulttimeout(timeout)

# filepath = "E:/Poralekha/Programming/python/movie_recommendation/kaggle/the-movies-dataset/credits.csv"
filepath = "E:/Poralekha/Programming/python/movie_recommendation/kaggle/the-movies-dataset/movies_metadata.csv"
image_file_path = "E:/Poralekha/Programming/python/movie_recommendation/images/"
baseURL = "http://image.tmdb.org/t/p/w185/"

#to insert the movie information in the database.
with open(filepath, encoding="utf8") as csvFile:
    readCSV = csv.reader(csvFile, delimiter=',')
    readCSV = list(readCSV)
    # i=0
    for eachrow in readCSV:
        movieID = int(eachrow[5])

        imdbID = eachrow[6]
        print("Start working for movieID ::" + str(movieID) + " And IMDB ID :: " + str(imdbID))
        img_path = eachrow[11]
        try:
            print("Image url ::" +baseURL+img_path)
            opener = urllib.request.build_opener()
            opener.addheaders = [('User-Agent','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1941.0 Safari/537.36')]
            urllib.request.install_opener(opener)
            urllib.request.urlretrieve(baseURL+img_path, image_file_path + img_path)

        except Exception as e:
            print(e)
            img_path = "No image"
        title = eachrow[20]
        releasedDate = eachrow[14]
        try:
            year = int(eachrow[14].split("-")[0])
        except:
            year = 0
        avg_rating_imdb = Decimal(eachrow[22])
        avg_rating_tmdb = 0;
        votesCount = int(eachrow[23])
        director = ""
        try:
            country = ast.literal_eval(eachrow[13])[0]['name']
        except:
            country = ""

        language = eachrow[7]
        budget = int(eachrow[2])
        dbobj = dbConnection()
        argument = list(
            [movieID, imdbID, img_path, budget, title, year, avg_rating_imdb, avg_rating_tmdb, director,
             country, language, releasedDate, votesCount])
        insertedRow = dbobj.createMovieRow(argument)
        print(str(imdbID) + " :: Movie Row just inserted")
        if insertedRow == 1:

            genre = ast.literal_eval(eachrow[3])
            movieGenre = []
            for eachGenre in genre:
                movieGenre.append(list([movieID, eachGenre['name']]))
            dbobj.createMultiGenreMovieRow(movieGenre)
            print(str(imdbID) + " :: Movie genre Row just inserted")
            productions = ast.literal_eval(eachrow[12])
            productionMovie = []
            for eachProduction in productions:
                productionMovie.append(list([movieID, eachProduction['name']]))
            dbobj.createMultiProductionMovieRow(productionMovie)
            print(str(imdbID) + " :: Movie production Row just inserted")
            print("Ended working for movieID ::" + str(movieID) + " And IMDB ID :: " + str(imdbID))
        else:
            print(imdbID + " :: this movie didn't insert")
            continue

        # actors = data['Actors'].split(",")
        # casts = []
        # for eachActor in actors:
        #     casts.append(list([movidID, eachActor]))
        # dbobj.createMultiCastRow(casts)
        # time.sleep(15)
        # print(str(movidID) + " & " + title + "insertion successful")


#             inserting casts info to database in below:



# # to insert the actors info in the database
# with open(filepath, encoding="utf8") as csvFile:
#     readCSV = csv.reader(csvFile, delimiter=',')
#     readCSV = list(readCSV)
#     for eachRow in readCSV:
#         try:
#             actors = ast.literal_eval(eachRow[0])
#             actorInfo = []
#             for eachActor in actors:
#                 actorInfo.append(list([eachActor['name'], eachRow[2], eachActor['character']]))
#             dbobj = dbConnection()
#             dbobj.createMultiCastActorRow(actorInfo)
#         except:
#             continue