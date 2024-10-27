# Set the parameters for the normal distribution
mu <- 23.9     # Mean
sigma <- 0.43  # Standard deviation

# Calculate the cumulative probability for 25
prob_25 <- pnorm(25, mu, sigma)

# Calculate the cumulative probability for 23
prob_23 <- pnorm(23, mu, sigma)

# Calculate the proportion of observations between 23 and 25
proportion_between_23_and_25 <- prob_25 - prob_23

# Print the result
proportion_between_23_and_25
