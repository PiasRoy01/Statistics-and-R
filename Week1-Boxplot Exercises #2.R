# Load the InsectSprays dataset
data("InsectSprays")

# Create a boxplot to visualize outliers
boxplot(count ~ spray, data = InsectSprays,
        main = "Boxplot of Insect Counts by Spray",
        xlab = "Spray",
        ylab = "Insect Count",
        col = rainbow(5))

# Identify outliers using boxplot statistics
outlier_info <- boxplot(count ~ spray, data = InsectSprays, plot = FALSE)

# Initialize a vector to store groups with outliers
groups_with_outliers <- character(0)

# Check for outliers in each group
for (i in 1:length(outlier_info$out)) {
  if (length(outlier_info$out[[i]]) > 0) {
    # Append group name to the vector
    groups_with_outliers <- c(groups_with_outliers, levels(InsectSprays$spray)[i])
  }
}

# Print groups with outliers
cat("Groups with visible outliers:", paste(groups_with_outliers, collapse = ", "), "\n")

# Print individual outliers for clarity
for (i in 1:length(outlier_info$out)) {
  if (length(outlier_info$out[[i]]) > 0) {
    cat("Spray:", levels(InsectSprays$spray)[i], "has outliers:", outlier_info$out[[i]], "\n")
  }
}

# Additional: Display the summary of each group to examine counts
summary(InsectSprays)
