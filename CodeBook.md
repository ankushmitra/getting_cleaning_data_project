# Code Book for tidy data set 

This document describes the data in each column of the tidy data set produced by run_analysis() function in run_analysis.R.

The first and second column of the tidy data set are the subject ID and activity, respectively.  
- subjectID:  A number between 1 and 30 that identifies the subject performing the activity
- activity: the task the subject performed when the measurments were taken. During the study, 6 activties were performed
  1. WALKING (walking) 
  2. WALKING_UPSTAIRS  (walking up stairs)
  3. WALKING_DOWNSTAIRS (waling down stairs)
  4. SITTING  (sitting)
  5. STANDING  (standing)
  6. LAYING   (laying down)

The remaining columns are individual measurments extracted from the phone's accelerometer and gyroscope carried 
by the subjects. Each measurment name is a collection of terms joined by dashes ("-"). The definition of each term 
is given below:

- body: measurement associated with subject's body motion
- gravity: measurement associated with gravity
- acc : acceleration measured by the accelerometer 
- gyro: angular acceleration measured by the gyroscope
- mean : average
- std: standard deviation
- x : x-component
- y : y-component
- z : z-component
- jerk: [units?]
- mag :
- freq: the frequency [hz]
- 




