# CodeBook file explaining transformations
## Variable neams in the script
Run analysis script performing all necessary transformation to clean the data set using dplyr
* colNames stores feature names and is used as solumn names
* dfTrain stores Train data set
* dfTrainLabels stores data set with train set activities
* dfTrainSub contains subjects for train data set
* dfTest contains Test data set
* dfTestLabels contains activity labels for test data set
* dfTestSub contains subjects for train data set
* dfData contains merged data set
* dfDataExtr contains data set with std and mean columns only
* dfAct is a data set with activity labels
* dfTidy is a tidy data set with mean calulated by all columns grouped by subject and activity

## Transformations
The following transformation has been applied:
* Load column names first (features)
* Remove column numbers
* Load train data set to data frame
* Load train data set labels
* Add labels to the train data set
* Load train data set subjects
* Add subjects to the train data set
* Load test data set to data frame
* Load test data set labels
* Add labels to the test data set
* Load train data set subjects
* Add subjects to the train data set
* Merge or rather append data sets
* Extract only meand and std
* Fix column names to use better descriptions
* Load data frame with activity names
* Merge activitiy data frame to get descriptions
* Group data by activity and category
* Create tidy data set by grouping the data and calculating mean for std and mean variables
