# Read the CSV file
female_mice_weights <- read.csv("femaleMiceWeights.csv")

# Get the names of the columns
column_names <- colnames(female_mice_weights)

# Print the column names
print(column_names)

# Assuming the weight column is uniquely identifiable, you can check which one contains weights
# This may involve printing the specific column or filtering based on a keyword
weight_column_name <- column_names[grep("weight", column_names, ignore.case = TRUE)]

# Print the exact name of the column containing weights
print(weight_column_name)
