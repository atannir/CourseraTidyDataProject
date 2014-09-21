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

## Using R 3.1.1

library("reshape2")

## Step 1-1:
## READ ALL THE DATA!!

## basedir <- "UCI HAR Dataset/"
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

features <- read.table("UCI HAR Dataset/features.txt") ## 561 obs of 2 vars, rownums incl
features <- features[2] ## simplify, cut row numbers
features <- as.vector(features[,1]) ## it works, but not pretty.

x_test <- read.table("UCI HAR Dataset/test/X_test.txt", colClasses = c("numeric"), col.names = features) ## 2947 obs of 561 vars
y_test <- read.table("UCI HAR Dataset/test/y_test.txt") ## 2947 obs of 1 var
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt") ## 2947 obs of 1 v

## take only the columns we want
x_test <- x_test[c(201, 202, 214, 215, 227, 228, 240, 241, 253, 254, 503, 504, 516, 517, 529, 530, 542, 543)]

x_test[,"activity"] <- y_test
x_test$activity <- as.factor(x_test$activity)
x_test[, "subject"] <- subject_test
x_test$subject <- as.factor(x_test$subject)

## Ugly but it will do
x_test$activity_labels <- x_test$activity
x_test$activity_labels <- factor(x_test$activity_labels, levels = c(1,2,3,4,5,6),
                                 labels = c("WALKING","WALKING_UPSTAIRS",
                                            "WALKING_DOWNSTAIRS","SITTING",
                                            "STANDING","LAYING"))


x_train <- read.table("UCI HAR Dataset/train/X_train.txt", colClasses = c("numeric"), col.names = features) ## 7352 of 561 v
y_train <- read.table("UCI HAR Dataset/train/y_train.txt") ## 7352 of 1 v
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt") ## 7352 of 1 v
 
x_train <- x_train[c(201, 202, 214, 215, 227, 228, 240, 241, 253, 254, 503, 504, 516, 517, 529, 530, 542, 543)]

x_train[,"activity"] <- y_train
x_train$activity <- as.factor(x_train$activity)
x_train[, "subject"] <- subject_train
x_train$subject <- as.factor(x_train$subject)

x_train$activity_labels <- x_train$activity
x_train$activity_labels <- factor(x_train$activity_labels, levels = c(1,2,3,4,5,6),
                                 labels = c("WALKING","WALKING_UPSTAIRS",
                                            "WALKING_DOWNSTAIRS","SITTING",
                                            "STANDING","LAYING"))

## Step 1-2:
## merge all data, free up memory

all_data <- rbind(x_test, x_train)
# 
# rm(subject_test)
# rm(x_test)
# rm(y_test)
# rm(subject_train)
# rm(x_train)
# rm(y_train)
# rm(features)

#Perform the aggregation on the combined dataset


#write the file out.