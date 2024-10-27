# Load the RData file
load("skew.RData")

# Set up plotting area for histograms (3 rows and 3 columns)
par(mfrow = c(3, 3))

# Generate histograms for each column to visually inspect skewness
for (i in 1:9) {
  hist(dat[, i], main = paste("Histogram of Column", i), xlab = "Values", col = "lightblue")
}
