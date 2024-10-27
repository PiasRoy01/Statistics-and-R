# Load necessary libraries
library(dplyr)

# Set the seed for reproducibility
set.seed(1)

# Load the babies dataset
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download(url, destfile=filename)
babies <- read.table("babies.txt", header=TRUE)

# Split into birth weight datasets
bwt.nonsmoke <- filter(babies, smoke == 0) %>% select(bwt) %>% unlist()
bwt.smoke <- filter(babies, smoke == 1) %>% select(bwt) %>% unlist()

# Obtain a sample from non-smoking mothers (size N=25)
dat.ns <- sample(bwt.nonsmoke, size = 25)

# Obtain a sample from smoking mothers (size N=25)
dat.s <- sample(bwt.smoke, size = 25)

# Compute the t-statistic
tval <- (mean(dat.ns) - mean(dat.s)) / sqrt(var(dat.ns) / length(dat.ns) + var(dat.s) / length(dat.s))

# Get the absolute value of the t-statistic
abs_tval <- abs(tval)

# Print the absolute value of the t-statistic
print(abs_tval)
