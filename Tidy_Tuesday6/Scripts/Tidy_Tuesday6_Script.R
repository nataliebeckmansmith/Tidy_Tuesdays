#### Tidy Tuesday 2021 Week 16: For my sixth Tidy Tuesday, I tried my hand at making a violin plot and using a new theme. ####
#### Created by: Natalie Beckman-Smith ####
#### Updated on: 2021-05-12 ####
################################################################################

#### Load Libraries ####
library(tidyverse)
library(here)
library(tidytuesdayR)
library(ggthemes)

#### Load Data ####
post_offices <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-04-13/post_offices.csv')

#### Data Analysis ####
post_offices_clean <- post_offices %>% #cleaned up dataframe to include only things I wanted to plot
  filter(state == "CA" | state == "CO" | state == "DE" | state == "FL") %>% 
  select(state, gnis_elev_in_m) %>% 
  rename(elev = "gnis_elev_in_m") %>% 
  na.omit()

#### Data Visualization ####
ggplot(data = post_offices_clean, 
       mapping = aes(x = state,
                     y = elev,
                     color = state,
                     fill = state)) +
  geom_violin(show.legend = FALSE) + #made a violin plot
  theme_economist() + #used the economist theme
  scale_fill_economist() +
  scale_color_economist() +
  labs(title = "Post office elevation", subtitle = "by state", y = "elevation (m)") + 
  ggsave(here("Tidy_Tuesday6","Output","elevation.png"), 
         width = 10, height = 5)