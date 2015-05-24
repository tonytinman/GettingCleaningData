---
#Course Project Code Book
##Getting & Cleaning Data 


###Source Data
* X Data
  * Provided in 2 files (x_train.txt, x_test.txt)
  * Contains a set of individual observations (10299 rows) of various variables (561 columns)
* Features
  * Provided in 1 file (features.txt)
  * Contains measure names which correspond to each of the variables (columns) in the x dataset.
* Y Data
  * Provided in 2 files (y_train.txt, x_test.txt)
  * Provides an activity index corresponding to each observation (row) in the x dataset. The     activity index value indicates the type of activity being performed by the subject when the observations were taken.  
* Subject Data
  * Provided in 2 files (subject_train.txt,subject_test.txt)
  * Provides an identifier for the subject of each observation (row) in the x dataset.
* Activities
  * Provided in 1 file (activity_lables.txt)
  * Provides a descriptive name for each unique activity index contained in the y dataset.

###Data Observations
1. Merges the *train* and *test* datasets for the x data, y data, and subject data.
  1.1 The y_train and y_test files are extracted to *train* and *test* data frames.
  1.2 The *train* data frame contains 7352 obs. (rows) of 1 variable (columns).
  1.3 The *test* data frame contains 2947 obs. (rows) of 1 variable (columns).
  1.4 The *train* and *test* data frames are merged using row binding (rbind()).
  1.5 The x_train and x_test files are extracted to *train* and *test* data frames.
  1.6 The *train* data frame contains 7352 obs. (rows) of 561 variables (columns).
  1.7 The *test* data frame contains 2947 obs. (rows) of 561 variables (columns).
  1.8 The *train* and *test* data frames are merged using row binding (rbind()).
  1.9 The y_train and y_test files are extracted to *train* and *test* data frames.
  1.10 The *train* data frame contains 7352 obs. (rows) of 1 variable (columns).
  1.11 The *test* data frame contains 2947 obs. (rows) of 1 variable (columns).
  1.12 The *train* and *test* data frames are merged using row binding (rbind()).
2.Extract only mean and stddev measures
  The x data contains a variety of different variables (columns), of which we are only interested in the variables relating to mean and std dev.
  2.1 The *measures* data set contains 561 obs.(rows) of 2 variables(columns):  
  i. An index value corresponding to a column in the x dataset  
  ii. the descriptive name for the variable  
  2.2 Subset the *measures* data set using grep to identify the indicies of the mean and std dev measures. The resultant dataset is an integer vector of length 66 containing:  
  i. the index of each identified std dev and mean measure column in the x datset
  2.3 Subset the x dataset using only the mean and std dev subset of *measures*.
3. Apply the descriptive activity names to the y dataset.  
  3.1 Extract the activity_lables.txt to the *activities* dataset. The *activities* dataset contains 6 obs.(rows) of 2 variables(columns).  
    The activities are:    
    WALKING  
    WALKING_UPSTAIRS  
    WALKING_DOWNSTAIRS  
    SITTING  
    STANDING  
    LAYING  
4. Merge the s,y,x datasets into a new dataset called *clean*.  
  The *clean* dataset contains 10299 obs. (rows) of 68 variables (columns).
