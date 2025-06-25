# Load the AirPassengers dataset
data("AirPassengers")

# Log transformation to stabilize variance
log_airpassengers <- log(AirPassengers)

# Plot the ACF of the log-transformed series
acf(log_airpassengers, main = "ACF of Log-Transformed AirPassengers")

# Regular differencing
diff_log_airpassengers <- diff(log_airpassengers, lag=1, diff=1)

# Set up the plotting area with mfrow
par(mfrow = c(3, 1))  # 3 rows, 1 column

# Plot the ACF of the log-transformed series
plot(log_airpassengers, main = "Log-Transformed AirPassengers Time Series")

#plot of the differenced data
plot(diff_log_airpassengers, main = "Differenced AirPassengers Time Series", ylab = "Differenced AirPassengers")

# Plot the ACF of the regular differenced series
acf(diff_log_airpassengers, main = "ACF of Regularly Differenced Log-Transformed AirPassengers")
#pacf(diff_log_airpassengers, main = "PACF of Regularly Differenced Log-Transformed AirPassengers")


# Set up the plotting area with mfrow
par(mfrow = c(2, 1))  # 3 rows, 1 column
#Apply seasonal Differencing

# Seasonal differencing after regular differencing
seasonal_diff_log_airpassengers <- diff(diff_log_airpassengers, lag = 12, diff=1)

#plot of the differenced data
plot(seasonal_diff_log_airpassengers, main = "First Seasonal Difference log(AirPassengers) ", ylab = "Seasonal Differenced AirPassengers")

# Plot the ACF of the seasonally differenced series
acf(seasonal_diff_log_airpassengers, main = "Sample Autocorrelation of the First Seasonal Difference")

#First take regular diffferencing, then seasonal differencing
# Regular differencing followed by seasonal differencing
# Set up the plotting area with mfrow
par(mfrow = c(2, 1))  # 3 rows, 1 column 

combined_diff_log_airpassengers <- diff(log_airpassengers, differences = 1)
combined_diff_log_airpassengers <- diff(combined_diff_log_airpassengers, lag = 12)

#plot of the differenced data
plot(combined_diff_log_airpassengers, main = "First Regular Differencing/Seasonal Differencing log(AirPassengers) ", ylab = "First Regular/Seasonal Differencing")

# Plot the ACF of the combined differenced series
acf(combined_diff_log_airpassengers, main = "SAC of First Regular, then, Seasonal Differencing")# Load necessary package
#library(forecast)

# Plot the PACF of the combined differenced series
#pacf(diff_log_airpassengers, main = "PACF of Log-Transformed AirPassengers After Regular and Seasonal Differencing")
#Question 2c
# Plot ACF
#par(mfrow = c(2, 1))  # 3 rows, 1 column 
#acf(combined_diff_log_airpassengers, main = "ACF of Differenced Log-Transformed AirPassengers")

# Plot PACF
#pacf(combined_diff_log_airpassengers, main = "PACF of Differenced Log-Transformed AirPassengers")

