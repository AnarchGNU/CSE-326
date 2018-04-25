import RF_Classifier as clf             # Random Forest Classifier encapsulation
import Feature_Vector as fv             # Feature Vector for movie data
from dbConnection import dbConnection   # Database for movie data
import numpy as np                      # Used to pass information between clf and fv
import pandas as pd                     # Used to format database information
import sys
from sqlalchemy import create_engine

engine = create_engine("mysql+mysqldb://root:"+''+"@localhost/movie_recommend")
### Main method
# Allows main function to be called from another script
def main(usr_list):

    # Setup movie data base data
    dbobj = dbConnection()

    # Takes all movie information - needs to be reformatted into list of movie ids
    movies_all = pd.DataFrame(dbobj.selectAllMovieWithGenres())
    movies_ID = movies_all['movie_id'].values.tolist()

    vectors_all = []

    # Build list of all feature vectors
    for iter, movie in movies_all.iterrows():
        vectors_all.append( fv.mid_to_fv(movie) )

    for usr in usr_list:

        vectors_usr = []
        movies_usr = pd.DataFrame(dbobj.selectUserMovie(usr))
        movies_usr_ID = movies_usr['movie_id'].values.tolist()

        # Build list of feature vectors for user preferences
        for movie in movies_usr_ID:
            # Find corresponding vector in the list vectors_all
            vectors_usr.append( vectors_all[ movies_ID.index(movie) ])


        # Setup classifer
        RF = clf.RF_Clf()

        # Train classifier
        RF.train(vectors_usr, vectors_all)

        # Get results

        total_out = 10  # Number of results to get
        # If mids_usr==None or out==0, returns ranked list of all movies
        # Output = [ [score,mid] , [score,mid] , ... ]
        recs = RF.score_list(movies_ID, vectors_all, mids_usr=movies_usr, out=total_out)
        desired_list = [[usr] + list(tup) for tup in recs]
        # recs = recs.tolist()
        # labels = ['movie_id', 'user_id', 'score']
        # dataFrame = pd.DataFrame.from_records(desired_list, labels)
        # recs_np = np.array(recs)                    # NumPy array of recommendations
        # scores_ranked = (recs_np[:,0]).tolist()     # Ranked list of movie scores
        # movies_ranked = (recs_np[:,1]).tolist()     # Ranked list of movie IDs

        # At this point, the user-specific SQL can be updated with the mids and scores
        saveList = []
        for item in desired_list:
            saveList.append(list([int(item[0]), float(item[1]), int(item[2])]))
        dbobj.deleteUserBasedRecommendation(int(usr))
        dbobj.createMultiRecommendationRow(saveList)
        # dataFrame.to_sql(con=engine, name = 'user_based_recommendation', if_exists='append', index=False)

### Call main function if this file is executed
if __name__ == "__main__":
    # Usage: python SQL_Recommend
    user_ids = []
    for arg in sys.argv:
        user_ids.append(int(arg)))

    main(user_ids)

#if __name__ == '__main__':
#    main([1])