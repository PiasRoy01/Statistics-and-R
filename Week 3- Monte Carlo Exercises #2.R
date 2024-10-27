# Set the seed for reproducibility
set.seed(1)

# Number of simulations
B <- 1000

# Initialize a vector to store t-statistics
t_statistics <- numeric(B)

# Generate B t-statistics
for (i in 1:B) {
  sample <- rnorm(5)  # Generate a sample of size 5 from a standard normal distribution
  x_bar <- mean(sample)  # Sample mean
  s <- sd(sample)  # Sample standard deviation
  t_statistics[i] <- sqrt(5) * (x_bar / s)  # Calculate t-statistic
}

# Calculate the proportion of t-statistics greater than 2
proportion_greater_than_2 <- mean(t_statistics > 2)

# Print the result
print(proportion_greater_than_2)
