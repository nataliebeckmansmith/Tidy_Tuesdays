#### Tidy Tuesday 2021 Week 15: For my seventh Tidy Tuesday, I practiced more animation, this time with a line graph. ####
#### Created by: Natalie Beckman-Smith ####
#### Updated on: 2021-05-12 ####
################################################################################

#### Load Libraries ####
library(tidyverse)
library(here)
library(tidytuesdayR)
library(ggthemes)
library(hrbrthemes)
library(gganimate)
require(scales)

#### Load Data ####
forest <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-04-06/forest.csv')
forest_area <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-04-06/forest_area.csv')
brazil_loss <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-04-06/brazil_loss.csv')
soybean_use <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-04-06/soybean_use.csv')
vegetable_oil <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-04-06/vegetable_oil.csv')

#### Data Analysis ####
forest_na <- forest %>% #filtered out only North America
  filter(entity == "Mexico" | entity == "United States" | entity == "Canada")

#### Data Visualization ####
forest_na %>%
  ggplot(aes(x = year, y = net_forest_conversion, group = entity, color = entity)) +
  geom_line() + #created line graph
  geom_point() + #added point
  scale_y_continuous(labels = comma) + #changed y axis from scientific notation
  geom_hline(yintercept = 0) + #added a bold line for 0
  labs(title ="Net forest conversion in North America", y = "net forest conversion", color = "country") + #added labels
  theme_ipsum() + #changed theme
  transition_reveal(year) + #animated it by year
  anim_save(here("Tidy_Tuesday7", "Output", "deforestation.gif"))