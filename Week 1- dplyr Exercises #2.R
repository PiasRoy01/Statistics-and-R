# Load the dplyr package
library(dplyr)

# Read the CSV file
msleep_data <- read.csv("msleep_ggplot2.csv")

# Filter for primates
primates_data <- filter(msleep_data, order == "Primates")  # Ensure 'order' is the correct column name

# Count the number of primates
number_of_primates <- nrow(primates_data)

# Print the number of primates
print(number_of_primates)
