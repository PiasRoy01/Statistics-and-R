# Load the dataset
data(ChickWeight)

# Reshape the dataset
chick = reshape(ChickWeight, idvar=c("Chick","Diet"), timevar="Time", direction="wide")

# Remove chicks with missing observations
chick = na.omit(chick)

# Extract weights on day 4 and day 21
weights_day_4 = chick[, "weight.4"]  # Adjust the column name as needed
weights_day_21 = chick[, "weight.21"]  # Adjust the column name as needed

# Plot the weights of chicks on day 4 vs day 21
plot(weights_day_4, weights_day_21, 
     xlab = "Weight on Day 4 (grams)", 
     ylab = "Weight on Day 21 (grams)", 
     main = "Chick Weights on Day 4 vs Day 21",
     pch = 19, col = "blue")

# Calculate the Pearson correlation without the outlier
pearson_corr_without_outlier = cor(weights_day_4, weights_day_21)

# Add the outlier
weights_day_4_with_outlier = c(weights_day_4, 3000)
weights_day_21_with_outlier = c(weights_day_21, 3000)

# Calculate the Pearson correlation with the outlier
pearson_corr_with_outlier = cor(weights_day_4_with_outlier, weights_day_21_with_outlier)

# Calculate the ratio of the Pearson correlation with the outlier to that without the outlier
ratio_pearson_corr = pearson_corr_with_outlier / pearson_corr_without_outlier

# Display the results
print(paste("Pearson correlation without outlier:", pearson_corr_without_outlier))
print(paste("Pearson correlation with outlier:", pearson_corr_with_outlier))
print(paste("The Pearson correlation with the outlier divided by the Pearson correlation without the outlier is:", ratio_pearson_corr))
