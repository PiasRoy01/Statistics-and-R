# Read the CSV file
female_mice_weights <- read.csv("femaleMiceWeights.csv")

# View the data (optional, to understand the structure)
View(female_mice_weights)  # This will open a viewer in RStudio

# Check the first few rows of the dataset
head(female_mice_weights)

# Assuming there's a column called 'Diet' indicating diet type
# Filter for high-fat (hf) diet mice
hf_mice_weights <- female_mice_weights[female_mice_weights$Diet == "hf", "Bodyweight"]  # Replace 'Diet' and 'Bodyweight' with actual column names if different

# Calculate the average weight of mice on the high-fat diet
average_hf_weight <- mean(hf_mice_weights)

# Print the average weight
print(average_hf_weight)
