# DataScienceCourse3Project
Getting and Cleaning Data is the third course in Coursera's Data Science Track.
This repository contains files pertaining to the course's week 4 peer-graded assessment.
The aim of this project is to produce tidy data from raw data.
The script will produce a text output with the cleaned-up data.

# Repository Contents
- README.md
- UCI HAR Dataset - Raw dataset (refer to UCI HAR Dataset/README for more information)
- run_analysis.R - R script required for this project

# Installation
1. Clone the repository to your local directory.
2. Install and load the reshape2 package in R or R Studio.
3. Run the R script run_analysis.R with R or R Studio.

# How the R Script Works
1. Reads the test and training dataset, the corresponding subjects, features and activity labels from the raw dataset. 
2. Renames variables with descriptive names.
3. Manipulates the data to include activity and subject columns.
4. Merges the test and training datasets.
5. Extracts the mean and standard deviation columns from the merged dataset.
6. Creates an independent table with the average of each variable for each activity and each subject.
7. Outputs the table created in 5 into a text file.

#Acknowledgement
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
