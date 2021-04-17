#### Tidy Tuesday 2021 Week 13: For my fourth Tidy Tuesday, I decided to practice using plotly and discovered a very easy way to convert ggplots to plotly plots using the function "ggploty"####
#### Created by: Natalie Beckman-Smith ####
#### Created on: 2021-03-22 ####
#### Updated on: 2021-04-16 ####
################################################################################

#### Load Libraries ####
library(tidyverse)
library(here)
library(tidytuesdayR)
library(plotly)

#### Load Data ####
unvotes <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-23/unvotes.csv')
roll_calls <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-23/roll_calls.csv')
issues <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-23/issues.csv')

#### Data Analysis ####
usvotes <- unvotes %>% 
  filter(country == "United States")

#### Data Visualization ####
voteplot <- ggplot(data = usvotes,#create the plot in ggplot as normal 
                   mapping = aes(x = vote)) +
            geom_bar(color = rgb(0.1,0.4,0.5,0.7), fill=rgb(0.1,0.4,0.5,0.7)) + #change the color of the bars 
            labs(x = "Vote Type", #add labels 
                 y = "Number of Votes",
                 title = "United States UN Vote History") +
            theme_classic() #change the theme 

voteplot

voteplotly <- ggplotly(voteplot) #convert the plot to plotly 
voteplotly