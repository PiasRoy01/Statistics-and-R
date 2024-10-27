# Load necessary libraries
library(dplyr)

# Download and read the dataset
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download(url, destfile=filename)
babies <- read.table("babies.txt", header=TRUE)

# Extract birth weight data for smokers and non-smokers
bwt.nonsmoke <- filter(babies, smoke == 0) %>% select(bwt) %>% unlist()
bwt.smoke <- filter(babies, smoke == 1) %>% select(bwt) %>% unlist()

# Set sample size and seed
N <- 10
set.seed(1)

# Generate samples for smokers and non-smokers
nonsmokers <- sample(bwt.nonsmoke, N)
smokers <- sample(bwt.smoke, N)

# Calculate the observed difference in medians
obs <- median(smokers) - median(nonsmokers)

# Initialize a vector to store permuted differences
num_permutations <- 1000
permuted_diffs <- numeric(num_permutations)

# Combine the data
dat <- c(smokers, nonsmokers)

# Perform permutations
for (i in 1:num_permutations) {
  shuffle <- sample(dat)  # Shuffle the combined data
  smokersstar <- shuffle[1:N]  # New sample for smokers
  nonsmokersstar <- shuffle[(N + 1):(2 * N)]  # New sample for non-smokers
  permuted_diffs[i] <- median(smokersstar) - median(nonsmokersstar)  # Calculate difference
}

# Calculate the permutation-based p-value
p_value <- mean(abs(permuted_diffs) >= abs(obs))
print(p_value)
