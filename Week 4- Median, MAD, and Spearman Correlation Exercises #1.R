# Load the dataset
data(ChickWeight)

# Reshape the dataset
chick = reshape(ChickWeight, idvar=c("Chick","Diet"), timevar="Time", direction="wide")

# Remove chicks with missing observations
chick = na.omit(chick)

# Extract weights on day 4
weights_day_4 = chick[, "weight.4"]  # Adjust the column name according to the actual names in your dataset

# Calculate the average weight without the outlier
average_without_outlier = mean(weights_day_4)

# Add the outlier
weights_with_outlier = c(weights_day_4, 3000)

# Calculate the new average weight including the outlier
average_with_outlier = mean(weights_with_outlier)

# Calculate the ratio of the new average to the old average
ratio = average_with_outlier / average_without_outlier

# Display the result
print(paste("The average weight with the outlier divided by the average weight without the outlier is:", ratio))
