# Read the CSV file
female_mice_weights <- read.csv("femaleMiceWeights.csv")

# Count the number of mice using the length() function on the weight column
number_of_mice <- length(female_mice_weights$Bodyweight)  # Replace 'Bodyweight' with the actual weight column name if different

# Print the number of mice
print(number_of_mice)
