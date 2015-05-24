#####################################################################################
##objective 1 - merge the test and train datasets
#####################################################################################
#merge the subject_train and subject_test datasets
train<-read.table("UCI HAR Dataset/train/subject_train.txt")
test<-read.table("UCI HAR Dataset/test/subject_test.txt")
s<-rbind(train,test)

#merge the x_train and x_test datasets
train<-read.table("UCI HAR Dataset/train/x_train.txt")
test<-read.table("UCI HAR Dataset/test/x_test.txt")
x<-rbind(train,test)

#merge the y_train and y_test datasets
train<-read.table("UCI HAR Dataset/train/y_train.txt")
test<-read.table("UCI HAR Dataset/test/y_test.txt")
y<-rbind(train,test)

#remove working datasets
rm(train,test)

#####################################################################################
##objective 2 - extract only mean and stddev
#####################################################################################
#features.txt contains the list of column names which correspond to the x_data set
measures<-read.table("UCI HAR Dataset/features.txt")
#extract the index of the mean and stddev measures 
measureIndicies<-grep("mean\\(\\)|std\\(\\)", measures[, 2])
#subset the x dataset based on the indicies of the mean and stddev measures
x<-x[,measureIndicies]


#####################################################################################
#objective 3 - use descriptive activity names
#####################################################################################
#get the activities dataset
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
#in the y dataset, replace the activity index value with the activity descriptive name
y[,1] = activities[y[,1], 2]

#####################################################################################
#objective 4 - label the data set with descriptive variable names.
#####################################################################################
names(s) <- "subject"
names(x)<-features[measureIndicies,2]
names(y) <- "activity"
#bind the 3 intermediate datasets into a single, cleaned, dataset
clean <- cbind(s,y,x)

#####################################################################################
#objective 5 - create an independent tidy data set with the average of each variable 
#              for each activity and each subject.
#####################################################################################
#create a new data frame (result) to store an average of each measure for each 
#activity and each subject.
#ie. 30 subjects * 6 activities = 180 rows
result = clean[1:(length(unique(s)[,1])*length(activities[,1])),]

#get the range of columns which store measure values (the first 2 columns are reserved for the
#subject and activity so the first column for a measure value will be 3)
fromCol = 3
#the last column will be the number of the last column in the clean dataset 
toCol = dim(clean)[2]

row = 0
#loop through each subjects
for (thisSubject in 1:length(subjects)) 
  {
  #loop through each activity
  for (thisActivity in 1:length(activities[,1])) 
    {
    row = row+1
    #insert subject and activity names into the result columns 1 & 2
    result[row, 1] = subjects[thisSubject]
    result[row, 2] = activity_labels[thisActivity, 2]
    
    #subset the clean data for the current subject and activity
    sa_obs <- clean[clean$subject==thisSubject & clean$activity==activities[thisActivity, 2], ]
    
    #set the row in the result set to be the means of each column in the sa_obs
    result[row, fromCol:toCol] <- colMeans(sa_obs[, fromCol:toCol])
    }
  }
write.table(result, "UCI HAR Dataset/averages.txt",row.name=FALSE)

