#----------------------------------------------------------------------------------
#Creator: SJT
#Date:    19 AUG 2022
#File:    data_clean_timedate_2020.R
#----------------------------------------------------------------------------------
#Description:
#   This file is designed to go through the loaded tables from the year 2020 divvy
#   bike data sets that were provided by the Google Data Certification Course case
#   study.
#
#   The file is designed to provide data validation and cleaning methods for the 
#   time stamp columns that provide the start and end date/time of trip.
#   As the files contain errors in input, this seeks to correct those inputs, by
#   swapping the values to their correct order.
#
#   For exercise purposes, this file is only designed for year 2020 of the 
#   divvy bike data set used in the case study.
#----------------------------------------------------------------------------------
#Additional Details:
#   This file is to be run after the data_integrate_2020.R script file.
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
#Function: clean_Time_Date_Data_Format_YMD_HMS
#----------------------------------------------------------------------------------
#Arguments:
#   df_arg - data (object) type: data frame
#
#Returns:
#   df_arg - data (object) type: data frame
#----------------------------------------------------------------------------------
#Description:
#   This function is set to convert the 'started_at' and 'ended_at' columns to
#   to convert between character representations and objects of classes "POSIXlt" 
#   and "POSIXct" representing calendar dates and times.
#   
#   It performs a data validation check on the started_at and ended_at columns to
#   ensure no negative values exist due to incorrect/swapped data inputs on their
#   date and times.
#----------------------------------------------------------------------------------
clean_Time_Date_Data_Format_YMD_HMS <- function(df_arg){    
  
  df_arg[["started_at"]] <- strptime(df_arg[["started_at"]],
                                     format = "%Y-%m-%d %H:%M:%S",
                                     tz = "UTC")
  
  df_arg[["ended_at"]] <- strptime(df_arg[["ended_at"]],
                                   format = "%Y-%m-%d %H:%M:%S",
                                   tz = "UTC")
  
  df_arg$trip_duration_min <- as.numeric(df_arg$ended_at-df_arg$started_at)/60
  
  totRow <- nrow(df_arg)
  iRow <- 1
  
  for(iRow in 1:totRow){
    if(df_arg$trip_duration_min[iRow]<0){
      temp_end <- df_arg$ended_at[iRow]
      temp_start <- df_arg$started_at[iRow]
      df_arg$started_at[iRow] <- temp_end
      df_arg$ended_at[iRow] <- temp_start
      rm(temp_end, temp_start)
    }
  }
  
  df_arg$trip_duration_min <- as.numeric(df_arg$ended_at-df_arg$started_at)/60
  
  default_names <- c("ride_id",
                     "rideable_type",
                     "started_at",
                     "ended_at",
                     "trip_duration_min",
                     "start_station_name",
                     "start_station_id",
                     "end_station_name",
                     "end_station_id",
                     "start_lat",
                     "start_lng",
                     "end_lat",
                     "end_lng",
                     "member_casual")
  
  df_arg <- df_arg[, default_names]
  
  rm(default_names, iRow, totRow)
  
  return(df_arg)
} #END FUNCTION

#----------------------------------------------------------------------------------
#Function: clean_Time_Date_Data_Format_DMY_HM
#----------------------------------------------------------------------------------
#Arguments:
#   df_arg - data (object) type: data frame
#
#Returns:
#   df_arg - data (object) type: data frame
#----------------------------------------------------------------------------------
#Description:
#   This function is set to convert the 'started_at' and 'ended_at' columns to
#   to convert between character representations and objects of classes "POSIXlt" 
#   and "POSIXct" representing calendar dates and times.
#   
#   It performs a data validation check on the started_at and ended_at columns to
#   ensure no negative values exist due to incorrect/swapped data inputs on their
#   date and times.
#----------------------------------------------------------------------------------
clean_Time_Date_Data_Format_DMY_HM <- function(df_arg){    
  
  df_arg[["started_at"]] <- strptime(df_arg[["started_at"]],
                                     format = "%d-%m-%y %H:%M",
                                     tz = "UTC")
  
  df_arg[["ended_at"]] <- strptime(df_arg[["ended_at"]],
                                   format = "%d-%m-%y %H:%M",
                                   tz = "UTC")
  
  df_arg$trip_duration_min <- as.numeric(df_arg$ended_at-df_arg$started_at)/60
  
  totRow <- nrow(df_arg)
  iRow <- 1
  
  for(iRow in 1:totRow){
    if(df_arg$trip_duration_min[iRow]<0){
      temp_end <- df_arg$ended_at[iRow]
      temp_start <- df_arg$started_at[iRow]
      df_arg$started_at[iRow] <- temp_end
      df_arg$ended_at[iRow] <- temp_start
      rm(temp_end, temp_start)
    }
  }
  
  df_arg$trip_duration_min <- as.numeric(df_arg$ended_at-df_arg$started_at)/60
  
  default_names <- c("ride_id",
                     "rideable_type",
                     "started_at",
                     "ended_at",
                     "trip_duration_min",
                     "start_station_name",
                     "start_station_id",
                     "end_station_name",
                     "end_station_id",
                     "start_lat",
                     "start_lng",
                     "end_lat",
                     "end_lng",
                     "member_casual")
  
  df_arg <- df_arg[, default_names]
  
  rm(default_names, iRow, totRow)
  
  return(df_arg)
} #END FUNCTION

#----------------------------------------------------------------------------------
#Step 1: Format and Clean the Data/Time Formats
#----------------------------------------------------------------------------------
tbl_04_2020_divvy <- clean_Time_Date_Data_Format_YMD_HMS(tbl_04_2020_divvy)
tbl_05_2020_divvy <- clean_Time_Date_Data_Format_YMD_HMS(tbl_05_2020_divvy)
tbl_06_2020_divvy <- clean_Time_Date_Data_Format_YMD_HMS(tbl_06_2020_divvy)
tbl_07_2020_divvy <- clean_Time_Date_Data_Format_YMD_HMS(tbl_07_2020_divvy)
tbl_08_2020_divvy <- clean_Time_Date_Data_Format_DMY_HM(tbl_08_2020_divvy)
tbl_09_2020_divvy <- clean_Time_Date_Data_Format_YMD_HMS(tbl_09_2020_divvy)
tbl_10_2020_divvy <- clean_Time_Date_Data_Format_YMD_HMS(tbl_10_2020_divvy)
tbl_11_2020_divvy <- clean_Time_Date_Data_Format_YMD_HMS(tbl_11_2020_divvy)
tbl_12_2020_divvy <- clean_Time_Date_Data_Format_YMD_HMS(tbl_12_2020_divvy)
#----------------------------------------------------------------------------------