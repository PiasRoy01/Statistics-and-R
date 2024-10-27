# Load the dplyr package
library(dplyr)

# Read the CSV file
msleep_data <- read.csv("msleep_ggplot2.csv")

# Extract total sleep for primates as a vector
primates_sleep_vector <- msleep_data %>%
  filter(order == "Primates") %>%
  pull(sleep_total)  # Get sleep_total as a vector

# Calculate the average amount of sleep
average_sleep <- mean(primates_sleep_vector)

# Print the average amount of sleep
print(average_sleep)
