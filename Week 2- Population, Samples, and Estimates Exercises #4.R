# Load dplyr package
library(dplyr)

# Filter for males on the high-fat diet and select the body weight column
y <- mice_pheno %>%
  filter(Sex == "M" & Diet == "hf") %>%
  pull(Bodyweight)  # Replace 'Bodyweight' with the actual column name if different

# Calculate the average of y
population_average <- mean(y, na.rm = TRUE)  # Use na.rm = TRUE to ignore any NA values
population_average
