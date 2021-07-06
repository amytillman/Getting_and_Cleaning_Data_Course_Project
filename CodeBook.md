# Getting_and_Cleaning_Data_Course_Project
JHU data science course: Getting and Cleaning Data course project
Author: Amy Tillman

This is the course project for the Getting and Cleaning Data JHU Coursera course.
Data for the course project:
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  
A full description is available here:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The included R script (run_analysis.R) does the following (refer to codebook.md for more information):
1) If the data are not already downloaded, the data (zip file) are downloaded from the specified website and unzipped.
2) Combine the training data, X_* (measurements), y_* (activities), and subject_* (subject identifier), then do the same for the test data. Set the train and test data together to create one dataset.
3) Read in the features and activity_labels datasets to assist with creating user-friendly variable names/labels. Extract only the mean and standard deviation variables for each measurement. Use descriptive activity names to name the activities in the dataset and appropriately label the dataset with descriptive variable names. 
4) Create and output an independent tidy dataset with the average of each variable for each activity and each subject.

The Github repository [https://github.com/amytillman/Getting_and_Cleaning_Data_Course_Project](https://github.com/amytillman/Getting_and_Cleaning_Data_Course_Project) includes:
- run_analysis.R (R Script)
- a tidy dataset (tidy_dataset.txt) created from run_analysis.R
- a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md 
- a README.md in the repo with your scripts (this repo explains how all of the scripts work and how they are connected)
   
   