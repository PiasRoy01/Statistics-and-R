# Read the CSV file
female_mice_weights <- read.csv("femaleMiceWeights.csv")

# Extract the weight column using the $ operator
weights <- female_mice_weights$Bodyweight  # Replace 'Bodyweight' with the actual column name if different

# Get the weight of the mouse in the 11th row
weight_11th_row <- weights[11]

# Print the weight
print(weight_11th_row)
