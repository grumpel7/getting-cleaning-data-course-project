This README file outlines what the "run_analysis.R" script does. The script, this README.md file and the codebook are all part of the course project for the Coursera Course "Getting and Cleaning Data" from the Data Science track offered by the John Hopkins University (September 2014 course).

Comments in the script provide additional context where necessary. 

By "tidy", I am referring to the "tidy data" definition as outlined in Hadley Wickham's August article in the Journal of Statistical software, available at http://www.jstatsoft.org/v59/i10 or as a tidyr version at http://t.co/C11KrXQxld):

        1. Each variable forms a column.
        2. Each observation forms a row.
        3. Each type of observational unit forms a table.

Enjoy! Jane

================================================================================================
The script has been sectioned into 3 parts:

Part 1: Downloading and unzipping the data set.
-----------------------------------------------
The zip file is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzipped into the "data"" folder of the working directory of the course project (which is defined with the setwd() function - IMPORTANT! You need to customize this value). This will create a new subfolder under "data"" called "UCI HAR Dataset", with data files (in the subfolders "test" and "train"), readme and label files and the associated raw data files (in the "Inertial Signals" folders).

A copy of the original zip folder remains in the course project's working directory after the unzipping. The date of the downloading will be automatically recorded in a variable called "dateDownloaded"

Part 2: Reading the data files and merging them into one dataset (data frame?).
-------------------------------------------------------------------------------

Firstly, I did not use the raw data files from the two "Inertial Signals" folders as they were not necessary for the objectives of the course project.

Secondly, I spent some time reading in the various text files and studying their dimensions and structure to understand what they contained. From this, I found out that:

>>      subject_test.txt and subject_train.txt contain the observation's subject ID. They were read into the data frames subjecttest and subjecttrain, respectively. Each had only 1 variable: an integer between 1 and 30 (there were only 30 subjects).

>>      X_test.txt and X_train.txt contain the 561 features associated with the observation. They were read into the data frames testx and trainx, respectively. Each had 561 variables (see features.txt and features_info.txt) that are all numeric.

>>      Y_test.txt and Y_train.txt contain the observation's activity code. They were read into the data frames testy and trainy, respectively. Each had 1 variable: an integer between 1 and 6 (there were only 6 activities)

>>      features.txt consists of two columns: column 1 is the row number while column 2 is the feature label. I used the second column of this file to create column names for the X values

>>      activity_labels.txt consists of a vector listing a number and the associated activity. In this case, I chose not ot use this file but instead just manually coded the labels with a vector c("walking", "walkingupstairs","walkingdownstairs","sitting","standing","laying")

To create one data table, all train data frames were merged and all test files were merged using cbind, resulting in two new data frames (train and test) - please note that the fixed variables (subject ID, activity code) are listed first, then the measured variables (features). 

Then the two new data frames were merged into one data frame (alldata) using rbind. Note that I did not use join or merge since the subjects are not duplicated between test and train.

The final resulting data frame (finalmerged) is sorted by subject ID first, then activity code, using the arrange command from the plyr package.


Part 3: Extract the desired variables (mean, std), make the variables more descriptive and manipulate the data set until it is tidy. 
-----------------------------------------------------------------------------------------
(a) The course project asks to extract "only the measurements on the mean and standard deviation for each measurement." Looking at the features_info.txt it is clear that in addition to the() "subject" and "activity" column, only columns which feature labels contain "mean()" or "std" should remain in the data set (which I interpret to exclude the mean frequencies ). This leaves the data set with 68 variables (66 features plus the subject and activity)

(b) To make the labels more descriptive, I  cleaned up the column names of the 68 variables:
- changed any instance of "BodyBody" to "Body" in the f-variables (I think this was an error since the features_info.txt) refers only to "Body"
- removed of any non-alphabetic characters in the column names
- converted every upper case character into lower case
- I decided against expanding the variable names as they would be quite lengthy and clutter up the screen when reviewing. Instead I would like to point you to the Codebook which will provide the fully written out name of the variable along with the description. 

For the activity measures which are only given as codes (integer), I substituted the activity code with the actual activity measure ("walking", etc.).

For the Subject identifiers, there are no subject information in the data set, so the subject identifier cannot be replaced with actual names of the subjects.

(c) To tidy the data, I decided to make sure that it needs to meets the principles as laid out in Hadley Wickham's Tidy Data article (see top of this file for the link). 

First I melted the wide data set "selected" with subject and activity as ID variables and the feature variables as value variables. I assigned this long data set to "selectedmelt". Then I used ddply to calculate the average for each feature variable for each subject's activity.

As an optional step I provided the code line to convert the tall (melted) data set back to a wide (dcasted) data set. I understand that both are considered to be tidy but I personally prefer the melted data set as tidy since it is easier to use the long version to continue further analysis in R.

In the end, the tall data set (tidyset) is of dimension 11880 x 4. the wide data set (selectedwide) is of dimension 180 x 68.

End Note:
-------------------------------------------------------------------------
The data file was saved with write.table. To read the data in for easy viewing please use the following code:

data <- read.table("./data/course_project_tidy.txt", header = TRUE)

use str, head, tail, dim etc to view the data frame

Sorry if I wrote too much...
Thanks,
jane



