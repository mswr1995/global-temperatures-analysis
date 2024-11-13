library(dplyr)


# Split the data to pre and post 1950s
pre_1950 <- cleaned_data %>%
  filter(year(dt) < 1950)

post_1950 <- cleaned_data %>%
  filter(year(dt) > 1950)

# Perform a two sample t-test
t_test_result <- t.test(pre_1950$AverageTemperature, post_1950$AverageTemperature, alternative = "two.sided")

print(t_test_result)
