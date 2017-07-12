# CleaningDataCourseProject
## Files
The following files are available:
* CodeBook.md - code book for R variables in the script
* run_analysis.R - script transforming data
* TidyData.txt - exported data set
* UCI HAR Dataset - folder with the source data set

## Transformation applied to the data read from the files:
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
