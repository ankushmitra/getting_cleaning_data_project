getting_cleaning_data_project
=============================

Repository for Coursera "Getting and Cleaning Data" course project.

The aim of the project is to parse data collected from acceleraometers and gyroscope from a Samsung Galaxy S 
smart phone, and produce a tidy data set that condenses the many measurements that were recorded.  Further 
information on the data can be found at: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

For your convenience, a copy of this dataset is included in this repository.   

This repository contains the following files:
- README.md : this file
- run_analysis.R : the code that parses the handset data and outputs a tidy data set
- tidy_data.txt : the tidy data set created by running run_analysis.R 
- UCI HAR Dataset : directory containing the original sensory data.  
  * This directory contains is own README.txt that describes the sensory data


## run_analysis.R 

run_analysis.R consist of several functions that are used to parse the handset data on the way to producing the
tidy dataset. For the script to work, the UCI HAR Dataset must be in the working directory of the script.

- *run_analysis*
 * _Description_: run this script, with no arguments to read the handset data and produce the tidy data set
                 _NB_: UCI HAR Data directory must be in the working directory of the script and 
                 the handset directory structure has not been altered
 * _Input_: None
 * _Output_: data frame of the tidy data set
- *load_data*
 * _Description_:  load a dataset and create a data frame. There are two datasets in the handset data: train and test
                   The data frame only has the mean and standard deviation measurements, with subject ID and activity for
                   each entry. 
 * _Input_: dataset name: "test" or "train"
 * _Output_: dataframe of the selected dataset
- *get_features_labels*
 * _Description_: Loads the  _UCI HAR Dataset/features.txt_ file, which defines the measurements in the raw data.
                  The raw measurement names are cleaned to be more readable.  Each measurement label is defined in the
                  CodeBook.md file.
 * _Input_: None
 * _Output_: character vector of each measurement name
- *second_dataset*
 * _Description_: Takes the dataframe produced by load_data (or the merger of two dataframe from load_data), 
                  averages each measurement for each subject and activity. The resultant dataframe is return to disk 
                  as "tidy_data.txt" and returned by the function.
 * _Input_: data frame produced by load_data
 * _Output_: a data frame that averages each mesurement for each user and activity, and the output data fram is written 
             to disk as "tidy_data.txt"
