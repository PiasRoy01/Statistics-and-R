# Assuming the t-statistic has already been calculated as tval
# Compute the estimated p-value
pval <- 1 - (pnorm(abs(tval)) - pnorm(-abs(tval)))

# Print the estimated p-value
print(pval)
