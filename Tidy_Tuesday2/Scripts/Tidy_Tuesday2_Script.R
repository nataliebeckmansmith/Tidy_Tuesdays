#### Tidy Tuesday 2021 Week 11: For my second Tidy Tuesday, I practiced using the select and filter functions. I tried messing around with the apply and colMeans functions to try to create one stacked bar graph with the percents of pass/fail for each decade, but I could not figure that out yet. ####
#### Created by: Natalie Beckman-Smith ####
#### Created on: 2021-03-15 ####
#### Updated on: 2021-03-16 ####
################################################################################

#### Load Libraries ####
library(tidyverse)
library(here)
library(lubridate)
library(tidytuesdayR)

#### Load Data ####
raw_bechdel <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-09/raw_bechdel.csv')
movies <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-09/movies.csv')

#### Data Analysis ####
movies_clean <- movies %>% #creates new dataset with only the year and binary Bechdel results columns 
  select(year, binary)

seventies <- movies_clean %>% #creates a new dataset with only rows from the 1970s
  filter(year < "1980")

eighties <- movies_clean %>% #creates a new dataset with only rows from the 1980s
  filter(year < "1990", year > "1979")

nineties <- movies_clean %>% #creates a new dataset with only rows from the 1990s
  filter(year < "2000", year > "1989")

twothousands <- movies_clean %>% #creates a new dataset with only rows from the 2000s
  filter(year < "2010", year > "1999")

#### Data Visualization ####
#1970s plot
ggplot(data = seventies, 
       mapping = aes(x = binary,
                     color = binary, #fills in the bars with different colors
                     fill = binary)) + 
  geom_bar(show.legend = FALSE) + #gets rid of color legend 
  labs(x = "Bechdel Test", #gives labels 
       y = "Number of Films",
       title = "Bechdel test results for films from the 1970s") +
  theme_classic() + #changes plot aesthetic theme 
  ggsave(here("Tidy_Tuesday2","Output","TidyTuesday2Plot1.png"), #exported plot as an image 
         width = 7, height = 5)

#1980s plot
ggplot(data = eighties, 
       mapping = aes(x = binary,
                     color = binary,
                     fill = binary)) + 
  geom_bar(show.legend = FALSE) +
  labs(x = "Bechdel Test", #gives labels 
       y = "Number of Films",
       title = "Bechdel test results for films from the 1980s") +
  theme_classic() +
  ggsave(here("Tidy_Tuesday2","Output","TidyTuesday2Plot2.png"), 
         width = 7, height = 5)

#1990s plot 
ggplot(data = nineties, 
       mapping = aes(x = binary,
                     color = binary,
                     fill = binary)) + 
  geom_bar(show.legend = FALSE) +
  labs(x = "Bechdel Test", #gives labels 
       y = "Number of Films",
       title = "Bechdel test results for films from the 1990s") +
  theme_classic() +
  ggsave(here("Tidy_Tuesday2","Output","TidyTuesday2Plot3.png"), 
         width = 7, height = 5)

#2000s plot
ggplot(data = twothousands, 
       mapping = aes(x = binary,
                     color = binary,
                     fill = binary)) + 
  geom_bar(show.legend = FALSE) +
  labs(x = "Bechdel Test", #gives labels 
       y = "Number of Films",
       title = "Bechdel test results for films from the 2000s") +
  theme_classic() +
  ggsave(here("Tidy_Tuesday2","Output","TidyTuesday2Plot4.png"), 
         width = 7, height = 5)