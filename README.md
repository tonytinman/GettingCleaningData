# GettingCleaningData
##Getting & Cleaning Data - Course Project

This ReadMe file contains the requirements, assumptions, and descriptions of R scripts, for the Getting & Cleaning Data course project.

###Source Data
A zip file containing the source data for the project can be downloaded from (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "here.")
The run_analysis.R script assumes the source data zip file is extracted to the user's R working directory.
The individual source files make up a set of various measurements, taken for a set of different subjects, performing a variety of different activities.

###Script: run_analysis.R
The approach adopted to achive the overall ojective is to maintain a set of intermediate merged datasets, perform appropriate cleaning and tidying operations on the intermediate datasets, then merge the intermediate datasets into a single cleaned dataset.  
1. Merges the *train* and *test* datasets for the x data, y data, and subject data.  
  1.1 The subject_train and subject_test files are extracted to *train* and *test* data frames.  
  1.2 The *train* and *test* data frames are merged using row binding (rbind()).  
  1.3 The x_train and x_test files are extracted to *train* and *test* data frames.  
  1.4 The *train* and *test* data frames are merged using row binding (rbind()).  
  1.5 The y_train and y_test files are extracted to *train* and *test* data frames.  
  1.6 The *train* and *test* data frames are merged using row binding (rbind()).  
2.Extract only mean and stddev measures  
  The x data contains a variety of different variables (columns), of which we are only interested in the variables relating to mean and std dev.  
  2.1 Extract the variable names corresponding to the x data set from the features.txt file to a datset called *measures*. The *measures* data set contains 2 variables(columns)  
    i. An index value corresponding to a column in the x dataset  
    ii. the descriptive name for the variable.  
  2.2 Subset the *measures* data set using grep to identify the indicies of the mean and std dev measures. The measures are identified by pattern matching the string values "mean" and std" in the measure descriptive names. Resultant dataset is an integer vector containg the indices corresponding to the columns in the x dataset.  
  2.3 Subset the x dataset using only the mean and std dev subset of *measures*.  
3. Apply the descriptive activity names to the y dataset.  
  3.1 Extract the activity_lables.txt to the *activities* dataset. The *activities* dataset contains 2 variables(columns):  
    i. the activity index  
    ii. the descriptive activity name  
  3.2 Replace the activity index value in the y dataset with the corresponding descriptive name from the *activities* dataset.  
4. Label the variable names of the datasets then merge to a single cleaned dataset  
5. Create an independent tidy data set with the average of each variable for each activity and each subject.  
  5.1 The new dataset will avaerage all the observation for each subject/activity combination. Therefore 1 row for each combination will be required in the summarised dataset. Create a data frame called *result* which contains 1 row per subject/activity combination.  
  5.2 Determine a column range for the measure columns. This range will be used when summarising the clean data and assigning the averages to the result.  
  5.3 Loop through each subject/activity combination incrementing the row index to reference a new row in *result*   
    i. assign the subject and activity values to a row in the result dataset
    ii. subset the clean data for the subject and activity  
    iii. assign the result of colMeans for each measure column in the clean dataset to the current row in the *result* dataset  
  5.4 Write out the *result* dataset to a file "averages.txt" in the folder "UCI HAR Dataset" in the working directory.  
