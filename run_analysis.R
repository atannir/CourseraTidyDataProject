## From problem description:
## You should create one R script called run_analysis.R that does the following. 
##
## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement. 
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names. 
## Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
##
##From the submission instructions:
## Please upload your data set as a txt file created with write.table() using row.name=FALSE
## (do not cut and paste a dataset directly into the text box, as this may cause errors saving your submission).

## We begin by putting the script in the same directory where we have the dataset directory
## (One level up from the actual data files, like features.txt)

## Step 1-1:
## READ ALL THE DATA!!

## basedir <- "UCI HAR Dataset/"
features <- read.table("UCI HAR Dataset/features.txt") ## 561 obs of 2 vars, rownums incl

x_test <- read.table("UCI HAR Dataset/test/X_test.txt") ## 2947 obs of 561 vars
y_test <- read.table("UCI HAR Dataset/test/y_test.txt") ## 2947 obs of 1 var
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt") ## 2947 obs of 1 v

x_train <- read.table("UCI HAR Dataset/train/X_train.txt") ## 7352 of 561 v
y_train <- read.table("UCI HAR Dataset/train/y_train.txt") ## 7352 of 1 v
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt") ## 7352 of 1 v

## Step 1-2:
## Stick it together




