## Run analysis script performing all necessary transformation to clean the data set
library(dplyr)
## Let's load column names first (features)
colNames<-scan("./UCI HAR DataSet/features.txt", character(), quote="")

## Remove column numbers
colNames<-colNames[seq(1,length(colNames),2)+1]

## Let's import train data set
dfTrain<-read.table("./UCI HAR DataSet/train/X_train.txt", col.names = colNames)
colnames(dfTrain)<-colNames
## Now train data set labels
dfTrainLabels<-read.table("./UCI HAR DataSet/train/y_train.txt", col.names = c("Activity"))
## Add labels to the train data set
dfTrain<-cbind(dfTrain,dfTrainLabels)
## Now train data set subjects
dfTrainSub<-read.table("./UCI HAR DataSet/train/subject_train.txt", col.names = c("Subject"))
## Add subjects to the train data set
dfTrain<-cbind(dfTrain,dfTrainSub)

## Let's import test data set
dfTest<-read.table("./UCI HAR DataSet/test/X_test.txt", col.names = colNames)
colnames(dfTest)<-colNames
## Now test data set labels
dfTestLabels<-read.table("./UCI HAR DataSet/test/y_test.txt", col.names = c("Activity"))
## Add labels to the test data set
dfTest<-cbind(dfTest,dfTestLabels)
## Now train data set subjects
dfTestSub<-read.table("./UCI HAR DataSet/test/subject_test.txt", col.names = c("Subject"))
## Add subjects to the train data set
dfTest<-cbind(dfTest,dfTestSub)


## Merge or rather append data sets
dfData<-rbind(dfTrain,dfTest)

## Extract only meand and std
dfDataExtr<-dfData[,grep("*mean\\(\\)+|*std()*|Activity|Type|Subject",names(dfData))]

## Let's load now activities
dfAct<-read.table("./UCI HAR DataSet/activity_labels.txt", col.names = c("Activity","ActivityLabel"))
## Merge activitiy data frame to get descriptions
dfDataExtr<-merge(dfDataExtr,dfAct, by.x = "Activity", by.y = "Activity", all = TRUE)
dfDataExtr<-dfDataExtr[,!(names(dfDataExtr) %in% c("Activity"))]

## Name it with descriptive names
names(dfDataExtr)<-gsub("Acc","Accelerator",names(dfDataExtr))
names(dfDataExtr)<-gsub("Mag","Magnitude",names(dfDataExtr))
names(dfDataExtr)<-gsub("Gyro","Gyroscope",names(dfDataExtr))
names(dfDataExtr)<-gsub("^t","time",names(dfDataExtr))
names(dfDataExtr)<-gsub("^f","frequency",names(dfDataExtr))

##Group data by activity and category
## Time to group data and calculate mean for std and mean variables
dfTidy<-dfDataExtr %>% 
        group_by(Subject, ActivityLabel) %>%
        summarise_all("mean")
## Write data to the disk
write.table(dfTidy,"TidyData.txt", row.name=FALSE)