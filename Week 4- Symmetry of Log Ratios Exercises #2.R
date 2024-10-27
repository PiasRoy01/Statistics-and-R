# Assuming you have a data frame named 'nym.2002' with a column 'time'

# Step 1: Create a sorted vector of times
time = sort(nym.2002$time)

# Step 2: Find the slowest time
slowest_time = tail(time, 1)  # The last element is the slowest time

# Step 3: Calculate the median time
median_time = median(time)

# Step 4: Calculate the slowest time divided by the median time
slowest_divided_by_median = slowest_time / median_time

# Print the result
print(slowest_divided_by_median)
