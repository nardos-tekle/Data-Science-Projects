library(tidyverse)
library(reshape2)
library(dplyr)
library(ggplot2)
housing = read.csv("/Users/nardostekle/Desktop/Machine Learning W: R/housing.csv")
head(housing)
#1 how many homes are near BAY

sum(housing$ocean_proximity == "NEAR BAY")

#2 <1H Ocean
sum(housing$ocean_proximity == "<1H OCEAN")
#3 Inland
sum(housing$ocean_proximity == "INLAND")
#4 Near Ocean 
sum(housing$ocean_proximity == "NEAR OCEAN")
#5 Island
sum(housing$ocean_proximity == "ISLAND")


#3 Total rooms vs total bedrooms

ggplot(housing, aes(x = total_rooms, y = total_bedrooms)) + geom_point()

#4 Population vs housholds
ggplot(housing, aes(x = households, y = population)) +
  geom_bar(stat = "identity")
