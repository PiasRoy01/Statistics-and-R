# Load the dplyr package
library(dplyr)

# Read the CSV file
msleep_data <- read.csv("msleep_ggplot2.csv")

# Extract total sleep for primates and determine its class
primates_sleep <- msleep_data %>%
  filter(order == "Primates") %>%
  select(sleep_total)

# Check the class of the extracted object
object_class <- class(primates_sleep)

# Print the class of the object
print(object_class)

