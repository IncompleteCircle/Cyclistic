#-------------------------------------------------------------------------------------
#Creator: SJT
#Date:    20 AUG 2022
#File:    data_clean_merge_2020.R
#File Designation Number: 04
#-------------------------------------------------------------------------------------
#Description:
# This file is set to simply merge all the data frames [tables] from the months
# 04 [April] to 12 [December] into a single data frame [table] for the year 2020.
#
# For educational/exercise purposes two data frames were created which one includes
# the NAs still inside the data frame, and the other without.
#
# They will be utilized later by the user for the exploratory data analysis segment.
#-------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------
#Step 1: Row Bind All Data Frames [Tables] into A Single Year 2020 Data Frame [Table]
#-------------------------------------------------------------------------------------
#Additional Note: This will have two data frames. One including NAs and one without.
#For educational purposes this was done to illustrate any potential differences in 
#the data sets when analyzing them.
#-------------------------------------------------------------------------------------
#Bind Here: With NAs in the given data frames across all months [04-12].
tbl_2020_divvy <- rbind(tbl_04_2020_divvy, tbl_05_2020_divvy, tbl_06_2020_divvy,
                        tbl_07_2020_divvy, tbl_08_2020_divvy, tbl_09_2020_divvy,
                        tbl_10_2020_divvy, tbl_11_2020_divvy, tbl_12_2020_divvy)

#Arbitrary Usage: Set to convert the float value of the trip duration into integer.
#Reasoning, to round the values as the precision might not be essential.
tbl_2020_divvy$trip_duration_min <- as.integer(tbl_2020_divvy$trip_duration_min)
#-------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------
#Step 1.1: Optional Second Table Without NAs Present in Data Frame Rows
#-------------------------------------------------------------------------------------
tbl_2020_no_na_divvy <- na.omit(tbl_2020_divvy)
print(paste("Number of NA Rows Dropped: ", nrow(tbl_2020_divvy)-nrow(tbl_2020_no_na_divvy)))
#-------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------
#Step 2: Remove all other remaining individual tables.
#-------------------------------------------------------------------------------------
rm(tbl_04_2020_divvy, tbl_05_2020_divvy, tbl_06_2020_divvy,
   tbl_07_2020_divvy, tbl_08_2020_divvy, tbl_09_2020_divvy,
   tbl_10_2020_divvy, tbl_11_2020_divvy, tbl_12_2020_divvy)
#-------------------------------------------------------------------------------------