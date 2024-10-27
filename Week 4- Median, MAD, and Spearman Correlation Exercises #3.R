# Load the dataset
data(ChickWeight)

# Reshape the dataset
chick = reshape(ChickWeight, idvar=c("Chick","Diet"), timevar="Time", direction="wide")

# Remove chicks with missing observations
chick = na.omit(chick)

# Extract weights on day 4
weights_day_4 = chick[, "weight.4"]  # Adjust the column name according to the actual names in your dataset

# Calculate the standard deviation without the outlier
sd_without_outlier = sd(weights_day_4)

# Add the outlier
weights_with_outlier = c(weights_day_4, 3000)

# Calculate the standard deviation including the outlier
sd_with_outlier = sd(weights_with_outlier)

# Calculate the ratio of the standard deviation with the outlier to that without the outlier
ratio_sd = sd_with_outlier / sd_without_outlier

# Display the results
print(paste("Standard deviation without outlier:", sd_without_outlier))
print(paste("Standard deviation with outlier:", sd_with_outlier))
print(paste("The standard deviation with the outlier divided by the standard deviation without the outlier is:", ratio_sd))
