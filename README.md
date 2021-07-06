# Getting_and_Cleaning_Data_Course_Project
JHU data science course: Getting and Cleaning Data course project
Author: Amy Tillman

This is the project for the Getting and Cleaning Data JHU Coursera course.

The Github repository [https://github.com/amytillman/Getting_and_Cleaning_Data_Course_Project](https://github.com/amytillman/Getting_and_Cleaning_Data_Course_Project) includes the following:
- a README.md in the repo with your scripts (this repo explains how all of the scripts work and how they are connected)
- a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md 
- run_analysis.R (R Script)
- run_analysis.R creates and outputs a tidy dataset (tidy_dataset.txt which is created with write.table() using row.name=FALSE and quote=FALSE)

Note: The code should have a file run_analysis.R in the main directory that can be run as long as the data is in your working directory. The output should be the tidy dataset. You should include a README.md in the repo describing how the script works and the codebook describing the variables.

Data for the course project:
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  
A full description is available here:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


Open run_analysis.R in RStudio and install the dpylr R package prior to running the R script. The included R script (run_analysis.R) does the following:
1) If the data are not already downloaded, the data (zip file) are downloaded from the specified website and unzipped. This creates getdata.zip and the 'UCI HAR Dataset' unzipped folder (refer to README.txt and features_info.txt to learn more about the data, variables, folder structure, etc.).
2) Combine the training data using the cbind() function [X_train.txt (measurements), y_train.txt (activities), and subject_train.txt (subject identifier)], and do the same for the test data. Set the train and test data together using the rbind() function to create one dataset.
3) Read in the features and activity_labels txt files to assist with creating user-friendly, descriptive variable names/labels. The features dataset contains variable names for the X_* data and the y_* data contain activity ID which align with the activity_labels dataset. Retain only the mean, mean(), and standard deviation, std(), variables for each measurement. 
4) Create and output an independent tidy dataset with the average of each variable for each activity and each subject.


   
   