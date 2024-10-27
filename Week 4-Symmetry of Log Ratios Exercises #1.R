# Assuming nym.2002 is your dataset containing marathon times
# Sort the times in ascending order
time = sort(nym.2002$time)

# Calculate the fastest time
fastest_time = time[1]

# Calculate the median time
# Since the length of time can be odd or even, we use the median function
median_time = median(time)

# Calculate the ratio of fastest time to median time
ratio = fastest_time / median_time

# Print the result
cat("Fastest time divided by median time:", ratio, "\n")
