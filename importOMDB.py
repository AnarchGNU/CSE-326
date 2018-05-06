import csv
import json
import urllib.request
from decimal import *
import imdb
import ast
from omdb import Client
import omdb
from dbConnection import dbConnection
omdb.set_default('apikey', "f0a91da4")
filepath = "E:/Poralekha/Programming/python/movie_recommendation/dataset/grouplens/links.csv"

image_file_path = "E:/Poralekha/Programming/python/movie_recommendation/images/"

client = Client(apikey="f0a91da4")

with open(filepath, encoding="utf8") as csvFile:
    readCSV = csv.reader(csvFile, delimiter=',')
    readCSV = list(readCSV)
    oneinFo = readCSV[1]
    print(omdb.imdbid(oneinFo[1]))

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