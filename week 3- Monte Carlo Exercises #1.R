# Set the seed for reproducibility
set.seed(1)

# Generate a random sample of size 5 from a standard normal distribution
sample <- rnorm(5)

# Compute the sample mean and standard deviation
x_bar <- mean(sample)
s <- sd(sample)

# Compute the t-statistic
t_statistic <- sqrt(5) * (x_bar / s)

# Print the sample and the t-statistic
print(sample)
print(t_statistic)
