# project-work
# assignment-getting-data-clean

# I have downloaded zip files from following link.
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Upziped files and kept file into my working directory. 

# Following code reads features.txt and activitiy_labels
setwd("C:/D drive/Digital strategy/field data/coursera/getting clean data/week4/UCI HAR Dataset")
feature <- read.table("features.txt", col.names = c("n","functions"))
activity <- read.table("activity_labels.txt", col.names = c("code_number", "activity"))

# Following script reads testing data set
setwd("C:/D drive/Digital strategy/field data/coursera/getting clean data/week4/UCI HAR Dataset/test")
subject_test <- read.table("subject_test.txt", col.names = "subject")

x_test <- read.table("X_test.txt", col.names = feature$functions)
y_test <- read.table("y_test.txt", col.names = "code_number")


# Following script reads training data set 
setwd("C:/D drive/Digital strategy/field data/coursera/getting clean data/week4/UCI HAR Dataset/train")
subject_train <- read.table("subject_train.txt", col.names = "subject")
x_train <- read.table("X_train.txt", col.names = feature$functions)
y_train <- read.table("y_train.txt", col.names = "code_number")

# merging data set for training and test data

X_common <- rbind(x_train,x_test)
Y_common <- rbind(y_train,y_test)
subject_common <- rbind(subject_train,subject_test)
subject_common <- cbind(subject_common,X_common,Y_common)

# extract only the measurements with mean and stadard deviation
consolidate <- select(subject_common,subject,code_number,contains("mean"),contains("std"))

# use of descriptive activity names
consolidate$code_number <- activity[consolidate$code_number,2]

## label data with descriptive variable names
names(consolidate)[2] = "Activity_type"
names(consolidate)<-gsub("-std()", "STD", names(consolidate), ignore.case = TRUE)
names(consolidate)<-gsub("-freq()", "Frequency", names(consolidate), ignore.case = TRUE)
names(consolidate)<-gsub("^t", "Time", names(consolidate), ignore.case = TRUE)
names(consolidate)<-gsub("^f", "Frequency", names(consolidate), ignore.case = TRUE)
names(consolidate)<-gsub("BodyBody", "Body", names(consolidate), ignore.case = TRUE)
names(consolidate)<-gsub("Mag", "Magnitude", names(consolidate), ignore.case = TRUE)
names(consolidate)<-gsub("angle", "Angle", names(consolidate), ignore.case = TRUE)
names(consolidate)<-gsub("gravity", "Gravity", names(consolidate), ignore.case = TRUE)
names(consolidate)<-gsub("Acc", "Accelerometer", names(consolidate), ignore.case = TRUE)
names(consolidate)<-gsub("Gyro", "Gyroscope", names(consolidate), ignore.case = TRUE)
names(consolidate)<-gsub("tBody", "TimeBody", names(consolidate), ignore.case = TRUE)
names(consolidate)<-gsub("-mean()", "Mean", names(consolidate), ignore.case = TRUE)

## average of each varible from subject and activity
consolidate <- group_by(consolidate,consolidate$subject,consolidate$Activity_type)
summary_data <- summarise_all(consolidate,funs(mean))
write.table(summary_data,"summary_data.txt",row.names = FALSE)
