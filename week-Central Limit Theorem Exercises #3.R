# Generate or define your dataset (replace this with your actual data)
data <- rnorm(100, mean = 24, sd = 2)  # Example dataset of 100 values

# Calculate the mean and standard deviation
mean_value <- mean(data)
sd_value <- sd(data)

# Calculate the lower and upper bounds for three standard deviations
lower_bound <- mean_value - 3 * sd_value
upper_bound <- mean_value + 3 * sd_value

# Use pnorm to find the cumulative probabilities
proportion_within_three_sd <- pnorm(upper_bound, mean = mean_value, sd = sd_value) - pnorm(lower_bound, mean = mean_value, sd = sd_value)

# Print the proportion
print(paste("Proportion of values within three standard deviations:", proportion_within_three_sd))
