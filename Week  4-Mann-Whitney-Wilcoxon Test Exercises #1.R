# Load the dataset
data(ChickWeight)

# Reshape the dataset
chick = reshape(ChickWeight, idvar=c("Chick","Diet"), timevar="Time", direction="wide")

# Remove chicks with missing observations
chick = na.omit(chick)

# Extract weights of chicks on day 4 for Diet 1 and Diet 4
x = chick[chick$Diet == 1, "weight.4"]  # Weights from Diet 1 on Day 4
y = chick[chick$Diet == 4, "weight.4"]  # Weights from Diet 4 on Day 4

# Perform a t-test
t_test_result = t.test(x, y)
print(paste("T-test p-value without outlier:", t_test_result$p.value))

# Perform a Wilcoxon test
wilcox_test_result = wilcox.test(x, y)
print(paste("Wilcoxon test p-value:", wilcox_test_result$p.value))

# Add a single chick of weight 200 grams to x
x_with_outlier = c(x, 200)

# Perform a t-test again after adding the outlier
t_test_with_outlier_result = t.test(x_with_outlier, y)
print(paste("T-test p-value with outlier:", t_test_with_outlier_result$p.value))
