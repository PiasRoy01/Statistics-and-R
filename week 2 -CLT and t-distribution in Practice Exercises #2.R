# Load necessary library
library(ggplot2)

# Function to perform simulation and create QQ plot
simulate_and_plot <- function(p, n) {
  # Set seed for reproducibility
  set.seed(1)
  
  # Perform the simulation
  results <- replicate(10000, {
    x <- sample(c(0, 1), n, replace = TRUE, prob = c(1 - p, p))  # Binary outcome
    mean_6 <- mean(x == 1)  # Proportion of successes
    z <- (mean_6 - p) / sqrt(p * (1 - p) / n)  # Standardized value
    return(z)  # Return the standardized value
  })
  
  # Create a QQ plot
  qqnorm(results, main = paste("QQ Plot: p =", p, "n =", n))
  qqline(results, col = "red")  # Add a reference line
}

# Set up parameters for the four scenarios
scenarios <- list(
  list(p = 0.5, n = 5),
  list(p = 0.5, n = 30),
  list(p = 0.01, n = 30),
  list(p = 0.01, n = 100)
)

# Create a 2x2 plotting area
par(mfrow = c(2, 2))

# Run simulations and create plots for each scenario
for (scenario in scenarios) {
  simulate_and_plot(scenario$p, scenario$n)
}

# Reset plotting area
par(mfrow = c(1, 1))
