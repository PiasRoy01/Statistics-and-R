# Load the dataset
data(ChickWeight)

# Reshape the dataset
chick = reshape(ChickWeight, idvar=c("Chick","Diet"), timevar="Time", direction="wide")

# Remove chicks with missing observations
chick = na.omit(chick)

# Extract weights on day 4
weights_day_4 = chick[, "weight.4"]  # Adjust the column name according to the actual names in your dataset

# Calculate the MAD without the outlier
mad_without_outlier = mad(weights_day_4)

# Add the outlier
weights_with_outlier = c(weights_day_4, 3000)

# Calculate the MAD including the outlier
mad_with_outlier = mad(weights_with_outlier)

# Calculate the ratio of the MAD with the outlier to that without the outlier
ratio_mad = mad_with_outlier / mad_without_outlier

# Display the results
print(paste("MAD without outlier:", mad_without_outlier))
print(paste("MAD with outlier:", mad_with_outlier))
print(paste("The MAD with the outlier divided by the MAD without the outlier is:", ratio_mad))
