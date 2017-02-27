# CODEBOOK

## Overview
This document describes the variables of the analysis and the extract, transform and load steps to produce the tidy and aggregated dataset.

## Dataset
The UCI HAR Dataset includes the following files:
- 'features.txt'            : List of all features.
- 'activity_labels.txt'     : Links the class labels with their activity name.
Training dataset
- 'train/X_train.txt'       : Training set.
- 'train/y_train.txt'       : Training activity id.
- 'train/subject_train.txt' : Each row identifies the subject who performed the activity for each window sample.
Test dataset
- 'test/X_test.txt'         : Test set.
- 'test/y_test.txt'         : Test activity id.
- 'test/subject_test.txt'   : Each row identifies the subject who performed the activity for each window sample.

## Transformation
The purpose of the transformation is to clean and merge the training and test data and create one dataset. <br>
Below are the transformations of the raw data set:<br>
1. The test and training sets ('train/X_train.txt' and 'test/X_test.txt') do not contain feature header names.<br>
2. Feature header names can be obtained from 'features.txt'.<br>
3. The test and training activity id ('train/y_train.txt' and 'test/y_test.txt') can be linked to 'activity_labels.txt' to obtain the        activity name.<br>
4. 'train/X_train.txt', 'train/subject_train.txt' and 'train/y_train.txt' columns need to be merge as one train data set.  <br>
5. 'test/X_test.txt', 'test/subject_test.txt' and 'test/y_test.txt' columns need to be merge as one test data set.  <br>
6. Both train and test datasets rows are to be merged as one cleaned dataset. <br>
7. Finally, aggregate the cleaned dataset using mean function by the subject id and acitivity id to create an average datasets. 

Codebook:<br>
1. Read features.txt data sets<br>
2. Read activity_labels.txt data sets and name the columns as "activityid","activityname"<br>
3. Read test set, activity labels and subject and assign proper column names. The test header names are obtained from the features.txt<br>
4. Merge test set, activity labels and subject as one test dataset<br>
5. Extracts only the measurements on the mean and standard deviation from the merged test data set<br>
6. Get activity_labels.txt labels into the merged test data set<br>
7. Read train set, activity labels and subject and assign proper column names. The train header names are obtained from the features.txt<br>
8. Merge train set, activity labels and subject as one train dataset<br>
9. Extracts only the measurements on the mean and standard deviation from the merged train data set<br>
10. Get activity_labels.txt into the merged train data set<br>
11. Combine test and train data set<br>
12. Create independent tidy data set with the average of each variable for each activity and each subject<br>
13. Write the average data into  "avg_data.txt"<br>
