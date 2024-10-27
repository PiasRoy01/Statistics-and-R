# Load necessary libraries
library(dplyr)

# Set the seed for reproducibility
set.seed(1)

# Load the dataset
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download(url, destfile=filename)
babies <- read.table("babies.txt", header=TRUE)

# Split the data into birth weight datasets
bwt.nonsmoke <- filter(babies, smoke == 0) %>% select(bwt) %>% unlist
bwt.smoke <- filter(babies, smoke == 1) %>% select(bwt) %>% unlist

# Take a random sample of N=5 from each group
dat.ns <- sample(bwt.nonsmoke, 5)
dat.s <- sample(bwt.smoke, 5)

# Perform t-test and calculate p-value
t_test_result <- t.test(dat.ns, dat.s)
p_value <- t_test_result$p.value

# Display the p-value
print(p_value)
