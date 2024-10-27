# Load the dplyr package
library(dplyr)

# Read the CSV file
msleep_data <- read.csv("msleep_ggplot2.csv")

# Calculate the average amount of sleep for primates using summarize()
average_sleep <- msleep_data %>%
  filter(order == "Primates") %>%
  summarize(average_sleep = mean(sleep_total, na.rm = TRUE))  # na.rm = TRUE to handle any NA values

# Print the average amount of sleep
print(average_sleep)
