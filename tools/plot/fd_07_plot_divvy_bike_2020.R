#-----------------------------------------------------------------------
#Creator: SJT
#Date: 30 AUG 2022
#File: fd_07_plot_divvy_bike_2020
#File Designation Number: 07
#-----------------------------------------------------------------------
#Data Phase Section: Visualization
#-----------------------------------------------------------------------
#Description:
# This file will provide plots of the divvy bike data.
# These plots will be used later in the final report in the markdown
# file.
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
#Step 1: Preliminary Checks and Builds
#-----------------------------------------------------------------------
#Check if necessary package is installed and loaded.
package_there <- require(ggplot2)
if (package_there != TRUE){
  install.packages("ggplot2")
  library(ggplot2)
}
rm(package_there)
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
#Step 2: GGPlot - Geom: Histogram
#-----------------------------------------------------------------------
#Plot the Following:
# 1: Frequency of Rides:
#     1.a: Rides <= 24 Hours [Minutes]
#           1.a.1: By Member Type
#           1.a.2: By Bike Type
#     1.b: Rides > 24 Hours [Days]
#           1.b.1: By Member Type
#           1.b.2: By Bike Type
#-----------------------------------------------------------------------
#Additional Details:
# These plots will be utilized in the markdown file at the end.
#-----------------------------------------------------------------------
################################################################################
#Plot: 1.a.1: Ride <= 24 Hours By Member Type [Minutes]
plotHIST_less_24H_by_member_type <-
  ggplot(tbl_2020_day_trips, aes(x = minutes_ride)) +
  
  geom_histogram(aes(color = member_type, fill = member_type),
                 position = "identity", bins = 60, alpha = 0.4) +
  
  scale_color_manual(values = c("#00AFBB", "#E7B800")) +
  scale_fill_manual(values = c("#00AFBB", "#E7B800")) +
  
  labs(title = "Distribution of Trip Durations (Minutes) By Member Type",
      subtitle = "Dates: April 1, 2020 to December 31, 2020 | BINS = 60",
      caption = "Source: Divvy Bikes, 2020") +
  
  xlab("Trip Duration (Minutes)") +
  ylab("Number of Rides") +
  
  theme(
    plot.title = element_text(color="black", size = 14, face="bold"),
    plot.subtitle = element_text(color = "black", size = 12, face = "bold"),
    plot.caption = element_text(color = "black", size = 10, face = "italic"),
    axis.title.x = element_text(color="#666699", size=12, face="bold"),
    axis.title.y = element_text(color="#232b2b", size=12, face="bold"),
    legend.title = element_blank())

################################################################################
#Plot: 1.a.2: Ride <= 24 Hours By Bike Type [Minutes]
plotHIST_less_24H_by_bike_type <-
  ggplot(tbl_2020_day_trips, aes(x = minutes_ride)) +
  
  geom_histogram(aes(color = bike_type, fill = bike_type),
                 position = "identity", bins = 60, alpha = 0.4) +
  
  scale_color_manual(values = c("#00AFBB", "#E7B800", "#FF7276")) +
  scale_fill_manual(values = c("#00AFBB", "#E7B800", "#FF7276")) +
  
  labs(title = "Distribution of Trip Durations (Minutes) By Bike Type",
       subtitle = "Dates: April 1, 2020 to December 31, 2020 | BINS = 60",
       caption = "Source: Divvy Bikes, 2020") +
  
  xlab("Trip Duration (Minutes)") +
  ylab("Number of Rides") +
  ylim(0,260000) +
  xlim(0,1441) +  
  theme(
    plot.title = element_text(color="black", size = 14, face="bold"),
    plot.subtitle = element_text(color = "black", size = 12, face = "bold"),
    plot.caption = element_text(color = "black", size = 10, face = "italic"),
    axis.title.x = element_text(color="#666699", size=12, face="bold"),
    axis.title.y = element_text(color="#232b2b", size=12, face="bold"),
    legend.title = element_blank())

################################################################################
#Plot: 1.b.1: Ride > 24 Hours By Member Type [Days]
plotHIST_more_24H_by_member_type <-
  ggplot(tbl_2020_day_plus_trips, aes(x = days_check_out)) +
  
  geom_histogram(aes(color = member_type, fill = member_type),
                 position = "identity", bins = 40, alpha = 0.4) +
  
  scale_color_manual(values = c("#00AFBB", "#E7B800")) +
  scale_fill_manual(values = c("#00AFBB", "#E7B800")) +
  
  labs(title = "Distribution of Trip Durations (Days) By Member Type",
       subtitle = "Dates: April 1, 2020 to December 31, 2020 | BINS = 40",
       caption = "Source: Divvy Bikes, 2020") +
  
  xlab("Trip Duration (Days)") +
  ylab("Number of Rides") +
  
  theme(
    plot.title = element_text(color="black", size = 14, face="bold"),
    plot.subtitle = element_text(color = "black", size = 12, face = "bold"),
    plot.caption = element_text(color = "black", size = 10, face = "italic"),
    axis.title.x = element_text(color="#666699", size=12, face="bold"),
    axis.title.y = element_text(color="#232b2b", size=12, face="bold"),
    legend.title = element_blank())
################################################################################
#Plot: 1.b.1: Ride > 24 Hours By Bike Type [Days]
plotHIST_more_24H_by_bike_type <-
  ggplot(tbl_2020_day_plus_trips, aes(x = days_check_out)) +
  
  geom_histogram(aes(color = bike_type, fill = bike_type),
                 position = "identity", bins = 40, alpha = 0.4) +
  
  scale_color_manual(values = c("#00AFBB", "#E7B800", "#FF7276")) +
  scale_fill_manual(values = c("#00AFBB", "#E7B800", "#FF7276")) +
  
  labs(title = "Distribution of Trip Durations (Days) By Bike Type",
       subtitle = "Dates: April 1, 2020 to December 31, 2020 | BINS = 40",
       caption = "Source: Divvy Bikes, 2020") +
  
  xlab("Trip Duration (Days)") +
  ylab("Number of Rides") +
 
  theme(
    plot.title = element_text(color="black", size=14, face="bold"),
    plot.subtitle = element_text(color = "black", size = 12, face = "bold"),
    plot.caption = element_text(color = "black", size = 10, face = "italic"),
    axis.title.x = element_text(color="#666699", size=12, face="bold"),
    axis.title.y = element_text(color="#232b2b", size=12, face="bold"),
    legend.title = element_blank())
################################################################################

#-----------------------------------------------------------------------
#Step 3: GGPlot - Geom: Bar Charts
#-----------------------------------------------------------------------
#Plot the Following: [Source - Table: tbl_2020_summary]
# 1: Aggregate Trends Across The Year [Monthly]
#   1.a.1: Total Rides By Members and Month
#   Fields: {sum_rides, tot_members, tot_casual}
#
#   1.a.2: Sum Minutes By Month [Total + Both Members]
#   Fields: {sum_minutes, sum_members_minutes, sum_casual_minutes, 
#            avg_minutes_per_ride}
#
#   1.a.3: Total Bike Usage By Month
#   Fields: {tot_classic_bikes_used, tot_docked_bikes_used,
#           tot_electric_bikes_used}
#
#   1.a.4: Total Bike Usage By Member and Month
#   Fields: {(tot_casual_dock_bike_used, tot_member_dock_bike_used),
#           (tot_casual_classic_bike_used, tot_member_classic_bike_used),
#           (tot_casual_electric_bike_used, tot_member_electric_bike_used)}
#-----------------------------------------------------------------------
#Additional Details:
# These plots will be utilized in the markdown file at the end.
#-----------------------------------------------------------------------
#General/Standard Variables Used for the (gg)plots.
date_x_axis <- c("04: APR", "05: MAY", "06: JUN",
                 "07: JUL", "08: AUG", "09: SEP",
                 "10: OCT", "11: NOV", "12: DEC")

gg_std_theme <- theme(
                      plot.title = element_text(color="black", size=14, face="bold"),
                      plot.subtitle = element_text(color = "black", size = 12, face = "bold"),
                      plot.caption = element_text(color = "black", size = 10, face = "italic"),
                      axis.title.x = element_text(color="#666699", size=12, face="bold"),
                      axis.title.y = element_text(color="#232b2b", size=12, face="bold"),
                      legend.title = element_blank(),
                      axis.text.x = element_text(angle = 0))

############################################################################################################
#Plot: 1.a.1: Total Rides By Members and Month
#Fields: {tot_members, tot_casual, sum_rides}
#tot_members plotted
plotBAR_TOTRIDES_MEMBERS <- ggplot(data=tbl_2020_summary, mapping=aes(x = date_x_axis, y = tot_members)) +
                            geom_bar(stat="identity") +
                            geom_text(aes(label=tot_members), vjust=-.5) +
                              
                            labs(title = "Total Number of Rides Made By Members, By Month",
                                 subtitle = "Dates: April 1, 2020 to December 31, 2020",
                                 caption = "Source: Divvy Bikes, 2020") +
                              
                            xlab("Months") +
                            ylab("Total Rides")+
                            
                            gg_std_theme 

#tot_casual plotted
plotBAR_TOTRIDES_CASUAL <- ggplot(data=tbl_2020_summary, mapping=aes(x = date_x_axis, y = tot_casual)) +
                            geom_bar(stat="identity") +
                            geom_text(aes(label=tot_casual), vjust=-.5) +
                            
                            labs(title = "Total Number of Rides Made By Casual Users, By Month",
                                 subtitle = "Dates: April 1, 2020 to December 31, 2020",
                                 caption = "Source: Divvy Bikes, 2020") +
                            
                            xlab("Months") +
                            ylab("Total Rides")+
                            
                            gg_std_theme 
                            
#sum_rides plotted
plotBAR_TOTRIDES_ALL <-  ggplot(data=tbl_2020_summary, mapping=aes(x = date_x_axis, y = sum_rides)) +
                            geom_bar(stat="identity") +
                            geom_text(aes(label=sum_rides), vjust=-.5) +
                            
                            labs(title = "Total Number of Rides Made, By Month",
                                 subtitle = "Dates: April 1, 2020 to December 31, 2020 | Both: Casual + Members",
                                 caption = "Source: Divvy Bikes, 2020") +
                            
                            xlab("Months") +
                            ylab("Total Rides")+
                            
                            gg_std_theme 
############################################################################################################
#1.a.2: Sum Minutes By Month [Total + Both Members]
#Fields: {sum_minutes, sum_members_minutes, sum_casual_minutes, avg_minutes_per_ride}

#sum_minutes plotted
plotBAR_TOTMIN_ALL <- ggplot(data=tbl_2020_summary, mapping=aes(x = date_x_axis, y = sum_minutes)) +
                          geom_bar(stat="identity") +
                          geom_text(aes(label=sum_minutes), vjust=-.5) +
                          
                          labs(title = "Total Minutes Rode, By Month",
                               subtitle = "Dates: April 1, 2020 to December 31, 2020 | Both: Casual + Members",
                               caption = "Source: Divvy Bikes, 2020") +
                          
                          xlab("Months") +
                          ylab("Sum of Minutes")+
                          
                          gg_std_theme


plotBAR_TOTMIN_MEMBERS <- ggplot(data=tbl_2020_summary, mapping=aes(x = date_x_axis, y = sum_members_minutes)) +
                          geom_bar(stat="identity") +
                          geom_text(aes(label=sum_members_minutes), vjust=-.5) +
                          
                          labs(title = "Total Minutes Rode By Members, By Month",
                               subtitle = "Dates: April 1, 2020 to December 31, 2020",
                               caption = "Source: Divvy Bikes, 2020") +
                          
                          xlab("Months") +
                          ylab("Sum of Minutes")+
                          
                          gg_std_theme


plotBAR_TOTMIN_CASUAL <-  ggplot(data=tbl_2020_summary, mapping=aes(x = date_x_axis, y = sum_casual_minutes)) +
                          geom_bar(stat="identity") +
                          geom_text(aes(label=sum_casual_minutes), vjust=-.5) +
                          
                          labs(title = "Total Minutes Rode By Casual Users, By Month",
                               subtitle = "Dates: April 1, 2020 to December 31, 2020",
                               caption = "Source: Divvy Bikes, 2020") +
                          
                          xlab("Months") +
                          ylab("Sum of Minutes")+
                          
                          gg_std_theme

plotBAR_AVGMIN_ALL <- ggplot(data=tbl_2020_summary, mapping=aes(x = date_x_axis, y = avg_minutes_per_ride)) +
                      geom_bar(stat="identity") +
                      
                      labs(title = "Average Minutes Per Ride, By Month",
                           subtitle = "Dates: April 1, 2020 to December 31, 2020 | Both: Casual + Members",
                           caption = "Source: Divvy Bikes, 2020") +
                      
                      xlab("Months") +
                      ylab("Average Minutes")+
                      
                      gg_std_theme
############################################################################################################