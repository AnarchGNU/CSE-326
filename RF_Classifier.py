import sklearn.ensemble as rf   # Random Forest
import numpy as np              # Needed for training data
import calendar                 # Used to time SVM training
import time                     # Used to time SVM training
import heapq                    # Used to rank recommendations

from sklearn.preprocessing import Imputer   # Used to correct for missing data


# Class for random forest classifier
class RF_Clf:

    ### Constructor
    def __init__(self, iw=100):
        self.input_weight = iw                  # Default weight for user preferences
        self.RF = rf.RandomForestClassifier()   # Random Forest object
        self.IMP = Imputer(missing_values='NaN', strategy='mean', axis=0)
        self.t_train = None                     # Data populated after train() call
        self.t_rank = None                      # Data populated after score_list() call
        self.trained = False                    # Marked true in train() call

    ### Training method
    ### Expects missing values to be represented as NaN or None
    def train(self, fg, bg):
        train = np.array(fg + bg)

        # Average missing data
        self.IMP.fit(train)
        train = self.IMP.transform(train)

        train_weight = np.array( ([self.input_weight] * len(fg) ) + ([1] * len(bg)) )
        cats = np.array( ([1] * len(fg)) + ([0] * len(bg)) )
        # Cat = 1 -> Recommended (fg)
        # Cat = 0 -> Not Recommended (bg)

        # Train classifier and time training
        t_start = calendar.timegm(time.gmtime())
        self.RF.fit(train, cats, sample_weight=train_weight)
        t_end = calendar.timegm(time.gmtime())
        self.t_train = t_end - t_start
        self.trained = True

    ### Scoring method
    ### Expects missing values to be represented as NaN or None
    ### Checks that classifier has been trained
    def score(self, vec):

        # Check that classifier has been trained
        assert(self.trained)

        # Remove NaN data from test vector
        test = [ np.array( vec ) ]
        test = self.IMP.transform(test)

        score = 1.0 - self.RF.predict_proba( test )[0][1]
        return score

    # def heapsort(iterable):
    #     h = []
    #     for value in iterable:
    #         heapq.heappush(h, value)
    #     return [heapq.heappop(h) for i in range(len(h))]

    ### Scoring method for list of movies
    ### Calls score()
    ### Output = [ [score,mid] [score,mid] ... ]
    def score_list(self, mids, vecs, mids_usr=None, out=0):
        heap = []
        t_start = calendar.timegm(time.gmtime())
        for mid in mids:

            fv = vecs[ mids.index(mid) ]
            score = self.score(fv)
            heap.append((score, mid))

        heapq._heapify_max(heap)     # Rank list
        t_end = calendar.timegm(time.gmtime())
        self.t_rank = t_end - t_start

        if (len(mids_usr) == 0) or (out == 0):
            # Return all results
            return heap

        else:
            # Return top results that are not in user's preferences
            out_list = []
            i = 0
            while i < out:
                out_i = heapq.heappop(heap)   # Remove top item from list

                if out_i[1] not in mids_usr:
                    out_list.append(out_i)
                    i += 1

            return out_list
