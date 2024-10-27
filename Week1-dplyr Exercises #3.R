# Load the dplyr package
library(dplyr)

# Read the CSV file
msleep_data <- read.csv("msleep_ggplot2.csv")

# Filter for primates
primates_data <- filter(msleep_data, order == "Primates")  # Adjust 'order' if necessary

# Check the class of the filtered object
object_class <- class(primates_data)

# Print the class of the object
print(object_class)
