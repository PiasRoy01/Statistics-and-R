# Read the CSV file
female_mice_weights <- read.csv("femaleMiceWeights.csv")

# Set the seed for reproducibility
set.seed(1)

# Take a random sample of size 1 from the numbers 13 to 24
random_row <- sample(13:24, size = 1)

# Retrieve the weight of the mouse in the randomly selected row
weight_random_mouse <- female_mice_weights$Bodyweight[random_row]  # Replace 'Bodyweight' with the actual column name if different

# Print the random row and the corresponding weight
cat("Random row selected:", random_row, "\n")
cat("Weight of the mouse in row", random_row, "is:", weight_random_mouse, "\n")
