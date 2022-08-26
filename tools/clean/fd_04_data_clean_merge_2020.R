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
#-------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------
#Step 1.1: Row Bind Without NAs
#-------------------------------------------------------------------------------------
#Bind Here: Without NAs in the given data frames across all months [04-12].
tbl_04_No_NA <- na.omit(tbl_04_2020_divvy)
tbl_05_No_NA <- na.omit(tbl_05_2020_divvy)
tbl_06_No_NA <- na.omit(tbl_06_2020_divvy)
tbl_07_No_NA <- na.omit(tbl_07_2020_divvy)
tbl_08_No_NA <- na.omit(tbl_08_2020_divvy)
tbl_09_No_NA <- na.omit(tbl_09_2020_divvy)
tbl_10_No_NA <- na.omit(tbl_10_2020_divvy)
tbl_11_No_NA <- na.omit(tbl_11_2020_divvy)
tbl_12_No_NA <- na.omit(tbl_12_2020_divvy)

tbl_2020_no_na_divvy <- rbind(tbl_04_No_NA, tbl_05_No_NA, tbl_06_No_NA,
                              tbl_07_No_NA, tbl_08_No_NA, tbl_09_No_NA,
                              tbl_10_No_NA, tbl_11_No_NA, tbl_12_No_NA)
#-------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------
#Step 2: Remove all other remanent tables.
#-------------------------------------------------------------------------------------
rm(tbl_04_2020_divvy, tbl_05_2020_divvy, tbl_06_2020_divvy,
   tbl_07_2020_divvy, tbl_08_2020_divvy, tbl_09_2020_divvy,
   tbl_10_2020_divvy, tbl_11_2020_divvy, tbl_12_2020_divvy,
   tbl_04_No_NA, tbl_05_No_NA, tbl_06_No_NA,
   tbl_07_No_NA, tbl_08_No_NA, tbl_09_No_NA,
   tbl_10_No_NA, tbl_11_No_NA, tbl_12_No_NA)
#-------------------------------------------------------------------------------------
