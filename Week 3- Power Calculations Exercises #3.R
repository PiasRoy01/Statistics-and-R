# Load necessary libraries
library(dplyr)

# Set the seed for reproducibility
set.seed(1)

# Load the dataset
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download(url, destfile=filename)
babies <- read.table("babies.txt", header=TRUE)

# Split the dataset into smoking and non-smoking groups
bwt.nonsmoke <- filter(babies, smoke == 0) %>% select(bwt) %>% unlist()
bwt.smoke <- filter(babies, smoke == 1) %>% select(bwt) %>% unlist()

# Sample sizes to evaluate
sample_sizes <- c(30, 60, 90, 120)

# Function to calculate power for a given sample size
calculate_power <- function(n) {
  num_simulations <- 10000
  reject_nulls <- replicate(num_simulations, {
    dat.ns <- sample(bwt.nonsmoke, n)
    dat.s <- sample(bwt.smoke, n)
    t_test_result <- t.test(dat.ns, dat.s)
    t_test_result$p.value < 0.05
  })
  mean(reject_nulls) # Proportion of rejections
}

# Calculate power for each sample size
power_results <- sapply(sample_sizes, calculate_power)

# Create a data frame to display results
power_df <- data.frame(Sample_Size = sample_sizes, Power = power_results)

# Output the results
print(power_df)

# Check which sample size gives approximately 80% power
approx_80_percent <- power_df[abs(power_df$Power - 0.80) < 0.01, ]
print("Sample size with power approximately 80%:")
print(approx_80_percent)
