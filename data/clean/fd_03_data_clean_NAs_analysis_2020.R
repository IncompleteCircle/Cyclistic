#----------------------------------------------------------------------------------
#Creator: SJT
#Date:    18 AUG 2022
#File:    data_clean_NAs_analysis_2020.R
#File Designation Number: 03
#----------------------------------------------------------------------------------
#Description:
# This file provides the user a quick analysis/breakdown of the missing (NA) data
# rows are on each column, per table month [04-12, April-December] for year 2020
# of the divvy bike data.
# 
#----------------------------------------------------------------------------------
#Additional Details:
# This file is optional to run, and only provides an analysis pre-cleaning.
# It is to provide relevant stakeholders with information regarding data sets prior
# to further analysis.
#
# Note: User must run, data_integrate_2020.R script prior to this file, to have
# available R objects in the environment pane for usage.
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
#Step 1:  Create a data frame for all missing values
#----------------------------------------------------------------------------------
temp_tbl_04 <- c(sapply(tbl_04_2020_divvy, function(x) sum(is.na(x))))
temp_tbl_05 <- c(sapply(tbl_05_2020_divvy, function(x) sum(is.na(x))))
temp_tbl_06 <- c(sapply(tbl_06_2020_divvy, function(x) sum(is.na(x))))
temp_tbl_07 <- c(sapply(tbl_07_2020_divvy, function(x) sum(is.na(x))))
temp_tbl_08 <- c(sapply(tbl_08_2020_divvy, function(x) sum(is.na(x))))
temp_tbl_09 <- c(sapply(tbl_09_2020_divvy, function(x) sum(is.na(x))))
temp_tbl_10 <- c(sapply(tbl_10_2020_divvy, function(x) sum(is.na(x))))
temp_tbl_11 <- c(sapply(tbl_11_2020_divvy, function(x) sum(is.na(x))))
temp_tbl_12 <- c(sapply(tbl_12_2020_divvy, function(x) sum(is.na(x))))
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
#Step 2:  Create a Tibble to Store Data Frame of Missing (NA) Values Per Table
#----------------------------------------------------------------------------------
install.packages("tidyr")
library("tidyr")

temp_all_tbl_NA_Values <- tibble(default_names = colnames(tbl_04_2020_divvy), 
                            tbl_04_NA = temp_tbl_04,
                            tbl_05_NA = temp_tbl_05,
                            tbl_06_NA = temp_tbl_06,
                            tbl_07_NA = temp_tbl_07,
                            tbl_08_NA = temp_tbl_08,
                            tbl_09_NA = temp_tbl_09,
                            tbl_10_NA = temp_tbl_10,
                            tbl_11_NA = temp_tbl_11,
                            tbl_12_NA = temp_tbl_12)
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
#Step 3:  Remove temporary variables
#----------------------------------------------------------------------------------
rm(temp_tbl_04, temp_tbl_05, temp_tbl_06, temp_tbl_07, temp_tbl_08,
   temp_tbl_09, temp_tbl_10, temp_tbl_11, temp_tbl_12)
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
#Step 4:  Create a temporary vector to row bind into data frame
#----------------------------------------------------------------------------------
temp_row <- c("Total N/A", 
              as.integer(sum(temp_all_tbl_NA_Values$tbl_04_NA)), 
              as.integer(sum(temp_all_tbl_NA_Values$tbl_05_NA)),
              as.integer(sum(temp_all_tbl_NA_Values$tbl_06_NA)),
              as.integer(sum(temp_all_tbl_NA_Values$tbl_07_NA)),
              as.integer(sum(temp_all_tbl_NA_Values$tbl_08_NA)),
              as.integer(sum(temp_all_tbl_NA_Values$tbl_09_NA)),
              as.integer(sum(temp_all_tbl_NA_Values$tbl_10_NA)),
              as.integer(sum(temp_all_tbl_NA_Values$tbl_11_NA)),
              as.integer(sum(temp_all_tbl_NA_Values$tbl_12_NA)))
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
#Step 5:  Row bind the temporary vector with the sum of all NAs per column
#----------------------------------------------------------------------------------
all_tbl_NA_Values <- rbind(temp_all_tbl_NA_Values, temp_row)
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
#Step 6:  Create Total NA column to be stored into all NA table.
#         Use cbind to expand column in data frame.
#         All default values are set to 0.
#----------------------------------------------------------------------------------
temp_col <- c(as.integer(rep(0, times = nrow(all_tbl_NA_Values))))

#Reset: Temporary data frame to hold values before cbind call.
rm(temp_all_tbl_NA_Values)
temp_all_tbl_NA_Values <- all_tbl_NA_Values

#CBind Total NA column to data frame: all_tbl_NA_Values
all_tbl_NA_Values <- cbind(temp_all_tbl_NA_Values, Total_NA = temp_col)

#Remove the two temporary variables: vector + data frame
rm(temp_col, temp_row, temp_all_tbl_NA_Values)
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
#Step 7: Sum all NA values across to the last column.
#----------------------------------------------------------------------------------
iRow <- 1
iCol <- 3
totRow <- nrow(all_tbl_NA_Values)
totCol <- ncol(all_tbl_NA_Values)-1
endCol <- ncol(all_tbl_NA_Values)
sumRow <- 0

for(iRow in 1:totRow){
  sumRow <- as.integer(all_tbl_NA_Values[iRow,2])
  for(iCol in 3:totCol){
    sumRow = sumRow + as.integer(all_tbl_NA_Values[iRow,iCol])
  }
  all_tbl_NA_Values[iRow, endCol] <- sumRow
  sumRow <- 0
}

rm(iRow, iCol, totRow, totCol, endCol, sumRow)
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
#Step 8:  Display the data frame with the data frame of missing (NA) rows.
#----------------------------------------------------------------------------------
View(all_tbl_NA_Values)
#----------------------------------------------------------------------------------
