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
package_there <- (require(data.table) && require(dplyr))
if (package_there != TRUE){
  install.packages("data.table")
  install.packages("dplyr")
  library(data.table)
  library(dplyr)
}
rm(package_there)

#--------------------------------------------------------------------------------------------------------
#Function: sum_Member_Minutes_By_Month
#--------------------------------------------------------------------------------------------------------
#Parameters:
# - someDF - Type: Data Frame - Pass: By Value - Description: Data Frame passed to filter
#
# - month_criteria - Type: Integer - Pass: By Value - 
#   Description: Month criteria for Data Frame Filtering
#
# - member_criteria - Type: Char/String - Pass: By Value - Description:
#   Description: Membership type criteria for Data Frame Filtering
#
#Return:
# - sum(): Returns the sum of the trip duration (minutes) by the given criteria
#--------------------------------------------------------------------------------------------------------
sum_Member_Minutes_By_Month <- function(someDF, month_criteria, member_criteria){
  
  if(month_criteria < 4 || month_criteria > 12){
    return(NA)
  } else if (member_criteria != "member" && member_criteria != "casual"){
    return(NA)
  } else {
    modified_df <- filter(someDF, month(someDF$started_at) == month_criteria & someDF$member_casual == member_criteria)
    return(sum(modified_df$trip_duration_min))
  }
} #END Function

#--------------------------------------------------------------------------------------------------------
#Function: 
#--------------------------------------------------------------------------------------------------------
#
#--------------------------------------------------------------------------------------------------------
count_Member_Rides_By_Bike_Type <- function(someDF, month_criteria, member_criteria, bike_criteria){
  
  if(month_criteria < 4 || month_criteria > 12){
    print("Invalid Month Input")
    return(NA)
  } else if (member_criteria != "member" && member_criteria != "casual"){
    print("Invalid Member Input")
    return(NA)
  } else if (bike_criteria != "docked_bike" && bike_criteria != "classic_bike" && bike_criteria != "electric_bike"){
    print("Invalid Bike Type")
    return(NA)
  } else {
    modified_df <- someDF %>% 
      filter(month(started_at) == month_criteria) %>% 
      filter(rideable_type == bike_criteria) %>% 
      filter(member_casual == member_criteria)
    return(length(modified_df$member_casual))
  }
}

#--------------------------------------------------------------------------------------------------------
#Step 1.A: Preliminary Checks and Builds
#--------------------------------------------------------------------------------------------------------
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
# - total_members_docked_bike_used: total number of docked bikes used by members
# - total_members_classic_bike_used: total number of classic bikes used by members
# - total_members_electric_bike_used: total number of electric bikes used by members
#--------------------------------------------------------------------------------------------------------
by_months <- c("April", "May", "June", "July", "August", "September", "October", "November", "December")
by_months_num <- c(4,5,6,7,8,9,10,11,12)

total_month_ride_frequency <- as.numeric(c(rep(0, times=length(by_months))))
total_month_trip_time_min <- as.numeric(c(rep(0,times=length(by_months))))

average_min_per_ride <- as.numeric(c(rep(0,times=length(by_months))))

total_members_docked_bike_used <- as.numeric(c(rep(0, times=length(by_months))))
total_members_classic_bike_used <- as.numeric(c(rep(0, times=length(by_months))))
total_members_electric_bike_used <- as.numeric(c(rep(0, times=length(by_months))))

total_casual_docked_bike_used <- as.numeric(c(rep(0, times=length(by_months))))
total_casual_classic_bike_used <- as.numeric(c(rep(0, times=length(by_months))))
total_casual_electric_bike_used <- as.numeric(c(rep(0, times=length(by_months))))

sum_members_ride_min <- as.numeric(c(rep(0, times=length(by_months))))
sum_casual_ride_min <- as.numeric(c(rep(0, times=length(by_months))))
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
                                     by_bike_type_freq,
                                     tot_member_dock_bike_use = total_members_docked_bike_used,
                                     tot_member_classic_bike_use = total_members_classic_bike_used,
                                     tot_member_electric_bike_use = total_members_electric_bike_used,
                                     tot_casual_dock_bike_use = total_casual_docked_bike_used,
                                     tot_casual_classic_bike_use = total_casual_classic_bike_used,
                                     tot_casual_electric_bike_use = total_casual_electric_bike_used,
                                     sum_members_min = sum_members_ride_min,
                                     sum_casual_min = sum_casual_ride_min))

#Remove temporary variables
rm(average_min_per_ride, by_months,
   by_bike_type_freq,by_months_num, tbl_temp,
   total_month_ride_frequency, total_month_trip_time_min,
   by_month_freq, by_membership_type_freq,
   total_members_classic_bike_used, total_members_docked_bike_used, total_members_electric_bike_used,
   total_casual_classic_bike_used, total_casual_docked_bike_used, total_casual_electric_bike_used,
   sum_casual_ride_min, sum_members_ride_min)

#Data Conversion for Data Frame Columns into Suitable Data Type
tbl_2020_summary$month_num <- as.integer(tbl_2020_summary$month_num)

#Segment: Total Number of Rides and Total Number of Riding Minutes
tbl_2020_summary$total_num_rides <- as.integer(tbl_2020_summary$total_num_rides)
tbl_2020_summary$total_time_minutes <- as.integer(tbl_2020_summary$total_time_minutes)

#Segment: Number of Members By Member Type
tbl_2020_summary$casual <- as.integer(tbl_2020_summary$casual)
tbl_2020_summary$member <- as.integer(tbl_2020_summary$member)

#Segment: Rides By Bike Type [Both Members]
tbl_2020_summary$classic_bike <- as.integer(tbl_2020_summary$classic_bike)
tbl_2020_summary$docked_bike <- as.integer(tbl_2020_summary$docked_bike)
tbl_2020_summary$electric_bike <- as.integer(tbl_2020_summary$electric_bike)

#Segment: Number of Rides By Bike Type [Members]
tbl_2020_summary$tot_member_dock_bike_use <- as.integer(tbl_2020_summary$tot_member_dock_bike_use)
tbl_2020_summary$tot_member_classic_bike_use <- as.integer(tbl_2020_summary$tot_member_classic_bike_use)
tbl_2020_summary$tot_member_electric_bike_use <- as.integer(tbl_2020_summary$tot_member_electric_bike_use)

#Segment: Number of Rides by Bike Type [Casual]
tbl_2020_summary$tot_casual_dock_bike_use <- as.integer(tbl_2020_summary$tot_casual_dock_bike_use)
tbl_2020_summary$tot_casual_classic_bike_use <- as.integer(tbl_2020_summary$tot_casual_classic_bike_use)
tbl_2020_summary$tot_casual_electric_bike_use <- as.integer(tbl_2020_summary$tot_casual_electric_bike_use)

#Segment: Number of Minutes Rode By Members
tbl_2020_summary$sum_members_min <- as.integer(tbl_2020_summary$sum_members_min)
tbl_2020_summary$sum_casual_min <- as.integer(tbl_2020_summary$sum_casual_min)

#Obtain Average Number of Minutes Per Ride
for(index in 1:nrow(tbl_2020_summary)){
  temp_hold = tbl_2020_summary$total_time_minutes[index]/tbl_2020_summary$total_num_rides[index]
  tbl_2020_summary$avg_min_per_ride[index] = temp_hold
}
rm(index, temp_hold)
tbl_2020_summary$avg_min_per_ride <- as.double(tbl_2020_summary$avg_min_per_ride,length=0)

#Obtain Bike Usage By Bike Type + Member Type
for(index in 1:nrow(tbl_2020_summary)){
  #Obtain the Member Bike Type Rides
  tbl_2020_summary$tot_member_dock_bike_use[index] <- count_Member_Rides_By_Bike_Type(tbl_2020_divvy, index+3, "member", "docked_bike")
  tbl_2020_summary$tot_member_classic_bike_use[index] <- count_Member_Rides_By_Bike_Type(tbl_2020_divvy, index+3, "member", "classic_bike")
  tbl_2020_summary$tot_member_electric_bike_use[index] <- count_Member_Rides_By_Bike_Type(tbl_2020_divvy, index+3, "member", "electric_bike")
  
  #Obtain the Casual Bike Type Rides
  tbl_2020_summary$tot_casual_dock_bike_use[index] <- count_Member_Rides_By_Bike_Type(tbl_2020_divvy, index+3, "casual", "docked_bike")
  tbl_2020_summary$tot_casual_classic_bike_use[index] <- count_Member_Rides_By_Bike_Type(tbl_2020_divvy, index+3, "casual", "classic_bike")
  tbl_2020_summary$tot_casual_electric_bike_use[index] <- count_Member_Rides_By_Bike_Type(tbl_2020_divvy, index+3, "casual", "electric_bike")
  
  #Obtain the Member and Casual Total Minutes Rode
  tbl_2020_summary$sum_members_min[index] <- sum_Member_Minutes_By_Month(tbl_2020_divvy, index+3, "member")
  tbl_2020_summary$sum_casual_min[index] <- sum_Member_Minutes_By_Month(tbl_2020_divvy, index+3, "casual")
}
rm(index)

#--------------------------------------------------------------------------------------------------------
#Step 3: Rename Columns in Data Frame
#--------------------------------------------------------------------------------------------------------
#Definitions:
# - 1: month_name: Month Name
# - 2: month_num: Month Number
# - 3: sum_rides: Number of Total Rides Made that Months
# - 4: sum_minutes: Number of Total Minutes Rode that Month
# - 5: avg_minutes_per_ride: Average Number of Minutes Per Ride
# - 6: tot_casual: Number of Casual (Non)-Members
# - 7: tot_members: Number of Total Annual Members
# - 8: tot_classic_bikes_used: Number of Classic Bikes Used [By Both Members]
# - 9: tot_docked_bikes_used: Number of Docked Bikes Used [By Both Members]
# - 10: tot_electric_bikes_used: Number of Electric Bikes Used [By Both Members]
# - 11: tot_member_dock_bike_used: Number of Dock Biked Used [By Members]
# - 12: tot_member_classic_bike_used: Number of Classic Bike Used [By Members]  
# - 13: tot_member_electric_bike_used: Number of Electric Bike Used [By Members]
# - 14: tot_casual_dock_bike_used: Number of Dock Biked Used [By Casual] 
# - 15: tot_casual_classic_bike_used: Number of Classic Bike Used [By Casual]
# - 16: tot_casual_electric_bike_used: Number of Electric Bike Used [By Casual]
# - 17: sum_members_minutes: Total Minutes Rode that Month [By Members]
# - 18: sum_casual_minutes: Total Minutes Rode that Month [By Casual]
#--------------------------------------------------------------------------------------------------------
names(tbl_2020_summary) <- c("month_name", "month_num", "sum_rides",
                             "sum_minutes", "avg_minutes_per_ride",
                             "tot_casual","tot_members", 
                             "tot_classic_bikes_used","tot_docked_bikes_used", "tot_electric_bikes_used",
                             "tot_member_dock_bike_used", "tot_member_classic_bike_used", "tot_member_electric_bike_used",
                             "tot_casual_dock_bike_used", "tot_casual_classic_bike_used", "tot_casual_electric_bike_used",
                             "sum_members_minutes", "sum_casual_minutes")
#--------------------------------------------------------------------------------------------------------
View(tbl_2020_summary)
#--------------------------------------------------------------------------------------------------------
rm(sum_Member_Minutes_By_Month, count_Member_Rides_By_Bike_Type)