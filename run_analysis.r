## Getting And Cleaning Data, Coursera
## Course Project
## Andrew Bartelsmeyer
## 21 October 2015

setwd("~/Coursera/GettingAndCleaningData/ProjectFiles")
library(plyr)

## First we read all our data in from local files
features        <- read.table('./UCI_HAR_Dataset/features.txt') 
features[,2]    <- as.character(features[,2])
activityLabels  <- read.table('./UCI_HAR_Dataset/activity_labels.txt') 
activityLabels[,2] <- as.character(activityLabels[,2])

## This portion of code will allow us to only read in the parts of x_train and
## x_test that we actually care about. 
DataWanted      <- grep(".*mean.*|.*std.*", features[,2])
ColumnNames     <- features[DataWanted,2]

## Notice the [DataWanted] on the lines to read x_train and x_test
subjectTrain    <- read.table('./UCI_HAR_Dataset/train/subject_train.txt') 
xTrain          <- read.table('./UCI_HAR_Dataset/train/x_train.txt')[DataWanted]
yTrain          <- read.table('./UCI_HAR_Dataset/train/y_train.txt')
xTest           <- read.table("./UCI_HAR_Dataset/test/X_test.txt")[DataWanted]
yTest           <- read.table("./UCI_HAR_Dataset/test/Y_test.txt")
subjectTest     <- read.table("./UCI_HAR_Dataset/test/subject_test.txt")

## Now we merge our data frames together, and add labels to our columns
train <- cbind(subjectTrain, yTrain, xTrain)
test <- cbind(subjectTest, yTest, xTest)
AllTogetherNow <- rbind(train, test)
colnames(AllTogetherNow) <- c("subject","activity", ColumnNames)

## Apply activity labels, make subjects into factors
AllTogetherNow$activity <- factor(AllTogetherNow$activity, levels = activityLabels[,1], labels = activityLabels[,2])
## Now AllTogetherNow is ready for use and follows tidy data principles!

## Now time for finding our means
DataMeans <- ddply(AllTogetherNow, .(subject, activity), function(x) colMeans(x[, 3:81]))

## Print DataMeans to a text file
write.table(DataMeans, "DataMeans.txt", row.name=FALSE)