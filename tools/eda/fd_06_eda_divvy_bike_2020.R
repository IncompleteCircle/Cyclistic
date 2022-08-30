#-----------------------------------------------------------------------
#Creator: SJT
#Date: 28 AUG 2022
#File: fd_06_eda_divvy_bike_2020
#File Designation Number: 06
#-----------------------------------------------------------------------
#Data Phase Section: Exploratory Data Analysis/Analyze
#-----------------------------------------------------------------------
#Description:
# The role of this file, is to provide summary tables & visualizations 
# for the report. A summary table will be used for the markdown file
# Variables will store plots that will later be implemented into the 
# final user report for stakeholders.
#-----------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------------
#Step 1: Preliminary Checks and Builds
#--------------------------------------------------------------------------------------------------------
#Check if necessary package is installed and loaded.
package_there <- require(data.table)
if (package_there != TRUE){
  install.packages("data.table")
  library(data.table)
}
rm(package_there)

#Extract temporary data frame to use for plotting certain data.
tbl_temp <- data.frame(start_month_name = months(tbl_2020_divvy$started_at),
                       start_month_num = month(tbl_2020_divvy$started_at),
                       trip_duration_minutes = tbl_2020_divvy$trip_duration_min,
                       member_type = tbl_2020_divvy$member_casual,
                       bike_type = tbl_2020_divvy$rideable_type)

#Obtain frequency distribution of bike usage by month
by_month_freq <- table(cut(x=month(tbl_2020_divvy$started_at),
                        breaks=c(seq(from=3, to = 12, by = 1))))
by_membership_type_freq <- table(tbl_temp$start_month_num, tbl_temp$member_type)
by_bike_type_freq <- table(tbl_temp$start_month_num, tbl_temp$bike_type)

#--------------------------------------------------------------------------------------------------------
#Step 2: Building Summary Data Frame
#--------------------------------------------------------------------------------------------------------
# Fields Include:
# - by_months: month names
# - by_months_num: month numbers
# - total_month_ride_frequency: total number of rides made per month
# - total_month_trip_time_min: total number of rides minutes per month
# - total_casual_members: total number of casual (non)-members per month
# - total_annual_members: total number of annual members per month
#--------------------------------------------------------------------------------------------------------
by_months <- c("April", "May", "June", "July", "August", "September", "October", "November", "December")
by_months_num <- c(4,5,6,7,8,9,10,11,12)
total_month_ride_frequency <- as.numeric(c(rep(0, times=length(by_months))))
total_month_trip_time_min <- as.numeric(c(rep(0,times=length(by_months))))
average_min_per_ride <- as.numeric(c(rep(0,times=length(by_months))))
#--------------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------------
#Step 3: Extract Data From Temp Tables and Bind Into New Data Frame
#--------------------------------------------------------------------------------------------------------
#For-Loop: Extract the total frequency of rides per month + sum of (trip) minutes per month
for(index in 1:length(by_month_freq)){
  total_month_ride_frequency[index] = by_month_freq[index]
  total_month_trip_time_min[index] = sum(tbl_temp[tbl_temp$start_month_num==index+3,]$trip_duration_minutes)
}


#Column Bind All Extracted Vectors into a Single Data Frame
tbl_2020_summary <- data.frame(cbind(month_name = by_months, 
                                     month_num = by_months_num, 
                                     total_num_rides = total_month_ride_frequency,
                                     total_time_minutes = total_month_trip_time_min,
                                     avg_min_per_ride = average_min_per_ride,
                                     by_membership_type_freq,
                                     by_bike_type_freq))

#Remove temporary variables
rm(average_min_per_ride, by_months,
   by_bike_type_freq,by_months_num, tbl_temp,
   total_month_ride_frequency, total_month_trip_time_min,
   by_month_freq, by_membership_type_freq)

#Data Conversion for Data Frame Columns into Suitable Data Type
tbl_2020_summary$month_num <- as.integer(tbl_2020_summary$month_num)
tbl_2020_summary$total_num_rides <- as.integer(tbl_2020_summary$total_num_rides)
tbl_2020_summary$total_time_minutes <- as.integer(tbl_2020_summary$total_time_minutes)
tbl_2020_summary$casual <- as.integer(tbl_2020_summary$casual)
tbl_2020_summary$member <- as.integer(tbl_2020_summary$member)
tbl_2020_summary$classic_bike <- as.integer(tbl_2020_summary$classic_bike)
tbl_2020_summary$docked_bike <- as.integer(tbl_2020_summary$docked_bike)
tbl_2020_summary$electric_bike <- as.integer(tbl_2020_summary$electric_bike)


#Obtain Average Number of Minutes Per Ride
for(index in 1:nrow(tbl_2020_summary)){
  temp_hold = tbl_2020_summary$total_time_minutes[index]/tbl_2020_summary$total_num_rides[index]
  tbl_2020_summary$avg_min_per_ride[index] = temp_hold
}
rm(index, temp_hold)
tbl_2020_summary$avg_min_per_ride <- as.double(tbl_2020_summary$avg_min_per_ride,length=0)

#--------------------------------------------------------------------------------------------------------
#Step 3: Rename Columns in Data Frame
#--------------------------------------------------------------------------------------------------------
#Definitions:
# - month_name: Month Name
# - month_num: Month Number
# - sum_rides: Number of Total Rides Made that Months
# - sum_minutes: Number of Total Minutes Rode that Month
# - avg_minutes_per_ride: Average Number of Minutes Per Ride
# - tot_casual: Number of Casual (Non)-Members
# - tot_members: Number of Total Annual Members
# - tot_classic_bikes_used: Number of Classic Bikes Used [By Both Members]
# - tot_docked_bikes_used: Number of Docked Bikes Used [By Both Members]
# - tot_electric_bikes_used: Number of Electric Bikes Used [By Both Members]
#--------------------------------------------------------------------------------------------------------
names(tbl_2020_summary) <- c("month_name", "month_num", "sum_rides",
                             "sum_minutes", "avg_minutes_per_ride",
                             "tot_casual","tot_members", 
                             "tot_classic_bikes_used","tot_docked_bikes_used", 
                             "tot_electric_bikes_used")
#--------------------------------------------------------------------------------------------------------
View(tbl_2020_summary)
#--------------------------------------------------------------------------------------------------------