#-----------------------------------------
#Creator: SJT
#Date:    25 AUG 2022
#File:    fd_00_main.R
#File Designation Number: 00
#-----------------------------------------
#Run Time Measurements: Start Based on User's System Time [Time Zone: UTC]
start_time <- format(Sys.time(), "%Y-%m-%d %H:%M:%S", tz = "UTC")
start <- strptime(start_time, format = "%Y-%m-%d %H:%M:%S", tz = "UTC")

#Check Package Status
package_there <- require("devtools")
if (package_there != TRUE){
  install.packages("devtools")
  library("devtools")
}
rm(package_there)

#1: Data Phase: Process [Pull Data]
#File Designation Numbers: 01
source_url("https://raw.githubusercontent.com/IncompleteCircle/Cyclistic/main/tools/process/fd_01_data_process_integrate_2020.R")

#2: Data Phase: Clean
#File Designation Numbers: 02-04
source_url("https://raw.githubusercontent.com/IncompleteCircle/Cyclistic/main/tools/clean/fd_02_data_clean_timedate_2020.R")
source_url("https://raw.githubusercontent.com/IncompleteCircle/Cyclistic/main/tools/clean/fd_03_data_clean_NAs_analysis_2020.R")
source_url("https://raw.githubusercontent.com/IncompleteCircle/Cyclistic/main/tools/clean/fd_04_data_clean_merge_2020.R")

#3: Data Phase: Exploratory Data Analysis [EDA]
#File Designation Number: 05-06
source_url("https://raw.githubusercontent.com/IncompleteCircle/Cyclistic/main/tools/eda/fd_05_eda_divvy_bike_2020.R")
source_url("https://raw.githubusercontent.com/IncompleteCircle/Cyclistic/main/tools/eda/fd_06_eda_divvy_bike_2020.R")

#4: Data Phase: Visualize
#File Designation Number: 07
source_url("https://raw.githubusercontent.com/IncompleteCircle/Cyclistic/main/tools/plot/fd_07_plot_divvy_bike_2020.R")

#Run Time Measurements: End Based on User's System Time [Time Zone: UTC]
end_time <- format(Sys.time(), "%Y-%m-%d %H:%M:%S", tz = "UTC")
end <- strptime(end_time, format = "%Y-%m-%d %H:%M:%S", tz = "UTC")
run_time <- end - start
print(run_time)
rm(end_time, end, start_time, start, run_time)