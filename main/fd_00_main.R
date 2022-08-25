#-----------------------------------------
#Creator: SJT
#Date:    25 AUG 2022
#File:    fd_00_main.R
#File Designation Number: 00
#-----------------------------------------

#Check Package Status
package_there <- require("devtools")
if (package_there != TRUE){
  install.packages("devtools")
  library("devtools")
}
rm(package_there)

#1: Data Phase: Process [Pull Data]
#File Designation Numbers: 01
source_url("https://raw.githubusercontent.com/IncompleteCircle/Cyclistic/main/data/process/fd_01_data_process_integrate_2020.R")

#2: Data Phase: Clean
#File Designation Numbers: 02-04
source_url("https://raw.githubusercontent.com/IncompleteCircle/Cyclistic/main/data/clean/fd_02_data_clean_timedate_2020.R")
source_url("https://raw.githubusercontent.com/IncompleteCircle/Cyclistic/main/data/clean/fd_03_data_clean_NAs_analysis_2020.R")
source_url("https://raw.githubusercontent.com/IncompleteCircle/Cyclistic/main/data/clean/fd_04_data_clean_merge_2020.R")