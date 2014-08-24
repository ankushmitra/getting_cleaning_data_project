# run_analysis
# This script reads in the data collected from Galaxy smart phones.  The data
# is read in, merges the train and test data set, and extracts the mean and
# standard deviation of each measurement. 
#
# This script also creates a second data set that has the average of each variable
# for each measurement and each subject.


# Function that parses the handset data to create a tidy data set of the mean,
# and standard deviation of each measurement. 
run_analysis <- function() 
{
        print("Loading data")
        # Load the train and test as separate dataframes
        train_df <- load_data("train")
        test_df <- load_data("test")
        
        # Merge by adding rows
        phone_df <- rbind(train_df,test_df)
        
        # Use phone_df to create another data-frame that calculates the average
        # for each subject, activity, and measurment
        tidy_data_df <- second_dataset(phone_df)
        
        # Return the second dataframe        
        tidy_data_df
}


# load_data
# Load phone accelerometer and gyroscope data 
#
# input: dataset load
load_data <- function(dataset) 
{
        # Read the file that defines the column names
        cat("Loading",dataset, "(please be patient)\n")
        
        # Now extract the feature names - this will become the column names of
        # the complete data set
        features <- get_features_labels()
        
        # We only interested in the mean and standard deviation measurements.
        # Use features to locate those columns and only read those measurements
        meanstdindex <- grep("-(mean|std)",features) 
        meanstdcols <- rep("NULL",561)
        meanstdcols[meanstdindex] <- "numeric"
                                        
        # Load the main data first
        data_filename <- paste0("X_",dataset,".txt")
        data_file <- file.path("UCI HAR Dataset",dataset,data_filename)
        #data_df <- read.table(data_file,col.names=features,
        #                      colClasses=rep("numeric",561))

        data_df <- read.table(data_file,
                              colClasses=meanstdcols)
        # --> Have to set dataframe name in a separate line, otherwise 
        # --> read.table converts all spaces to "." for column names
        colnames(data_df) <-  grep("-(mean|std)",features,value=TRUE) 
                                
        # Get the subject ID        
        subjectID_filename <- paste0("subject_",dataset,".txt")
        subjectID_file <- file.path("UCI HAR Dataset",dataset,subjectID_filename)
        subjectID_df <- read.table(subjectID_file, col.names=c("subjectID"),
                                   colClasses=c("numeric"))        
        
        # Get the activities
        activities_filename <- paste0("y_",dataset,".txt")
        activities_file <- file.path("UCI HAR Dataset",dataset,activities_filename)
        activities_df <- read.table(activities_file,col.names=c("activity"),
                                    colClasses=c("numeric"))
        
        # Convert the activity from numbers to a meaningful label
        # -- load the file that maps the activity 
        activities_label_file <- file.path("UCI HAR Dataset","activity_labels.txt")
        activities_label_df <- read.table(activities_label_file,
                                          col.names=c("level","label"),
                                          colClasses=c("numeric","character"))
        
        # -- now convert from activity number to label
        activities_df$activity <- factor(activities_df$activity, 
                                         labels=activities_label_df$label)
                
        # Append the activity 
        data_df <- cbind(activities_df, data_df)
        
        #...and the subject ID
        data_df <- cbind(subjectID_df, data_df)
                
        # Return the dataset
        data_df
}


get_features_labels <- function()
{
        features_file <- file.path("UCI HAR Dataset","features.txt")
        features_df <- read.table(features_file, sep = " ",
                                  colClasses=c("numeric","character"))
        
        # Now extract the feature names 
        features <- features_df[,2]
                                
        # tidy up feature names to more easy human readable labels
        # Remove the 't'and 'f' at the start of each label
        features <- sub("^[tf]","",features)
        # Remove '()'
        features <- sub("\\(\\)","",features)
        # Remove double occurances of 'Body' with a single
        features <- sub("BodyBody","Body",features)        
        # Add '-' between 'Body' or 'Gravity' 
        features <- sub("(Body|Gravity)","\\1-",features)
        # Add '-' between (Acc|Gyro)Jerk
        features <- sub("(Acc|Gyro)Jerk","\\1-Jerk",features)
        # Add '-' between (Acc|Gyro|Jerk)Mag
        features <- sub("(Acc|Gyro|Jerk)Mag","\\1-Mag",features)
        # Convert meanFreq to mean-Freq
        features <- sub("meanFreq","mean-Freq",features)
        
        # Put all labels to lowercase
        features <- tolower(features)
                        
        # Return the features labels
        features
}


# second tidy data set
# The average of each variable, for each activity, for each subject
second_dataset <- function(df)
{
        print("Creating tidy data set - please be patient")
        # Use the incoming df to define each activity
        activities <- levels(df$activity)
        
        # Use the incoming df to find all the subjects        
        subjects <-  as.numeric(levels(factor(df$subjectID)))

        # Create function that will select a measurement for selected subject 
        # and activity
        mean_of_measurement <- function(x,ID,act) {
                mean(tidy_data[tidy_data$subjectID==ID & tidy_data$activity==act
                               ,x]
                     )
        }

        # loop over all subjects
        for (subject in subjects) {
                # loop over all activities
                for(activity in activities) {
                        # Calculate mean for each measurement for current
                        # subject and activity
                        # The measurements are columns 3-81
                        measurements_mean <- sapply(3:81,
                                                    mean_of_measurement,
                                                    ID=subject,act=activity)
                        
                        # append current subject and activity 
#                        measurements_mean <- c(subject, activity, measurements_mean)
                        
                        # append measurement_mean to all_measurements
                        if (subject == 1 & activity == activities[1] ) 
                                all_measurements <- measurements_mean
                        else 
                                all_measurements <- rbind(all_measurements,  
                                                          measurements_mean)                                                
                }
        }

        # Create data-frame 
        # - create column for subject ID and activity
        subjectColumn <-  rep(subjects,each=length(activities))
        activityColumn <- rep(activities,times=length(subjects))
                
        out_df <- data.frame(subjectColumn, activityColumn, all_measurements)
        colnames(out_df) <- colnames(df)

        # Write out_df to disk
        write.table(out_df, file="tidy_data.txt",row.name=FALSE)

        # Return the out_df
        out_df
}

