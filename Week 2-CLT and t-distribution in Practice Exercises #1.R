# Set the seed for reproducibility
set.seed(1)

# Parameters
n <- 100  # Number of dice
p <- 1/6  # Probability of rolling a 6

# Perform the simulation
results <- replicate(10000, {
  x <- sample(1:6, n, replace = TRUE)  # Roll 100 dice
  mean_6 <- mean(x == 6)  # Calculate the proportion of 6s
  z <- (mean_6 - p) / sqrt(p * (1 - p) / n)  # Standardize
  return(z)  # Return the standardized value
})

# Calculate the proportion of times z is greater than 2 in absolute value
proportion <- mean(abs(results) > 2)

# Print the result
print(paste("Proportion of times |z| > 2:", proportion))
