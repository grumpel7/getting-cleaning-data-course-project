###########################################################
## PART 1: Downloading and unzipping the downloaded file.
########################################################### 

## set your current directory - IMPORTANT! Customize this to your desired local directory
setwd("C:/Users/garp/My Documents/R/3gettingcleaningcoursera/courseproject")
## create a data directory if it does not exist
if (!file.exists("./data")) {
        dir.create("./data")
}

## assign location of the dataset to fileURL
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
## download the file and record date when it was downloaded
download.file(fileURL, destfile="./data/courseproject.zip")
dateDownloaded <- date()

## unzip files into the same data folder
unzip("./data/courseproject.zip", exdir="./data")

print("File is downloaded and unzipped. Merging data now.")

####################################################################
## PART 2: Reading in the data files and merging (and sorting) them. 
####################################################################

# reading the test datafiles (3): subject, X and Y. Assign column labels
testsubject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
names(testsubject) <- "subject"

testx <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
## read in the feature files and assign the second column as labels for testx
featurelabels <- read.table("./data/UCI HAR Dataset/features.txt")
names(testx) <- featurelabels[,2]

testy <- read.table("./data/UCI HAR Dataset/test/Y_test.txt")
names(testy) <- "activity"

# reading the train data files (3): subject, X and Y 
trainsubject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
names(trainsubject) <- "subject"

trainx <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
## assign the second column of featurelabels as labels for trainx
names(trainx) <- featurelabels[,2]

trainy <- read.table("./data/UCI HAR Dataset/train/Y_train.txt")
names(trainy) <- "activity"

# merge the train data files and the test data files (separately). Fixed variables before measured variables
test <- cbind(testsubject,testy,testx)
train <- cbind(trainsubject,trainy,trainx)

# merge train and test data files. No need to use join since there are no subject overlap
alldata <- rbind(test,train)

# sort the final data set by subject ID first, then activity using the plyr package
library(plyr)
finalmerged <- arrange(alldata,subject,activity)

print("Data sets have been merged into one big data frame called finalmerged. Onto tidying the data.")

########################################################################
## PART 3: Extract only desired variables and creating a tidy data set.
########################################################################

## Extract the subject and activity columns and any columns that contain the string
## "mean()" or "std" into a data frame 'selected'. Exclude meanFreq features
selected <- finalmerged[,grepl("^subject$|mean\\(\\)|std|^activity$", names(finalmerged))]

## get rid of the double instance of "Body" in the f-variables.
names(selected) <- gsub("BodyBody", "Body", names(selected))

## get rid of any non-alphabetic characters in the column names
names(selected) <- gsub("[^[:alnum:] ]", "", names(selected))

## turn every upper case character into lower case.
names(selected) <- tolower(names(selected))

## make each column label more descriptive: 
## expand the initial f to "freq" and t to "time"
names(selected) <- gsub("^f","freq", names(selected))
names(selected) <- gsub("^t","time", names(selected))


## substitute the activity code with actual measures (= activity names, not numbers)
## -includes the use of the activity_label.txt file
activitymapping <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
for ( i in 1:6 ) {
        selected$activity <- gsub(activitymapping[i,1],activitymapping[i,2],selected$activity)
}

print("Extracted desired variables, cleaned up variable names, replaced activity codes with actual words. Now tidying.")

########################################################################
## PART 3: Extract only desired variables and creating a tidy data set.
########################################################################

## Extract the subject and activity columns and any columns that contain the string
## "mean()" or "std" into a data frame 'selected'. Exclude meanFreq features
selected <- finalmerged[,grepl("^subject$|mean\\(\\)|std|^activity$", names(finalmerged))]

## get rid of the double instance of "Body" in the f-variables.
names(selected) <- gsub("BodyBody", "Body", names(selected))

## get rid of any non-alphabetic characters in the column names
names(selected) <- gsub("[^[:alnum:] ]", "", names(selected))

## turn every upper case character into lower case.
names(selected) <- tolower(names(selected))

## make each column label more descriptive: 
## expand the initial f to "freq" and t to "time"
names(selected) <- gsub("^f","freq", names(selected))
names(selected) <- gsub("^t","time", names(selected))


## substitute the activity code with actual measures (= activity names, not numbers)
## -includes the use of the activity_label.txt file
activitymapping <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
for ( i in 1:6 ) {
        selected$activity <- gsub(activitymapping[i,1],activitymapping[i,2],selected$activity)
}

## Using melt to create a long data set
library(tidyr)
## changing type of subject from integer to factor so it (and activity) will be interpreted as ID variables.
## the feature variables are value variables
selected$subject <- factor(selected$subject)
selectedmelt <- melt(selected)

## calculate the average for each of the 66 features (= variables) by subject's activity (30 x 6)
## renaming column "variable" to "feature" and "value" to "average" to be more descriptive.
tidyset <- ddply(selectedmelt, c("subject", "activity","variable"), summarise, mean = mean(value))
names(tidyset) <- c("subject","activity","feature","average")

## optional: if you like to look at the data set in a wide format, use dcast to show the averages of the 
## mean and standard deviation variable values as columns.
## selectedwide <- dcast(tidyset, subject + activity ~ feature)

## write the data into an external text file
write.table(tidyset, file = "./data/course_project_tidy.txt", row.names = FALSE)

print("run_analysis.R script has finished. Tidy set has been written into the file data/course_project_tidy.txt")
