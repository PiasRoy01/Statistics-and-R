# Load the InsectSprays dataset
data("InsectSprays")

# Calculate the median counts for each spray
median_counts <- tapply(InsectSprays$count, InsectSprays$spray, median)

# Print the median counts
print(median_counts)

# Identify the spray with the lowest median count
most_effective_spray <- names(which.min(median_counts))
most_effective_spray
