# Code Book for tidy data set 

This document describes the data in each column of the tidy data set produced by run_analysis() function in run_analysis.R.

The source data are measurements collected by a Samsung Galaxy S II smart phone's 3-axis accelerometer and 3-axis gyroscope, as a subject performs 6 different activities. The experiment used 30 subjects aged between 19-48. 

The raw data from the phone were split into 2.56s time windows - at 50Hz sampling rate, this yields 128 samples 
per time window. In each time window, noise filters were applied. The noise-filtered accelerometer data was split 
into gravity and body motion components. 

A Fourier transform was applied to the sensor data to yield frequency spectrum data.

The tidy-data produced by run_analysis() are the averaged values of each measurement for each activity and subject. This 
gives a dataset with 6x30=180 observations (rows). 

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
by the subjects.  All measurements are normlaized to range of [-1,+1]

- body-acc-mean-x/y/z : mean value of phone accelerometer data in x/y/z axis due to subject's body 
- body-acc-std-x/y/z : standard deviation of phone accelerometer data in x/y/z axis due to subject's body 

- gravity-acc-mean-x/y/z : mean value of phone accelerometer data in x/y/z axis due to gravity
- gravity-acc-std-x/y/z : standard deviation of phone accelerometer data in x/y/z axis due to gravity

The acc-jerk is defined as the rate of change of the phone accelerometer value (rate of change of acceleration)
- body-acc-jerk-mean-x/y/z : mean jerk measured by phone accelerometer in x/y/z axis due to subject's body
- body-acc-jerk-std-x/y/z : standard deviation of jerk measured by phone accelerometer in x/y/z axis due to subject's body

- body-gyro-mean-x/y/z : mean value of phone gyroscope data in x/y/z axis due to subject's body
- body-gyro-std-x/y/z : standard deviation of phone gyroscope data in x/y/z axis due to subject's body

The gyro-jerk is defined as the rate of change of the phone gyroscope value (rate of change of angular velocity)
- body-gyro-jerk-mean-x/y/z : mean jerk measured by phone gyroscope in x/y/z axis due to subject's body
- body-gyro-std-x/y/z : standard deviation of jerk measured by gyroscope in x/y/z axis due to subject's body

The acc-mag is the Euclidean norm of the 3-axis accelerator values
- body-acc-mag-mean : mean magnitude of phone accelerometer due to subject's body
- body-acc-mag-std : standard deviation of magnitude measured by phone accelerometer due to subject's body
- gravity-acc-mag-mean : mean magnitude of phone accelerometer from gravity; 
- gravity-acc-mag-std : standard deviation of magnitude measured by phone accelerometer due to gravit

The acc-jerk-mag is the Euclidean norm of the 3-axis accelerometer jerk values
- body-acc-jerk-mag-mean : mean magnitude of accelerometer jerk due to subject's body
- body-acc-jerk-mag-std : standard deviation of acceleromter jerk due to subject's body

The gyro-mag is the Euclidean norm of the 3-axis gyroscope values
- body-gyro-mag-mean : mean magnitude of phone gyroscope due to subject's body; 
- body-gyro-mag-std : standard deviation of magnitude of phone accelerometer due to subject's body

The gyro-jerk-mag is the Euclidean norm of the 3-axis gyroscope jerk values
- body-gyro-jerk-mag-mean : mean magnitude of gyroscope jerk values due to subject's body 
- body-gyro-jerk-mag-std : standard deviation of magnitude of gyroscope jerk due to subject's body; 

The next set of measurements are results from the Fourier transform of the time domain data.
- freq-body-acc-mean-x/y/z : mean frequency of phone accelerometer data in x/y/z axis
- freq-body-acc-std-x/y/z : standard deviation of frequency of phone accelerometer data in x/y/z axis

The meanfreq is the weighted average of the frequency components to obtain a new frequency
- freq-body-acc-meanfreq-x/y/z : weighted mean frequency of phone accelerometer data in x/y/z axis 

- freq-body-acc-jerk-mean-x/y/z : mean frequency of accelerometer jerk data in x/y/z axis
- freq-body-acc-jerk-std-x/y/z : standard deviation of frequency of accelerometer jerk data in x/y/z axis

- freq-body-acc-jerk-meanfreq-x/y/z : weighted mean frequency of phone accelerometer jerk data in x/y/z axis 

- freq-body-gyro-mean-x/y/z : mean frequency of phone gyroscope data in x/y/z axis
- freq-body-gyro-std-x/y/z : standard deviation of frequency of phone gyroscope data in x/y/z axis

- freq-body-gyro-meanfreq-x/y/z : weighted mean frequency of phone gyroscope data in x/y/z axis 

- freq-body-acc-mag-mean : mean frequency magnitude of phone accelerometer data 
- freq-body-acc-mag-std : standard deviation of frequency magnitude of phone accelerometer data 
- freq-body-acc-mag-meanfreq : mean weighted frequency magnitude of phone acceleromter data
 
- freq-body-acc-jerk-mag-mean : mean frequency magnitude of phone accelerometer jerk data 
- freq-body-acc-jerk-mag-std : standard deviation of frequency magnitude of phone accelerometer jerk data 
- freq-body-acc-jerk-mag-meanfreq : mean weighted frequency magnitude of phone acceleromter jerk data

- freq-body-gyro-mag-mean : mean frequency magnitude of phone gyroscope data 
- freq-body-gyro-mag-std : standard deviation of frequency magnitude of phone gyroscope data 
- freq-body-gyro-mag-meanfreq : mean weighted frequency magnitude of phone gyroscope data
 
- freq-body-gyro-jerk-mag-mean : mean frequency magnitude of phone gyroscope jerk data 
- freq-body-gyro-jerk-mag-std : standard deviation of frequency magnitude of phone gyroscope jerk data 
- freq-body-gyro-jerk-mag-meanfreq : mean weighted frequency magnitude of phone gyroscope jerk data





