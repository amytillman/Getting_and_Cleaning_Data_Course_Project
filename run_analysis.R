
#### Obtain data, download, and unzip ####

#print out current working directory as a reference
getwd()

#check to see if zip file already exists. if not, download and unzip.
if (!file.exists("./getdata.zip")){
  #data for the course project:
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
  #download the data
  download.file(url, "./getdata.zip")
  #unzip the data
  unzip(zipfile="./getdata.zip")
}  


# You should create one R script called run_analysis.R that does the following:
# 1) Merges the training and the test sets to create one data set.
# 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3) Uses descriptive activity names to name the activities in the data set
# 4) Appropriately labels the data set with descriptive variable names. 
# 5) From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.


#The README.md file states that the user must install the dplyr R package prior to running this script
#you can run the following code below to install the package: install.packages("dplyr") 
#load necessary packages 
library(dplyr)


#### Merge the training and the test sets to create one dataset. ####
# AND
#### Extract only the mean and standard deviation for each measurement. ####

#read in the features txt file
features <- read.table("./UCI HAR Dataset/features.txt")
#for each row, there is a variable number and variable label

#read in the activity labels txt file and add column names
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(activity_labels) <- c("ActivityID","Activity")

#read in the train datasets and add column names
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
colnames(subject_train) <- "SubjectID"
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
colnames(y_train) <- "ActivityID"
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
colnames(X_train) <- features[,2]

#read in the test datasets and add column names
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
colnames(subject_test) <- "SubjectID"
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
colnames(y_test) <- "ActivityID"
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
colnames(X_test) <- features[,2]

#combine the train data together into one dataset
train <- cbind(y_train, subject_train, X_train)
#combine the test data together into one dataset
test <- cbind(y_test, subject_test, X_test)
#set the train and test data together into one dataset
all <- rbind(train, test)

#obtain variables of interest: ActivityID, SubjectID, and variables with either 'mean()' or 'std()' 
#obtain the element number in the names(all) vector, sort, and store in var_subset
#NOTE: Assuming meanfreq is NOT a variable of interest
var_subset <- sort( c( 
  grep("ActivityID",names(all)),
  grep("SubjectID",names(all)),
  grep("mean\\(\\)",names(all)), 
  grep("std\\(\\)",names(all)) 
  ))

#print variables of interest
names(all)[var_subset]

#subset on variables of interest
all1 <- all[,var_subset]




#### Appropriately label the dataset with descriptive variable names. ####
# AND
#### Use descriptive activity names to name the activities in the dataset. ####

#relabel the mean and std variables to be more user-friendly
#replace '-mean()' with Mean and '-std()' with Std and then remove any additional '-'
names_all1 <- names(all1)
names_all1 <- gsub("-mean\\(\\)", "Mean", names_all1)
names_all1 <- gsub("-std\\(\\)", "Std", names_all1)
names_all1 <- gsub("-", "", names_all1)
colnames(all1) <- names_all1
names(all1)

#sort data
all1 <- dplyr::arrange(all1, ActivityID, SubjectID)
#Use descriptive activity names by merging on the activity names as a variable 
all2 <- merge(x=all1, y=activity_labels, by="ActivityID", all.x=TRUE)
#reorder columns
all3 <- dplyr::select(all2,SubjectID,ActivityID,Activity,tBodyAccMeanX:fBodyBodyGyroJerkMagStd)




#### create a second, independent tidy dataset with the average of each variable 
#### for each activity and each subject.

#quick summary to get an idea of the counts
xtabs(~SubjectID+ActivityID,data=all3)
#average of each variable for each subject and activity (ID+descriptive name)
mean_tidydata <- aggregate(. ~ SubjectID + ActivityID + Activity, all3, mean)
#sort data
tidy_dataset <- dplyr::arrange(mean_tidydata, SubjectID, ActivityID, Activity)

#output tidy dataset
write.table(tidy_dataset, "./tidy_dataset.txt", row.names = FALSE, quote = FALSE)


