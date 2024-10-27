# Define the two vectors
group1 <- c(1, 2, 3)
group2 <- c(4, 5, 6)

# Perform the Wilcoxon test
wilcox_test_result <- wilcox.test(group1, group2)

# Extract the p-value
p_value <- wilcox_test_result$p.value

# Print the p-value
print(paste("The p-value for the Wilcoxon test comparing c(1,2,3) to c(4,5,6) is:", p_value))
