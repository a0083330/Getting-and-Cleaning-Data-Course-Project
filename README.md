There are 5 files under this repository:
=========================================

- 'run_analysis.R': the script to execute the steps required for the assignment.

- 'README.md': the file to explain the script above and related files.

- 'resultData.txt': the output data set required as cleaned data.

- 'summarizeData.txt': the output data set required as summarized data.

- 'CodeBook.md': explains the content of the 2 txt files above

This file explains the run_analysis.R script.

<br /><br /><br />

The following explains how the 'run_analysis.R' script works.

Assumption:
=========================================

 - The script is run under an environment where 'dplyr' library is imported.

 - The script is run under the folder 'UCI HAR Dataset'.


The inputs of the script are:
=========================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


The inputs are given from the following files:
=========================================

- 'features.txt': List of all features, name of features.

- 'activity_labels.txt': List of names of activities performed.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training activity labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test activity labels.


The script does the following steps:
=========================================

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set.

4. Appropriately labels the data set with descriptive variable names. The result of step 4 is 'resultData.txt'

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. The result of step 5 is 'summarizeData.txt'


Outputs of the script are:
=========================================

- 'resultData.txt': data set outputted after step 4, refer to 'codebook-resultData.txt' for explanation.

- 'summarizeData.txt': data set outputted after step5, refer to 'codebook-summarizeData.txt' for explanation.
