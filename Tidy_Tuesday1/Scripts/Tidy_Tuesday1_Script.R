#### Tidy Tuesday 2021 Week 10: For my first Tidy Tuesday, I mainly wanted to practice importing the data and doing a visualization on my own, so nothing too fancy. I wanted to figure out how to connect points from sequential years, but I could only figure out how to make single line segments per brand. ####
#### Created by: Natalie Beckman-Smith ####
#### Created on: 2021-03-01 ####
#### Updated on: 2021-03-14 ####
################################################################################

#### Load Libraries ####
library(tidyverse)
library(here)
library(lubridate)
library(tidytuesdayR)
library(viridis)
#### Load Data ####
tuesdata <- tidytuesdayR::tt_load('2021-03-02') #Loads in Tidy Tuesday data for this week
youtube <- tuesdata$youtube

#### Data Visualization ####
ggplot(data = youtube, #uses this Tidy Tuesday dataset 
       mapping = aes(x = year, #chooses the variables to be plotted
                     y = brand,
                     color = brand)) + #uses different colored points for the different brands 
  geom_point(show.legend = FALSE) + #gets rid of legend 
  labs(x = "Year", #gives labels 
      y = "Brand",
      title = "Whether or not a brand had a commercial appear in that year's Super Bowl") +
  scale_color_viridis(discrete=TRUE) +
  theme_bw() +
  ggsave(here("Tidy_Tuesday1","Output","TidyTuesday1Plot.png"), #exported plot as an image 
         width = 7, height = 5)
  


