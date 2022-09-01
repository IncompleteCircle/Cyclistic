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
#
#
#
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