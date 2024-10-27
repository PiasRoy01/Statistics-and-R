# Load necessary packages
library(dplyr)

# Load the dataset
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
destfile <- "mice_pheno.csv"
download.file(url, destfile, method = "curl")
mice_data <- read.csv(destfile)

# Filter to get body weights for male mice on the chow diet and calculate the average
x <- mice_data %>%
  filter(Sex == "M" & Diet == "chow") %>%
  pull(Bodyweight) # Extracts the body weight as a vector

# Calculate the average of x
average_weight <- mean(x, na.rm = TRUE)
average_weight
