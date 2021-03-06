## Intro

First, read the README.md file in the repository.

This code book describes the variables, the data, and any
transformations or work that you performed to clean up the resulting
data in tidy.dataset.txt.

## R script (run\_analysis.R)

Open run\_analysis.R in RStudio and install the dpylr R package prior to
running the R script. The included R script (run\_analysis.R) does the
following:  
1. If the data are not already downloaded, the data (zip file) are
downloaded from the specified website and unzipped. This creates
getdata.zip and the ‘UCI HAR Dataset’ unzipped folder (refer to
README.txt and features\_info.txt to learn more about the data,
variables, folder structure, etc.).  
2. Combine the training data using the cbind() function \[X\_train.txt
(measurements), y\_train.txt (activities), and subject\_train.txt
(subject identifier)\], and do the same for the test data. Set the train
and test data together using the rbind() function to create one
dataset.  
3. Read in the features and activity\_labels txt files to assist with
creating user-friendly, descriptive variable names/labels. The features
dataset contains variable names for the X\_\* data and the y\_\* data
contain activity ID which align with the activity\_labels dataset.
Retain only the mean, mean(), and standard deviation, std(), variables
for each measurement.  
4. Create and output an independent tidy dataset with the average of
each variable for each activity and each subject.

## tidy\_dataset

In total there are 180 rows and 69 variables in the tidy\_dataset (30
subjects x 6 activities = 180 rows and 66 variables with average
measurement values). See variables below.

-   SubjectID (numbers 1-30, subject identifier)
-   ActivityID (numbers 1-6, activity identifier)
-   Activity (full activity name that aligns with ActivityID: 1=WALKING,
    2=WALKING\_UPSTAIRS, 3=WALKING\_DOWNSTAIRS, 4=SITTING, 5=STANDING,
    6=LAYING)
-   tBodyAccMeanX
-   tBodyAccMeanY
-   tBodyAccMeanZ
-   tBodyAccStdX
-   tBodyAccStdY
-   tBodyAccStdZ
-   tGravityAccMeanX
-   tGravityAccMeanY
-   tGravityAccMeanZ
-   tGravityAccStdX
-   tGravityAccStdY
-   tGravityAccStdZ  
-   tBodyAccJerkMeanX
-   tBodyAccJerkMeanY
-   tBodyAccJerkMeanZ
-   tBodyAccJerkStdX
-   tBodyAccJerkStdY
-   tBodyAccJerkStdZ
-   tBodyGyroMeanX
-   tBodyGyroMeanY
-   tBodyGyroMeanZ
-   tBodyGyroStdX
-   tBodyGyroStdY
-   tBodyGyroStdZ
-   tBodyGyroJerkMeanX
-   tBodyGyroJerkMeanY
-   tBodyGyroJerkMeanZ
-   tBodyGyroJerkStdX
-   tBodyGyroJerkStdY
-   tBodyGyroJerkStdZ
-   tBodyAccMagMean
-   tBodyAccMagStd
-   tGravityAccMagMean
-   tGravityAccMagStd
-   tBodyAccJerkMagMean
-   tBodyAccJerkMagStd
-   tBodyGyroMagMean
-   tBodyGyroMagStd
-   tBodyGyroJerkMagMean
-   tBodyGyroJerkMagStd
-   fBodyAccMeanX
-   fBodyAccMeanY
-   fBodyAccMeanZ
-   fBodyAccStdX
-   fBodyAccStdY
-   fBodyAccStdZ
-   fBodyAccJerkMeanX
-   fBodyAccJerkMeanY
-   fBodyAccJerkMeanZ
-   fBodyAccJerkStdX
-   fBodyAccJerkStdY
-   fBodyAccJerkStdZ
-   fBodyGyroMeanX
-   fBodyGyroMeanY
-   fBodyGyroMeanZ
-   fBodyGyroStdX
-   fBodyGyroStdY
-   fBodyGyroStdZ
-   fBodyAccMagMean
-   fBodyAccMagStd
-   fBodyBodyAccJerkMagMean
-   fBodyBodyAccJerkMagStd
-   fBodyBodyGyroMagMean
-   fBodyBodyGyroMagStd
-   fBodyBodyGyroJerkMagMean
-   fBodyBodyGyroJerkMagStd
