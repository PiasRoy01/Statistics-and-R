# Load the dataset
data(ChickWeight)

# Reshape the dataset
chick = reshape(ChickWeight, idvar=c("Chick","Diet"), timevar="Time", direction="wide")

# Remove chicks with missing observations
chick = na.omit(chick)

# Extract weights on day 4
weights_day_4 = chick[, "weight.4"]  # Adjust the column name according to the actual names in your dataset

# Calculate the median weight without the outlier
median_without_outlier = median(weights_day_4)

# Add the outlier
weights_with_outlier = c(weights_day_4, 3000)

# Calculate the new median weight including the outlier
median_with_outlier = median(weights_with_outlier)

# Calculate the ratio of the new median to the old median
ratio_median = median_with_outlier / median_without_outlier

# Display the result
print(paste("The median weight with the outlier divided by the median weight without the outlier is:", ratio_median))
