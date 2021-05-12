#### Tidy Tuesday 2021 Week 20: For my fifth Tidy Tuesday, I did my first animation. ####
#### Created by: Natalie Beckman-Smith ####
#### Updated on: 2021-05-11 ####
################################################################################

#### Load Libraries ####
library(tidyverse)
library(here)
library(lubridate)
library(tidytuesdayR)
library(gganimate)

#### Load Data ####
broadband <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-05-11/broadband.csv')


#### Data Analysis ####
broadband <- broadband %>% 
  rename(availability = "BROADBAND AVAILABILITY PER FCC") %>% #renamed the variables 
  rename(usage = "BROADBAND USAGE")
broadband$availability <- as.numeric(broadband$availability) #changed the values to numeric 
broadband$usage <- as.numeric(broadband$usage)

#### Data Visualization ####
a <- ggplot(data = broadband, #made scatterplot
       mapping = aes(x = availability,
                     y = usage)) +
  geom_point() +
  theme_classic() +
  transition_states( #made animation
    ST, #animated by state
    transition_length = 100, #slowed it down here
    state_length = 100 #slowed it down here
)+
  ease_aes('cubic-in-out') + #animation type
  ggtitle('Broadband usage vs. availability per FCC', #added title
          subtitle = 'Now showing {closest_state}') + #added special subtitle
anim_save(here("Tidy_Tuesday5","Output","broadband.gif")) #saved output as .gif
