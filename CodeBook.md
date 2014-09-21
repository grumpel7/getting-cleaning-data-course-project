Codebook: Getting and Cleaning Data Course Project, September 2014

This codebook describes in detail the tidy data set content created in run_analysis.R and uploaded alongside this codebook and the README file.

Description of the original data is available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

This codebook relied heavily on the README and features_info.text files contained in the original data zip file that was downloaded (see README.md)

subject
   Thirty experiment volunteers within the age bracket 19-48 wearing smartphone Samsung Galaxy SII.
   1..30  .Subject identifier assigned
   
activity
   Activty performed by volunteer while wearing smartphone.
   WALKING .walking (neither upstairs nor downstairs)
   WALKING_UPSTAIRS .walking upstairs
   WALKING_DOWNSTAIRS .walking downstairs
   SITTING .sitting down
   STANDING .standing
   LAYING .laying down
   
feature
   Time and frequency domain signal variables.
   timebodyaccmeanx .Mean time domain signal of the body acceleration along the X-axis
   timebodyaccmeany .Mean time domain signal of the body acceleration along the Y-axis
   timebodyaccmeanz .Mean time domain signal of the body acceleration along the Z-axis
   timebodyaccstdx .Standard deviation of the time domain signal of the body acceleration along the X-axis
   timebodyaccstdy .Standard deviation of the time domain signal of the body acceleration along the Y-axis
   timebodyaccstdz .Standard deviation of the time domain signal of the body acceleration along the Z-axis
   timegravityaccmeanx .Mean time domain signal of the gravity acceleration along the X-axis  
   timegravityaccmeany .Mean time domain signal of the gravity acceleration along the Y-axis  
   timegravityaccmeanz .Mean time domain signal of the gravity acceleration along the Z-axis  
   timegravityaccstdx .Standard deviation of the time domain signal of the gravity acceleration along the X-axis  
   timegravityaccstdy .Standard deviation of the time domain signal of the gravity acceleration along the Y-axis
   timegravityaccstdz .Standard deviation of the time domain signal of the gravity acceleration along the Z-axis
   timebodyaccjerkmeanx .Mean time domain signals of body acceleration jerk signals along the X-axis
   timebodyaccjerkmeany .Mean time domain signals of body acceleration jerk signals along the Y-axis
   timebodyaccjerkmeanz .Mean time domain signals of body acceleration jerk signals along the Z-axis
   timebodyaccjerkstdx .Standard deviation of the time domain signals of body acceleration jerk signals along the X-axis
   timebodyaccjerkstdy .Standard deviation of the time domain signals of body acceleration jerk signals along the Y-axis
   timebodyaccjerkstdz .Standard deviation of the time domain signals of body acceleration jerk signals along the Z-axis
   timebodygyromeanx .Mean time domain signals of body orientation along the X-axis
   timebodygyromeany .Mean time domain signals of body orientation along the Y-axis
   timebodygyromeanz .Mean time domain signals of body orientation along the Z-axis
   timebodygyrostdx .Standard deviation of the time domain signals of body orientation along the X-axis
   timebodygyrostdy .Standard deviation of the time domain signals of body orientation along the Y-axis
   timebodygyrostdz .Standard deviation of the time domain signals of body orientation along the Z-axis
   timebodygyrojerkmeanx .Mean time domain signals of body orientation jerk along the X-axis
   timebodygyrojerkmeany .Mean time domain signals of body orientation jerk along the Y-axis
   timebodygyrojerkmeanz .Mean time domain signals of body orientation jerk along the Z-axis
   timebodygyrojerkstdx .Standard deviation of the time domain signals of body orientation jerk along the X-axis
   timebodygyrojerkstdy .Standard deviation of the time domain signals of body orientation jerk along the Y-axis
   timebodygyrojerkstdz .Standard deviation of the time domain signals of body orientation jerk along the Z-axis
   timebodyaccmagmean .Mean time domain signals of body acceleration magnitude
   timebodyaccmagstd .Standard deviation of the time domain signals of body acceleration magnitude
   timegravityaccmagmean .Mean time domain signals of gravity acceleration magnitude
   timegravityaccmagstd .Standard deviation of the time domain signals of gravity acceleration magnitude
   timebodyaccjerkmagmean .Mean time domain signals of body acceleration jerk magnitude
   timebodyaccjerkmagstd .Standard deviation of the time domain signals of body acceleration jerk magnitude
   timebodygyromagmean .Mean time domain signals of body orientation  magnitude
   timebodygyromagstd .Standard deviation of the time domain signals of body orientation  magnitude
   timebodygyrojerkmagmean .Mean time domain signals of body orientation  jerk magnitude
   timebodygyrojerkmagstd .Standard deviation of the time domain signals of body orientation  jerk magnitude
   freqbodyaccmeanx .Mean frequency domain signal of the body acceleration along the X-axis
   freqbodyaccmeany .Mean frequency domain signal of the body acceleration along the Y-axis
   freqbodyaccmeanz .Mean frequency domain signal of the body acceleration along the Z-axis
   freqbodyaccstdx .Standard deviation of the frequency domain signal of the body acceleration along the X-axis
   freqbodyaccstdy .Standard deviation of the frequency domain signal of the body acceleration along the Y-axis
   freqbodyaccstdz .Standard deviation of the frequency domain signal of the body acceleration along the Z-axis
   freqbodyaccjerkmeanx .Mean frequency domain signals of body acceleration jerk signals along the X-axis
   freqbodyaccjerkmeany .Mean frequency domain signals of body acceleration jerk signals along the Y-axis
   freqbodyaccjerkmeanz .Mean frequency domain signals of body acceleration jerk signals along the Z-axis
   freqbodyaccjerkstdx .Standard deviation of the frequency domain signals of body acceleration jerk signals along the X-axis
   freqbodyaccjerkstdy .Standard deviation of the frequency domain signals of body acceleration jerk signals along the Y-axis
   freqbodyaccjerkstdz .Standard deviation of the frequency domain signals of body acceleration jerk signals along the Z-axis
   freqbodygyromeanx .Mean frequency domain signals of body orientation along the X-axis
   freqbodygyromeany .Mean frequency domain signals of body orientation along the Y-axi
   freqbodygyromeanz .Mean frequency domain signals of body orientation along the Z-axis
   freqbodygyrostdx .Standard deviation of frequency domain signals of body orientation along the X-axis
   freqbodygyrostdy .Standard deviation of frequency domain signals of body orientation along the Y-axis
   freqbodygyrostdz .Standard deviation of frequency domain signals of body orientation along the Z-axis
   freqbodyaccmagmean .Mean frequency domain signals of body acceleration magnitude
   freqbodyaccmagstd .Standard deviation of the frequency domain signals of body acceleration magnitude
   freqbodyaccjerkmagmean .Mean frequency domain signals of body acceleration jerk magnitude
   freqbodyaccjerkmagstd .Standard deviation of the frequency domain signals of body acceleration jerk magnitude
   freqbodygyromagmean .Mean frequency domain signals of body orientation magnitude
   freqbodygyromagstd .Standard deviation of the frequency domain signals of body orientation magnitude
   freqbodygyrojerkmagmean .Mean frequency domain signals of body orientation jerk magnitude
   freqbodygyrojerkmagstd .Standard deviation of the frequency domain signals of body orientation jerk magnitude


average
   Average value for each feature for a given subject and activity.
   -0.9999999999 .. 0.9999999999 .normalized feature average



        

