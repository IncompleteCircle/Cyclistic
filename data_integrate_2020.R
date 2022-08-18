#----------------------------------------------------------------------------------
#Creator: SJT
#Date:    18 AUG 2022
#File:    data_integrate_2020.R
#----------------------------------------------------------------------------------
#Description:
#   This file is designed to act as an extraction, load, and transformation for
#   the divvy bike data provided by the Google Data Analytics Certification Course, 
#   that acts as a proxy for a real-world case for the fictional company,
#   Cyclistic.
#
#   For exercise purposes, this file is only designed for year 2020 of the 
#   divvy bike data set used in the case study.
#----------------------------------------------------------------------------------
#Additional Details:
#   This file follows a top-down linear method in approaching the extraction,
#   load, and transformation phases.
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
#Step 1: READ CSV FILES INTO R DATAFRAMES
#Optional:  You may download the files direct onto your local drive,
#           and place the file path accordingly.
#----------------------------------------------------------------------------------
#Current Storage Location: Google Drive
#----------------------------------------------------------------------------------
fileURL_Path <- "https://docs.google.com/uc?id=%s&export=download"
fileID_04_2020 <- "1_dOtrccYcnJYxNbf7W6-J41SszbRewgM"
fileID_05_2020 <- "1SJPCePLM8QV6TCp5a10flcv7Z9ZO_ZX5"
fileID_06_2020 <- "1TNggqN4fwbwnJfDsd58inoKbnren6ze1"
fileID_07_2020 <- "1qq8hHDxOBMOklNhCA3e3Z8kc0fQcJ6Ou"
fileID_part_I_08_2020 <- "1v-QfNNIIgNVp8EbvWYe8e97kkHGhc34g"
fileID_part_II_08_2020 <- "1x0ROVHkpsM4LRCYZYNBFM7Ja5M5VoUtk"
fileID_09_2020 <- "1RuW6q39FBcA8CUKKXRHwi3KXjVL0shMv"
fileID_10_2020 <- "1ePxRQ8dO1FHFGkiVfttY9nUvKo2Nzh5z"
fileID_11_2020 <- "1H4pKwb76_LwWI6Ebev75yr0QchP5cvoA"
fileID_12_2020 <- "1lFnVFTqHS77Foaxkto1wAPxWD9UO3PbT"

#Data Frames to store csv files from Google Drive [Divvy Bike Data]
#Note: Due to file size and Google Drive downloading limitations
#Month 08 [August] was split into two separate files, then
#appended into a single data frame.
tbl_04_2020_divvy <- read.csv(sprintf(fileURL_Path, fileID_04_2020))
tbl_05_2020_divvy <- read.csv(sprintf(fileURL_Path, fileID_05_2020))
tbl_06_2020_divvy <- read.csv(sprintf(fileURL_Path, fileID_06_2020))
tbl_07_2020_divvy <- read.csv(sprintf(fileURL_Path, fileID_07_2020))


tbl_part_I_08_2020_divvy <- read.csv(sprintf(fileURL_Path, fileID_part_I_08_2020))
tbl_part_II_08_2020_divvy <- read.csv(sprintf(fileURL_Path, fileID_part_II_08_2020))
tbl_08_2020_divvy <- rbind(tbl_part_I_08_2020_divvy, tbl_part_II_08_2020_divvy)

tbl_09_2020_divvy <- read.csv(sprintf(fileURL_Path, fileID_09_2020))
tbl_10_2020_divvy <- read.csv(sprintf(fileURL_Path, fileID_10_2020))
tbl_11_2020_divvy <- read.csv(sprintf(fileURL_Path, fileID_11_2020))
tbl_12_2020_divvy <- read.csv(sprintf(fileURL_Path, fileID_12_2020))

rm(fileURL_Path, fileID_04_2020, fileID_05_2020, fileID_06_2020, fileID_07_2020,
   fileID_part_I_08_2020, fileID_part_II_08_2020, fileID_09_2020, fileID_10_2020, 
   fileID_11_2020, fileID_12_2020, tbl_part_I_08_2020_divvy, tbl_part_II_08_2020_divvy)

#----------------------------------------------------------------------------------
#Step 2: CROSS-REFERENCE ALL TABLE'S HEADERS/FIELDS
#----------------------------------------------------------------------------------
#Description:
#   The following data frame is created to store each table [months] column names.
#   The default_field_names will be used to cross-reference each of the month's
#   table column names against it.
#
#Table Information:
#   all_2020_tbl_col_names: Stores the all column names for all months.
#   all_2020_tbl_check: A cross-reference table, storing bool values to validate
#                       results. [Default set to FALSE]
#----------------------------------------------------------------------------------
#Additional Details
#   Default field names are based on month 04 [April] table's column names.
#----------------------------------------------------------------------------------

all_2020_tbl_col_names <- data.frame(default_field_names = colnames(tbl_04_2020_divvy),
                                     tbl_04_col_names = colnames(tbl_04_2020_divvy),
                                     tbl_05_col_names = colnames(tbl_05_2020_divvy),
                                     tlb_06_col_names = colnames(tbl_06_2020_divvy),
                                     tbl_07_col_names = colnames(tbl_07_2020_divvy),
                                     tbl_08_col_names = colnames(tbl_08_2020_divvy),
                                     tbl_09_col_names = colnames(tbl_09_2020_divvy),
                                     tbl_10_col_names = colnames(tbl_10_2020_divvy),
                                     tbl_11_col_names = colnames(tbl_11_2020_divvy),
                                     tbl_12_col_names = colnames(tbl_12_2020_divvy))

all_2020_tbl_check <- data.frame(tbl_default_check = rep(TRUE, times = length(colnames(tbl_04_2020_divvy))),
                                 tbl_04_check = rep(FALSE, times = length(colnames(tbl_04_2020_divvy))),
                                 tbl_05_check = rep(FALSE, times = length(colnames(tbl_04_2020_divvy))),
                                 tbl_06_check = rep(FALSE, times = length(colnames(tbl_04_2020_divvy))),
                                 tbl_07_check = rep(FALSE, times = length(colnames(tbl_04_2020_divvy))),
                                 tbl_08_check = rep(FALSE, times = length(colnames(tbl_04_2020_divvy))),
                                 tbl_09_check = rep(FALSE, times = length(colnames(tbl_04_2020_divvy))),
                                 tbl_10_check = rep(FALSE, times = length(colnames(tbl_04_2020_divvy))),
                                 tbl_11_check = rep(FALSE, times = length(colnames(tbl_04_2020_divvy))),
                                 tbl_12_check = rep(FALSE, times = length(colnames(tbl_04_2020_divvy))))

#----------------------------------------------------------------------------------
#Step 2.1: CROSS-REFERENCE ALL TABLE'S HEADERS/FIELDS
#----------------------------------------------------------------------------------
#Cross-Reference Check:
# Start at index [2] from table month 04 [April]
# Ends at table month 12 [December]
#
#Case Outcomes:
# If the month's column matches with the default field list.
# The value is set to TRUE, else FALSE.
#----------------------------------------------------------------------------------
index <- 2
default_col <- index - 1
end <- ncol(all_2020_tbl_col_names)

for(index in 2:end){
  all_2020_tbl_check[index] = (all_2020_tbl_col_names[index] == all_2020_tbl_col_names[default_col])
}

rm(index, default_col, end)

#----------------------------------------------------------------------------------
#Step 2.1: CROSS-REFERENCE ALL TABLE'S HEADERS/FIELDS
#----------------------------------------------------------------------------------
#Cross-Reference Check:
# This will go through the all_2020_tbl_check to show the user which month
# and table there could be an error (invalid/wrong column name).
#
# The user must then manually go to the file and fix it, then re-upload the
# data frame back into the environment.
#----------------------------------------------------------------------------------
#Check the data frame
iRow <- 1
end_iRow <- nrow(all_2020_tbl_check)
iCol <- 1
end_iCol <- ncol(all_2020_tbl_check)
iMonth <- 4

for(iCol in 1:end_iCol){
  if(iMonth == 12){
    iMonth = 12
  } else {iMonth = iMonth + 1}
  
  for(iRow in 1:end_iRow){
    if(isTRUE(all_2020_tbl_check[iRow,iCol])==TRUE){
      print(paste("Error | Check Field ID on Table Month", iMonth, "| ", "Column:", iCol, "| Row:",iRow))
    }
  }
}
rm(iRow, end_iRow, iCol, end_iCol, iMonth)
rm(all_2020_tbl_check, all_2020_tbl_col_names)