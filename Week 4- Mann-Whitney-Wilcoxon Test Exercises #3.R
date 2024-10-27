# Load necessary library
library(rafalib)

# Load the dataset
data(ChickWeight)

# Reshape the dataset
chick = reshape(ChickWeight, idvar=c("Chick","Diet"), timevar="Time", direction="wide")

# Remove chicks with missing observations
chick = na.omit(chick)

# Extract weights of chicks on day 4 for Diet 1 and Diet 4
x = chick[chick$Diet == 1, "weight.4"]  # Weights from Diet 1 on Day 4
y = chick[chick$Diet == 4, "weight.4"]  # Weights from Diet 4 on Day 4

# Set up for plotting
mypar(1, 3)

# Create boxplots
boxplot(x, y, main="Diet 1 vs Diet 4")
boxplot(x, y + 10, main="Diet 4 + 10g")
boxplot(x, y + 100, main="Diet 4 + 100g")

# Calculate t-test statistics
t_stat_10 = t.test(x, y + 10)$statistic  # t-test statistic for y + 10
t_stat_100 = t.test(x, y + 100)$statistic  # t-test statistic for y + 100

# Calculate the difference
difference = t_stat_10 - t_stat_100

# Print the t-test statistics and the difference
print(paste("t-test statistic for y + 10:", t_stat_10))
print(paste("t-test statistic for y + 100:", t_stat_100))
print(paste("Difference in t-test statistics (y + 10 - y + 100):", difference))
