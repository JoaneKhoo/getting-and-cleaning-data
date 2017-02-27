run_analysis <- function() {
  ##Read features.txt data sets
  d_features <- read.table("features.txt")
  
  ##Read activity_labels.txt data sets
  d_activitylabels <- read.table("activity_labels.txt")
  names(d_activitylabels) <- c("activityid","activityname")

  ##Read test set, activity labels and subject
  ##Assign proper column names
  d_testset <- read.table("test/X_test.txt")
  names(d_testset) <- d_features$V2
  
  d_testactivity <- read.table("test/y_test.txt")
  colnames(d_testactivity) <- "activityid"
  
  d_testsubject <- read.table("test/subject_test.txt")
  colnames(d_testsubject) <- "subjectid"
  
  ##Merge test set, activity labels and subject
  merge_test <- cbind(d_testsubject, d_testactivity, d_testset)
  
  ##Extracts only the measurements on the mean and standard deviation
  d_test <- merge_test[,c(1,2,grep("[Mm][Ee][Aa][Nn]|[Ss][Tt][Dd]", names(merge_test)))]
  
  ##Get activity labels
  d_testmerge <- merge(d_test, d_activitylabels)
  
  ##Read train set, activity labels and subject
  ##Assign proper column names
  d_trainset <- read.table("train/X_train.txt")
  names(d_trainset) <- d_features$V2
  
  d_trainactivity <- read.table("train/y_train.txt")
  names(d_trainactivity) <- "activityid"
  
  d_trainsubject <- read.table("train/subject_train.txt")
  names(d_trainsubject) <- "subjectid"
  
  ##Merge train set, activity labels and subject
  merge_train <- cbind(d_trainsubject, d_trainactivity, d_trainset)
  
  ##Extracts only the measurements on the mean and standard deviation
  d_train <- merge_train[,c(1,2,grep("[Mm][Ee][Aa][Nn]|[Ss][Tt][Dd]", names(merge_train)))]
  
  ##Get activity labels
  d_trainmerge <- merge(d_train, d_activitylabels)
  
  ##Combine test and train data set
  d_cleaneddata <- rbind(d_testmerge, d_trainmerge)
  write.table(d_cleaneddata, "cleaned_data.txt", row.names = FALSE)
  
  ##Create independent tidy data set with the average of each variable for each activity and each subject
  d_avgdata <- aggregate(d_cleaneddata, by = list(subject_id=d_cleaneddata$subjectid, activity_id=d_cleaneddata$activityid), FUN = "mean")
  write.table(d_avgdata, "avg_data.txt", row.names = FALSE)
}