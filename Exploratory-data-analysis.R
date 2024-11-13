library(dplyr)
library(ggplot2)


## Global Temperature Trends Over Time
# Aggregate data to get global average temparatures per year
global_temp_trend <- cleaned_data %>%
  group_by(year = year(dt)) %>%
  summarize(avg_temp = mean(AverageTemperature, na.rm = TRUE))

# plot global temperature trend over time
ggplot(global_temp_trend, aes(x = year, y = avg_temp)) +
  geom_line(color = "blue") +
  geom_smooth(method = "loess", color = "red", se = FALSE) +
  labs(title = "Global Average Temperature Trend Over Time",
       x = "Year",
       y = "Average Temperature (C)") +
  theme_minimal()

ggsave("figures/global-temp-trend.png", width = 8, height = 6)


## Temperature Trends by Country (Faceted Line Plots)
# filter for a few major countries for visualization
selected_countries <- cleaned_data %>%
  filter(Country %in% c("United States", "India", "China", "Australia", "Brazil"))

# aggregate average temperature by country and year
country_temp_trend <- selected_countries %>%
  group_by(Country, year = year(dt)) %>%
  summarize(avg_temp = mean(AverageTemperature, na.rm = TRUE))

# plot the temperature trends by country(faceted plot)
ggplot(country_temp_trend, aes(x = year, y = avg_temp, color = Country)) +
  geom_line() +
  facet_wrap(~ Country, scales = "free_y") +
  labs(title = "Temperature Trends by Country",
       x = "Year",
       y = "Average Temperature (C)") +
  theme_minimal()

ggsave("figures/country-temp-trend.png", width = 8, height = 6)


## Distribution of Temperatures by Country (Boxplot)
ggplot(selected_countries, aes(x = Country, y = AverageTemperature, fill = Country)) +
  geom_boxplot() +
  labs(title = "Temperature Distribution by Country",
       x = "Country",
       y = "Average Temperature (C)") +
  theme_minimal() +
  theme(legend.position = "none")

ggsave("figures/country-temp-dist.png", width = 8, height = 6)


## Heatmap of Temperatures Over Time
heatmap_data <- cleaned_data %>%
  group_by(Country, year = year(dt)) %>%
  summarize(avg_temp = mean(AverageTemperature, na.rm = TRUE)) %>%
  filter(Country %in% c("United States", "India", "China", "Australia", "Brazil"))

# Plot the heatmap
ggplot(heatmap_data, aes(x = year, y = Country, fill = avg_temp)) +
  geom_tile() +
  scale_fill_viridis_c() + # use viridis color scale
  labs(title = "Heatmap of Average Temperature by Country and Year",
       x = "Year",
       y = "Country",
       fill = "Avg Temp (C)") +
  theme_minimal()

ggsave("figures/country-temp-heatmap.png", width = 8, height = 6)
