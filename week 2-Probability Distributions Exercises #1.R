# Load necessary library
library(gapminder)

# Filter data for the year 1952
data_1952 <- gapminder[gapminder$year == 1952, ]

# Calculate the proportion of countries with life expectancy less than or equal to 40
proportion_less_than_40 <- mean(data_1952$lifeExp <= 40)

# Print the result
proportion_less_than_40
