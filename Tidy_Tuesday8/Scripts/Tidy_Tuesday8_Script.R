#### Tidy Tuesday 2021 Week 19: For my eighth Tidy Tuesday, I made a lollipop chart and practiced using more themes and palettes. ####
#### Created by: Natalie Beckman-Smith ####
#### Updated on: 2021-05-12 ####
################################################################################

#### Load Libraries ####
library(tidyverse)
library(here)
library(tidytuesdayR)
library(ggthemes)
library(viridis)

#### Load Data ####
water <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-05-04/water.csv')

#### Data Analysis ####
kenya <- water %>% 
  filter(country_name == "Kenya") %>% #filtered only Kenya
  select(country_name, water_source) %>%  #filtered only water source data
  remove_missing() %>% #removed NAs
  group_by(water_source) %>%  #This made a count of each different type of water source
  summarise(no_rows = length(water_source))
  
#### Data Visualization ####
ggplot(data = kenya, aes(x=water_source, y=no_rows, color = water_source)) + 
  geom_point(size=3) + #created points
  geom_segment(aes(x=water_source, #made the "stems"
                   xend=water_source, 
                   y=0, 
                   yend=no_rows)) + 
  labs(title = "Water Sources in Kenya", #changed labels
       color = "source type",
       y = "number") + 
  scale_color_viridis(discrete = TRUE, option="plasma") + #changed color
  theme_hc(style = "darkunica") + #changed theme
  theme(axis.title.x=element_blank(), #removed x-axis
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) + 
  ggsave(here("Tidy_Tuesday8","Output","water.png"), 
         width = 10, height = 5)
  
  
  
