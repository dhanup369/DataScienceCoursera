#Import the leaflet library for plotting maps in R
library(leaflet)
library(dplyr)

#If the above line of code returns an error as in: 
#  "Error in library(leaflet):there is no package called 'leaflet'"
#Then run the follow command to install the package:
install.packages("leaflet")

#New York GPS
nyc_latitude = 40.7128
nyc_longitude = -74.0060

#Create a map
m <- leaflet() %>% setView(lng = nyc_longitude, 
                           lat = nyc_latitude, 
                           zoom = 12)
m %>% addTiles()
