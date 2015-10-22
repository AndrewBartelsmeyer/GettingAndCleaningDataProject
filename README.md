Getting and Cleaning Data - Course Project
==========================================

Andrew Bartelsmeyer

21 October 2015

This repository hosts the R code and documentation files for the  "Getting and Cleaning Data" course from Coursera. The code contained wherein will do the following (quoted from assignment page):

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The dataset being used is: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Files

The user is required to have the dataset already stored locally.

`CodeBook.md` describes the variables, the data, and any transformations or work that was performed to clean up the data.

`run_analysis.R` will perform the steps listed above, including saving the average values of each variable in a text file, `DataMeans.txt`.