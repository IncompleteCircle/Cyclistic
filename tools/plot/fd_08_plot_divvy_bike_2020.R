#==================================================================================================================================
#Creator: SJT
#Date: 06 SEP 2022
#File: fd_08_plot_divvy_bike_2020
#File Designation Number: 07
#==================================================================================================================================
#Data Phase Section: Visualization
#==================================================================================================================================
#Description:
# This file will provide plots of the divvy bike data.
# These plots will be used later in the final report in the markdown
# file.
#
# This file is also an extension of file 07, with continued plots.
# Split the file into two for maintenance reasons.
#==================================================================================================================================
#Check Package Status
package_there <- require("lubridate")
if (package_there != TRUE){
  install.packages("lubridate")
  library("lubridate")
}
package_there <- require(dplyr)
if (package_there != TRUE){
  install.packages("dplyr")
  library(dplyr)
}
package_there <- require(ggplot2)
if (package_there != TRUE){
  install.packages("ggplot2")
  library(ggplot2)
}
rm(package_there)
#==================================================================================================================================
#==================================================================================================================================
#Step 1: Extract Base Table Data For Weekday Summary
#==================================================================================================================================
#Main Base Table:
tbl_rides_weekday <- data.frame(weekday = weekdays(tbl_2020_divvy$started_at),
                                weekday_num = wday(tbl_2020_divvy$started_at),
                                trip_duration_min = tbl_2020_divvy$trip_duration_min,
                                rider_type = tbl_2020_divvy$member_casual,
                                bike_type = tbl_2020_divvy$rideable_type)
#==================================================================================================================================
#Step 2: Summarize: Both Members Data Into Table
#==================================================================================================================================
#Obtain Total Minutes Rode Per Day + Average Minutes Per Day [Both Rider Types]
tbl_2020_rides_weekday_summary <- tbl_rides_weekday %>% 
  group_by(weekday, weekday_num, rider_type, bike_type) %>% 
  summarise(num_rides = n(),
            total_minutes = sum(trip_duration_min),
            average_minutes = mean(trip_duration_min))

#Reformat Average Minutes Data
tbl_2020_rides_weekday_summary$average_minutes <- format(round(tbl_2020_rides_weekday_summary$average_minutes, 2))
tbl_2020_rides_weekday_summary$average_minutes <- as.numeric(tbl_2020_rides_weekday_summary$average_minutes)

tbl_2020_rides_weekday_summary <- arrange(tbl_2020_rides_weekday_summary, tbl_2020_rides_weekday_summary$weekday_num,
                                          tbl_2020_rides_weekday_summary$rider_type,
                                          tbl_2020_rides_weekday_summary$num_rides, tbl_2020_rides_weekday_summary$total_minutes,
                                          tbl_2020_rides_weekday_summary$average_minutes)

tbl_2020_rides_weekday_summary <- data.frame(tbl_2020_rides_weekday_summary)

rm(tbl_rides_weekday)
#==================================================================================================================================

#==================================================================================================================================
#Step 3: Create Bar Plots
#==================================================================================================================================
#1: AVERAGE MINUTES
# 1.A: AVERAGE MINUTES PER DAY BY USER AND BIKE TYPE
# 1.B: AVERAGE MINUTES PER DAY BY USER TYPE ONLY
# 1.C: AVERAGE MINUTES PER DAY BY BIKE TYPE ONLY
#
#2: TOTAL MINUTES
# 2.A: TOTAL MINUTES PER DAY BY USER AND BIKE TYPE
# 2.B: TOTAL MINUTES PER DAY BY USER TYPE
# 2.C: TOTAL MINUTES PER DAY BY BIKE TYPE
#
#3: TOTAL NUMBER OF RIDES
# 3.A: TOTAL NUMBER OF RIDES PER DAY BY USER AND BIKE TYPE
# 3.B: TOTAL NUMBER OF RIDES PER DAY BY USER TYPE
# 3.C: TOTAL NUMBER OF RIDES PER DAY BY BIKE TYPE
#==================================================================================================================================

#==================================================================================================================================
#Plot 1.A: AVERAGE MINUTES PER DAY BY USER AND BIKE TYPE
#==================================================================================================================================
plotBAR_AVGMIN_WEEKDAY_BY_USER_BIKE <- 
  ggplot(tbl_2020_rides_weekday_summary,
         aes(x=weekday_num,
             y=average_minutes,
             fill=bike_type)) +
  geom_bar(stat="identity", position="dodge") +
  facet_grid(.~rider_type)  +
    
  labs(title = "Average Minutes Rode Per Day, By Bike and User Type",
       subtitle = "Dates: April 1, 2020 to December 31, 2020",
       caption = "Source: Divvy Bikes, 2020") +
    
  xlab(paste("Weekdays", "\n", "(1:SUN, 2:MON, 3:TUE, 4:WED, 5:THU, 6:FRI, 7:SAT)")) +
  ylab("Average Minutes Rode") +
    
  theme(
    plot.title = element_text(color="black", size=13, face="bold"),
    plot.subtitle = element_text(color = "black", size = 10, face = "bold"),
    plot.caption = element_text(color = "black", size = 10, face = "italic"),
    axis.title.x = element_text(color="#666699", size = 8, face="bold"),
    axis.title.y = element_text(color="#232b2b", size = 12, face="bold"),
    legend.title = element_blank(),
    axis.text.x = element_text(angle = 0))

#==================================================================================================================================
#Plot 1.B: AVERAGE MINUTES PER DAY BY USER TYPE ONLY
#==================================================================================================================================
plotBAR_AVGMIN_WEEKDAY_BY_USER <-
  ggplot(tbl_2020_rides_weekday_summary,
         aes(x=weekday_num,
             y=average_minutes,
             fill=rider_type)) +
  geom_bar(stat="identity", position="dodge") +

  labs(title = "Average Minutes Rode Per Day, By User Type",
       subtitle = "Dates: April 1, 2020 to December 31, 2020",
       caption = "Source: Divvy Bikes, 2020") +
  
  xlab(paste("Weekdays", "\n", "(1:SUN, 2:MON, 3:TUE, 4:WED, 5:THU, 6:FRI, 7:SAT)")) +
  ylab("Average Minutes Rode") +
  
  theme(
    plot.title = element_text(color="black", size=13, face="bold"),
    plot.subtitle = element_text(color = "black", size = 10, face = "bold"),
    plot.caption = element_text(color = "black", size = 10, face = "italic"),
    axis.title.x = element_text(color="#666699", size = 10, face="bold"),
    axis.title.y = element_text(color="#232b2b", size = 12, face="bold"),
    legend.title = element_blank(),
    axis.text.x = element_text(angle = 0))

#==================================================================================================================================
#Plot 1.C: AVERAGE MINUTES PER DAY BY BIKE TYPE ONLY
#==================================================================================================================================
plotBAR_AVGMIN_WEEKDAY_BY_BIKE <-
  ggplot(tbl_2020_rides_weekday_summary,
         aes(x=weekday_num,
             y=average_minutes,
             fill=bike_type)) +
  geom_bar(stat="identity", position="dodge") +
  
  labs(title = "Average Minutes Rode Per Day, By Bike Type",
       subtitle = "Dates: April 1, 2020 to December 31, 2020",
       caption = "Source: Divvy Bikes, 2020") +
  
  xlab(paste("Weekdays", "\n", "(1:SUN, 2:MON, 3:TUE, 4:WED, 5:THU, 6:FRI, 7:SAT)")) +
  ylab("Average Minutes Rode") +
  
  theme(
    plot.title = element_text(color="black", size=13, face="bold"),
    plot.subtitle = element_text(color = "black", size = 10, face = "bold"),
    plot.caption = element_text(color = "black", size = 10, face = "italic"),
    axis.title.x = element_text(color="#666699", size = 10, face="bold"),
    axis.title.y = element_text(color="#232b2b", size = 12, face="bold"),
    legend.title = element_blank(),
    axis.text.x = element_text(angle = 0))

#==================================================================================================================================
#Plot 2.A: TOTAL MINUTES PER DAY BY USER AND BIKE TYPE
#==================================================================================================================================
plotBAR_TOTMIN_WEEKDAY_BY_USER_BIKE <-
  ggplot(tbl_2020_rides_weekday_summary,
         aes(x=weekday_num,
             y=total_minutes,
             fill=bike_type)) +
  geom_bar(stat="identity", position="dodge") +
  facet_grid(.~rider_type)  +
  
  labs(title = "Total Minutes Rode Per Day, By Bike and User Type",
       subtitle = "Dates: April 1, 2020 to December 31, 2020",
       caption = "Source: Divvy Bikes, 2020") +
  
  xlab(paste("Weekdays", "\n", "(1:SUN, 2:MON, 3:TUE, 4:WED, 5:THU, 6:FRI, 7:SAT)")) +
  ylab("Total Minutes Rode") +
  
  theme(
    plot.title = element_text(color="black", size=13, face="bold"),
    plot.subtitle = element_text(color = "black", size = 10, face = "bold"),
    plot.caption = element_text(color = "black", size = 10, face = "italic"),
    axis.title.x = element_text(color="#666699", size = 10, face="bold"),
    axis.title.y = element_text(color="#232b2b", size = 12, face="bold"),
    legend.title = element_blank(),
    axis.text.x = element_text(angle = 0))

#==================================================================================================================================
#Plot 2.B: TOTAL MINUTES PER DAY BY USER TYPE
#==================================================================================================================================
plotBAR_TOTMIN_WEEKDAY_BY_USER <-
  ggplot(tbl_2020_rides_weekday_summary,
         aes(x=weekday_num,
             y=total_minutes,
             fill=rider_type)) +
  geom_bar(stat="identity", position="dodge") +
  
  labs(title = "Total Minutes Rode Per Day, By User Type",
       subtitle = "Dates: April 1, 2020 to December 31, 2020",
       caption = "Source: Divvy Bikes, 2020") +
  
  xlab(paste("Weekdays", "\n", "(1:SUN, 2:MON, 3:TUE, 4:WED, 5:THU, 6:FRI, 7:SAT)")) +
  ylab("Total Minutes Rode") +
  
  theme(
    plot.title = element_text(color="black", size=13, face="bold"),
    plot.subtitle = element_text(color = "black", size = 10, face = "bold"),
    plot.caption = element_text(color = "black", size = 10, face = "italic"),
    axis.title.x = element_text(color="#666699", size = 10, face="bold"),
    axis.title.y = element_text(color="#232b2b", size = 12, face="bold"),
    legend.title = element_blank(),
    axis.text.x = element_text(angle = 0))

#==================================================================================================================================
#Plot 2.C: TOTAL MINUTES PER DAY BY BIKE TYPE
#==================================================================================================================================
plotBAR_TOTMIN_WEEKDAY_BY_BIKE <-
  ggplot(tbl_2020_rides_weekday_summary,
         aes(x=weekday_num,
             y=total_minutes,
             fill=bike_type)) +
  geom_bar(stat="identity", position="dodge") +
  
  labs(title = "Total Minutes Rode Per Day, By Bike Type",
       subtitle = "Dates: April 1, 2020 to December 31, 2020",
       caption = "Source: Divvy Bikes, 2020") +
  
  xlab(paste("Weekdays", "\n", "(1:SUN, 2:MON, 3:TUE, 4:WED, 5:THU, 6:FRI, 7:SAT)")) +
  ylab("Total Minutes Rode") +
  
  theme(
    plot.title = element_text(color="black", size=13, face="bold"),
    plot.subtitle = element_text(color = "black", size = 10, face = "bold"),
    plot.caption = element_text(color = "black", size = 10, face = "italic"),
    axis.title.x = element_text(color="#666699", size = 10, face="bold"),
    axis.title.y = element_text(color="#232b2b", size = 12, face="bold"),
    legend.title = element_blank(),
    axis.text.x = element_text(angle = 0))

#==================================================================================================================================
#Plot 3.A: TOTAL NUMBER OF RIDES PER DAY BY USER AND BIKE TYPE
#==================================================================================================================================
plotBAR_TOTRIDES_WEEKDAY_BY_USER_BIKE <-
  ggplot(tbl_2020_rides_weekday_summary,
         aes(x=weekday_num,
             y=num_rides,
             fill=bike_type)) +
  geom_bar(stat="identity", position="dodge") +
  facet_wrap(.~rider_type) +
  
  labs(title = "Total Number of Rides Per Day, By Bike and User Type",
       subtitle = "Dates: April 1, 2020 to December 31, 2020",
       caption = "Source: Divvy Bikes, 2020") +
  
  xlab(paste("Weekdays", "\n", "(1:SUN, 2:MON, 3:TUE, 4:WED, 5:THU, 6:FRI, 7:SAT)")) +
  ylab("Total Number of Rides") +
  
  theme(
    plot.title = element_text(color="black", size=13, face="bold"),
    plot.subtitle = element_text(color = "black", size = 10, face = "bold"),
    plot.caption = element_text(color = "black", size = 10, face = "italic"),
    axis.title.x = element_text(color="#666699", size = 10, face="bold"),
    axis.title.y = element_text(color="#232b2b", size = 12, face="bold"),
    legend.title = element_blank(),
    axis.text.x = element_text(angle = 0))

#==================================================================================================================================
#Plot 3.B: TOTAL NUMBER OF RIDES PER DAY BY USER TYPE
#==================================================================================================================================
plotBAR_TOTRIDES_WEEKDAY_BY_USER <-
  ggplot(tbl_2020_rides_weekday_summary,
         aes(x=weekday_num,
             y=num_rides,
             fill=rider_type)) +
  geom_bar(stat="identity", position="dodge") +
  
  labs(title = "Total Number of Rides Per Day, By User Type",
       subtitle = "Dates: April 1, 2020 to December 31, 2020",
       caption = "Source: Divvy Bikes, 2020") +
  
  xlab(paste("Weekdays", "\n", "(1:SUN, 2:MON, 3:TUE, 4:WED, 5:THU, 6:FRI, 7:SAT)")) +
  ylab("Total Number of Rides") +
  
  theme(
    plot.title = element_text(color="black", size=13, face="bold"),
    plot.subtitle = element_text(color = "black", size = 10, face = "bold"),
    plot.caption = element_text(color = "black", size = 10, face = "italic"),
    axis.title.x = element_text(color="#666699", size = 10, face="bold"),
    axis.title.y = element_text(color="#232b2b", size = 12, face="bold"),
    legend.title = element_blank(),
    axis.text.x = element_text(angle = 0))

#==================================================================================================================================
#Plot 3.C: TOTAL NUMBER OF RIDES PER DAY BY BIKE TYPE
#==================================================================================================================================
plotBAR_TOTRIDES_WEEKDAY_BY_BIKE <-
  ggplot(tbl_2020_rides_weekday_summary,
         aes(x=weekday_num,
             y=num_rides,
             fill=bike_type)) +
    geom_bar(stat="identity", position="dodge") +
    
    labs(title = "Total Number of Rides Per Day, By Bike Type",
         subtitle = "Dates: April 1, 2020 to December 31, 2020",
         caption = "Source: Divvy Bikes, 2020") +
    
    xlab(paste("Weekdays", "\n", "(1:SUN, 2:MON, 3:TUE, 4:WED, 5:THU, 6:FRI, 7:SAT)")) +
    ylab("Total Number of Rides") +
    
    theme(
      plot.title = element_text(color="black", size=13, face="bold"),
      plot.subtitle = element_text(color = "black", size = 10, face = "bold"),
      plot.caption = element_text(color = "black", size = 10, face = "italic"),
      axis.title.x = element_text(color="#666699", size = 10, face="bold"),
      axis.title.y = element_text(color="#232b2b", size = 12, face="bold"),
      legend.title = element_blank(),
      axis.text.x = element_text(angle = 0))
#==================================================================================================================================