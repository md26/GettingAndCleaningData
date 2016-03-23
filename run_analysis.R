## Read test data:
xTest<- read.table("UCI HAR Dataset/test/X_test.txt")
yTest<- read.table("UCI HAR Dataset/test/Y_test.txt")
subjectTest <-read.table("UCI HAR Dataset/test/subject_test.txt")

## Read train data:
xTrain<- read.table("UCI HAR Dataset/train/X_train.txt")
yTrain<- read.table("UCI HAR Dataset/train/Y_train.txt")
subjectTrain <-read.table("UCI HAR Dataset/train/subject_train.txt")

## 1. Merges the training and the test sets to create one data set.
xMerged<-rbind(xTest, xTrain)
yMerged<-rbind(yTest, yTrain)
subjectMerged<-rbind(SubjectTest, SubjectTrain)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
index<-grep("mean\\(\\)|std\\(\\)", features[,2])
length(index)
xMerged<-xMerged[,index]
dim(x)

## 3. Uses descriptive activity names to name the activities in the data set
## Read activities
activity<-read.table("UCI HAR Dataset/activity_labels.txt")

yMerged[,1]<-activity[yMerged[,1],2]
head(y)

## 4. Appropriately labels the data set with descriptive variable names.
## Read features
features<-read.table("UCI HAR Dataset/features.txt")

names<-features[index,2]
names(xMerged)<-names
names(subjectMerged)<-"SubjectID"
names(yMerged)<-"Activity"
cleanedData<-cbind(subjectMerged, yMerged, xMerged)
head(cleanedData[,c(1:4)])

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
cleanedData<-data.table(cleanedData)
tidyData <- cleanedData[, lapply(.SD, mean), by = 'SubjectID,Activity']
dim(tidyData)
write.table(tidyData, file = "Tidy.txt", row.names = FALSE)
