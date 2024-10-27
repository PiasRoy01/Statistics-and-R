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

# Number of simulations
num_simulations <- 10000

# Function to perform the t-test and return whether we reject the null hypothesis
reject_null <- function() {
  dat.ns <- sample(bwt.nonsmoke, 5)
  dat.s <- sample(bwt.smoke, 5)
  t_test_result <- t.test(dat.ns, dat.s)
  return(t_test_result$p.value < 0.05) # Returns TRUE if we reject the null hypothesis
}

# Run the simulations using replicate()
results <- replicate(num_simulations, reject_null())

# Calculate the proportion of times we reject the null hypothesis
proportion_reject <- mean(results)

# Output the proportion
print(proportion_reject)
