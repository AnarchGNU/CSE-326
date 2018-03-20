import sklearn.svm as svm       # Support Vector Machine
import sklearn.ensemble as rf   # Random Forest
import heapq                    # Heap (Priority Queue)
import numpy as np              # Needed for training data
import csv                      # Used to read csv into list
import sys                      # Used to read command line arguments
import re                       # Used to split some strings

from sklearn.preprocessing import Imputer   # Used to accomodate for missing data

import calendar                 # Used to time SVM training
import time

#===============
# Globals
#===============

input_weight = 100
genre_weight = 100.0
total_out = 10

# Must be uppercase
base_names = [
        "Star Wars: Episode I - The Phantom Menace",
        "Star Wars: Episode II - Attack of the Clones",
        "Star Wars: Episode III - Revenge of the Sith"
    ]
base_vectors = []

lib_all = []
lib_names = []
lib_vectors = []

list_genres = []
list_languages = []
list_companies = []
list_countries = []

#===============
# Functions
#===============

#   Feature Vector
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

# 'movie' is an array of strings based on the headings of the csv file
# 0     1                     2 etc
# adult,belongs_to_collection,budget,genres,homepage,id,imdb_id,original_language,original_title,overview,popularity,poster_path,production_companies,production_countries,release_date,revenue,runtime,spoken_languages,status,tagline,title,video,vote_average,vote_count
def get_vector(movie):

    if movie[0].lower() == 'false':
        is_adult = 0.0
    else:
        is_adult = 1.0

    try:
        genres = [0.0] * len(list_genres)

        g = re.split(r'[:,\{\}\[\]\s]\s*', item[3])
        for i in range(len(g)):
            if (i + 1) % 6 == 0:
                if g[i] in list_genres:
                    genres[list_genres.index(g[i])] = (1.0 * genre_weight)
    except:
        genres = [None] * len(list_genres)

    try:
        popularity = float(movie[10])
    except:
        popularity = None

    try:
        rd_tup = time.strptime(movie[14], '%Y-%m-%d')
        release_date = time.mktime(rd_tup)
    except:
        release_date = None

    try:
        runtime = float(movie[16])
    except:
        runtime = None

    try:
        vote_average = float(movie[22])
    except:
        vote_average = None

    try:
        vote_count = float(movie[23])
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

#===============
# Main Function
#===============

if __name__ == "__main__":

    # Build library from file input

    try:
        in_file_str = sys.argv[1]
    except:
        in_file_str = "movies_metadata.csv"

    # Import csv file as list
    with open(in_file_str, 'rb') as in_file:
        file_reader = csv.reader(in_file)
        lib_all = list(file_reader)
    # Remove csv header element
    lib_all.remove(lib_all[0])

    # Build name and genre lists from all data
    for item in lib_all:
        # Append item name
        try:
            lib_names.append(item[20])
        except:
            lib_names.append(item[8])

        # Build genre list
        g = re.split(r'[:,\{\}\[\]\s]\s*', item[3])
        for i in range(len(g)):
            if (i + 1) % 6 == 0:
                if (g[i] not in list_genres) and (len(g[i]) > 1):
                    list_genres.append(g[i])

    for item in lib_all:
        lib_vectors.append( get_vector(item) )

    # Input feedback
    print("Looking for " + str(total_out) + " movies like:")
    for item in base_names:
        print("    " + item)
    print("")

    # Build base vector list
    for i in range(len(base_names)):
        base_vectors.append( lib_vectors[ lib_names.index( base_names[i] ) ] )

    # Setup classifiers
    #SVM = svm.SVC(probability=True)     # Support Vector Machine object
    RF = rf.RandomForestClassifier()    # Random Forest object

    clf = RF

    # Train classifiers
    train_names = base_names + lib_names
    train = base_vectors + lib_vectors
    train = np.array(train)

    # Account for missing data
    print("Averaging missing data...")
    IMP = Imputer(missing_values='NaN', strategy='mean', axis=0)
    IMP.fit(train)
    train = IMP.transform(train)

    train_weight = np.array( ([input_weight] * len(base_names) ) + ([1] * len(lib_names)) )
    cats = np.array( (len(base_vectors) * [1]) + (len(lib_vectors) * [0]) )

    # 1 = Recommended
    # 0 = Not Recommended

    print("Training classifier on all data...")
    t_start = calendar.timegm(time.gmtime())
    clf.fit(train, cats, sample_weight=train_weight)
    t_end = calendar.timegm(time.gmtime())
    print("Time to train = " + str(t_end - t_start) + " seconds")
    print("")


    # Support Vector Machine Results
    # Lower values at top of heap
    print("Ranking results...")
    heap = []

    t_start = calendar.timegm(time.gmtime())
    for i in range(len(train)):
        score = 1.0 - clf.predict_proba( [ np.array( train[i] ) ] )[0][1]
        name = train_names[ i ]
        heap.append((score, name))

    heapq.heapify(heap)     # Order list
    t_end = calendar.timegm(time.gmtime())
    print("Time to rank = " + str(t_end - t_start) + " seconds")

    print("Results:")
    i = 0
    while i < total_out:
        out = heapq.heappop(heap)   # Remove top item from list

        if out[1] not in base_names:
            str_out = out[1]
            print("    " + str_out + " (" + str(round(((1.0 - out[0]) * 100), 2)) + "%)")
            i += 1
    print("")
