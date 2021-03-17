#### Tidy Tuesday 2021 Week 12: For my third Tidy Tuesday, I used Steam data to make a plot about concurrent TF2 player numbers. I learned how to manually change almost all aspects of a plot's themes, how to use custom fonts, and how to make custom point markers from images. ####
#### Created by: Natalie Beckman-Smith ####
#### Created on: 2021-03-16 ####
#### Updated on: 2021-03-16 ####
################################################################################

#### Load Libraries ####
library(tidyverse)
library(here)
library(lubridate)
library(tidytuesdayR)
library(ggimage) #allows custom markers from images 
library(extrafont) #allows custom fonts
library(scales) #allows editing of axis format

#### Load Data ####
games <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-16/games.csv')

#### Data Analysis ####
 tf2 <- games %>% #creates new dataset
  unite(col = "Date", #column new column combining the year and month columns 
        c(year,month), 
        sep = " ", #separates them by a space
        remove = TRUE) %>% #removes the original year and month columns
  mutate(Date_true = ym(Date)) %>% #creates a new column for combined date data to be transformed into actual dates
  select(gamename, Date, Date_true, avg) %>% #selects which columns from "games" to bring into the new dataset
  filter(gamename == "Team Fortress 2") #filters out only TF2 for our dataset

#### Data Visualization ####
#Sandvich Plot
options(scipen=5) #prevents axis from being in scientific notation
loadfonts(device = "win", quiet = TRUE) #makes it so I can use custom fonts 
sandvichimage <- data.frame(x = rnorm(10), #creates image to replace point markers
                            y = rnorm(10),
                            image = sample(c("https://wiki.teamfortress.com/w/images/thumb/9/95/Sandvich.png/250px-Sandvich.png"),
                            size=10, replace = TRUE))

ggplot(data = tf2,
       mapping = aes(x = Date_true,
                     y = avg,
                     group = 1)) + #allows line graph to be made
  geom_line(color ="#36322E", #changes color of line
            size = 2) + #changes size of line
  geom_point() +
  theme(text = element_text(family = "TF2 Build"), #changes font
        axis.text.x = element_text(face="bold", #bolds axis text
                                   color="#F5E8DF", #changes color of axis text
                                   size=14, #changes size of axis text
                                   family = "TF2"), #changes font of axis text
        axis.text.y = element_text(face="bold", #bolds axis text
                                   color="#F5E8DF", #changes color of axis text
                                   size=14, #changes size of axis text
                                   angle=45, #changes angle of axis text 
                                   family = "TF2"), #changes font of axis text 
        plot.title = element_text(color = "#F5E8DF", #changes color of title
                                  size = 13.5), #changes size of the title
        axis.title = element_text(color = "#F5E8DF", #changes color of axis titles
                                  size = 13), #changes size of the axis titles
        panel.grid.minor = element_line(color="#F5E8DF", #changes color of minor gridlines
                                        size=0.25, #changes size of minor gridlines
                                        linetype = "dashed"), #changes minor gridlines to dashed 
        panel.grid.major = element_line(color="#F5E8DF", #changes color of major gridlines
                                        size=0.25), #changes size of major gridlines 
        panel.background = element_rect(fill = "#5B7B8D", #changes color of panel background
                                        colour = "#5B7B8D", #changes color of panel border 
                                        size = 0.5, #changes size of panel border
                                        linetype = "solid"), #changes linetype of panel border 
        plot.background = element_rect(fill = "#312C29")) + #changes color of plot background
  labs(x = "Date", #gives labels 
       y = "Average number of concurrent players",
       title = "Number of concurrent Team Fortress 2 players over time") +
  scale_y_continuous(labels = comma) + #makes it so numbers in y-axis have commas
  scale_x_date(limits = as.Date(c("2012-07-01","2021-02-01")), #changes the limits of the graph on the x-axis
               breaks = "1 year", #makes it so the major x-axis breaks are labeled for every single year for years with January data
               date_labels = "%Y") + #makes it so the date labels have the century year only 
  geom_image(image = sandvichimage$image[1], #replaces point markers with sandvich image
             size = 0.025) + #changes size of image point markers
  ggsave(here("Tidy_Tuesday3","Output","TidyTuesday3Plot1.png"), 
         width = 10, height = 5) #saves plot



#Logo Plot
options(scipen=5) #prevents axis from being in scientific notation
loadfonts(device = "win", quiet = TRUE) #makes it so I can use custom fonts 
logoimage <- data.frame(x = rnorm(10), #creates image to replace point markers
                        y = rnorm(10),
                        image = sample(c("https://art.pixilart.com/5cea57fee1a9002.png"),
                                       size=10, replace = TRUE))

ggplot(data = tf2,
       mapping = aes(x = Date_true,
                     y = avg,
                     group = 1)) + #allows line graph to be made
  geom_line(color ="#36322E", #changes color of line
            size = 2) + #changes size of line
  geom_point() +
  theme(text = element_text(family = "TF2 Build"), #changes font
        axis.text.x = element_text(face="bold", #bolds axis text
                                   color="#F5E8DF", #changes color of axis text
                                   size=14, #changes size of axis text
                                   family = "TF2"), #changes font of axis text
        axis.text.y = element_text(face="bold", #bolds axis text
                                   color="#F5E8DF", #changes color of axis text
                                   size=14, #changes size of axis text
                                   angle=45, #changes angle of axis text 
                                   family = "TF2"), #changes font of axis text 
        plot.title = element_text(color = "#F5E8DF", #changes color of title
                                  size = 13.5), #changes size of the title
        axis.title = element_text(color = "#F5E8DF", #changes color of axis titles
                                  size = 13), #changes size of the axis titles
        panel.grid.minor = element_line(color="#F5E8DF", #changes color of minor gridlines
                                        size=0.25, #changes size of minor gridlines
                                        linetype = "dashed"), #changes minor gridlines to dashed 
        panel.grid.major = element_line(color="#F5E8DF", #changes color of major gridlines
                                        size=0.25), #changes size of major gridlines 
        panel.background = element_rect(fill = "#5B7B8D", #changes color of panel background
                                        colour = "#5B7B8D", #changes color of panel border 
                                        size = 0.5, #changes size of panel border
                                        linetype = "solid"), #changes linetype of panel border 
        plot.background = element_rect(fill = "#312C29")) + #changes color of plot background
  labs(x = "Date", #gives labels 
       y = "Average number of concurrent players",
       title = "Number of concurrent Team Fortress 2 players over time") +
  scale_y_continuous(labels = comma) + #makes it so numbers in y-axis have commas
  scale_x_date(limits = as.Date(c("2012-07-01","2021-02-01")), #changes the limits of the graph on the x-axis
               breaks = "1 year", #makes it so the major x-axis breaks are labeled for every single year for years with January data
               date_labels = "%Y") + #makes it so the date labels have the century year only 
  geom_image(image = logoimage$image[1], #replaces point markers with logo image
             size = 0.025) + #changes size of image point markers
  ggsave(here("Tidy_Tuesday3","Output","TidyTuesday3Plot2.png"), 
         width = 10, height = 5) #saves plot