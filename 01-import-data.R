library(dplyr)
library(lubridate)
library(readr)


# load data
data <- read_csv("data/raw-GlobalLandTemperaturesByCountry.csv")
head(data)

# Convert date column to date format
data$dt <- as.Date(data$dt)

# clean NAs
cleaned_data <- data %>%
  filter(!is.na(AverageTemperature))

sum(is.na(cleaned_data))

# Summary of the cleaned dataset
summary(cleaned_data)

write_csv(cleaned_data, "data/cleaned-GlobalLandTemperatures.csv")
