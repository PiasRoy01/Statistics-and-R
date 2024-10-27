# Load the dataset
data(ChickWeight)

# Reshape the dataset
chick = reshape(ChickWeight, idvar=c("Chick","Diet"), timevar="Time", direction="wide")

# Remove chicks with missing observations
chick = na.omit(chick)

# Extract weights of chicks on day 4 for Diet 1 and Diet 4
x = chick[chick$Diet == 1, "weight.4"]  # Weights from Diet 1 on Day 4
y = chick[chick$Diet == 4, "weight.4"]  # Weights from Diet 4 on Day 4

# Perform a Wilcoxon test without the outlier
wilcox_test_result = wilcox.test(x, y)
print(paste("Wilcoxon test p-value without outlier:", wilcox_test_result$p.value))

# Add a single chick of weight 200 grams to x (the diet 1 chicks)
x_with_outlier = c(x, 200)

# Perform a Wilcoxon test again after adding the outlier
wilcox_test_with_outlier_result = wilcox.test(x_with_outlier, y)
print(paste("Wilcoxon test p-value with outlier:", wilcox_test_with_outlier_result$p.value))
