Here is the Time Series Forecasting Project formatted as a comprehensive Markdown file.

-----

# R Project: Stock Price Forecasting (Time Series Analysis) 📈

This project uses modern R frameworks to download, analyze, and forecast a major financial time series, providing a strong foundation in practical data science using R.

## 1\. Project Goals

By completing this project, you will achieve the following:

  * **Learn R Fundamentals:** Master data reading, manipulation (`dplyr`), and modern visualization (`ggplot2`) in an R context.
  * **Apply Statistical Models:** Implement and compare different time series models (e.g., **ETS**, **ARIMA**).
  * **Generate a Forecast:** Predict the next **30 days** of stock prices and objectively evaluate your model's accuracy.

## 2\. Required R Packages 📦

Install these packages in RStudio using the `install.packages("package_name")` command.

| Package | Purpose |
| :--- | :--- |
| **`tidyverse`** | Core set of packages for data cleaning, manipulation (`dplyr`), and visualization (`ggplot2`). |
| **`tidyquant`** | Used to easily download clean financial data directly from the web. |
| **`fable` / `fpp3`** | The modern, cohesive framework for time series analysis and forecasting (includes models like ARIMA and ETS). |

-----

## 3\. Step-by-Step R Plan

The plan utilizes the pipe operator (`|>`) to chain data analysis steps, making the code clean and readable. We will use the stock ticker **"GOOGL"** (Google/Alphabet) as an example.

### 3.1 Data Acquisition & Tidy Data

| Task & R Commands | Key Learning Points |
| :--- | :--- |
| 1. **Download Data:** Use `tq_get()` to download historical data for a stock (e.g., `"GOOGL"`). | R's data structures are key. `tq_get()` retrieves data into a standard `tibble` (modern R data frame). |
| 2. **Convert to `tsibble`:** Convert the data to a time series object using `as_tsibble()`. | The **`tsibble`** is R's optimized time series data structure, explicitly defining the **index** (Date) and ensuring time continuity. |

**Example Code:**

```r
library(tidyverse)
library(tidyquant)
library(fpp3)

# Define parameters
ticker <- "GOOGL"
start_date <- "2020-01-01"

stock_data <- tq_get(ticker, from = start_date) |>
  select(Date, Adjusted = adjusted) |>
  as_tsibble(index = Date)

stock_data
```

### 3.2 Exploratory Data Analysis (EDA)

| Task & R Commands | Key Learning Points |
| :--- | :--- |
| 1. **Visualize:** Use `autoplot()` from `ggplot2` to visualize the time series. | Quickly observe **trend** (upward/downward), **volatility**, and any potential **structural breaks**.  |
| 2. **Decompose:** Use `model(decomposition_model)` to identify trend, seasonality, and remainder components. | Time series decomposition helps understand the underlying patterns. For daily stock prices, **seasonality** is usually negligible or non-existent. |

**Example Code:**

```r
# Visualize
stock_data |>
  autoplot(Adjusted) +
  labs(title = paste("Adjusted Closing Price for", ticker)) +
  theme_minimal()

# Decompose (using STL for robust decomposition)
stock_data |>
  model(STL(Adjusted ~ trend() + season(period = 365.25), robust = TRUE)) |>
  components() |>
  autoplot()
```

### 3.3 Data Preparation

| Task & R Commands | Key Learning Points |
| :--- | :--- |
| **Split Data:** Split your data into a **training set** (e.g., the first 90% of data) and a **test set** (the last 10%). | This is basic practice for predictive modeling. The **test set** is reserved for an unbiased evaluation of how well your model generalizes to unseen data. |

**Example Code:**

```r
# Split the data, using the last 180 trading days (~7 months) as the test set
n_test <- 180
training_set <- stock_data |> slice(1:(n() - n_test))
testing_set <- stock_data |> slice((n() - n_test + 1):n())

# Check the last date of the training set
tail(training_set)
```

### 3.4 Model Fitting

| Task & R Commands | Key Learning Points |
| :--- | :--- |
| **Fit Models:** Fit multiple models to the **training data** using the `model()` function. | The `fable` framework simplifies model fitting with functions like **`ARIMA()`** (automatic ARIMA selection) and **`ETS()`** (automatic ETS selection). The `NAIVE()` model serves as a simple benchmark. |

**Example Code:**

```r
fit_models <- training_set |>
  model(
    NAIVE = NAIVE(Adjusted),
    ETS = ETS(Adjusted), 
    ARIMA = ARIMA(Adjusted)
  )

fit_models
```

### 3.5 Forecasting & Evaluation

| Task & R Commands | Key Learning Points |
| :--- | :--- |
| 1. **Forecast:** Use `forecast()` on your fitted models over the test set horizon. | This generates the predicted values and their associated confidence intervals. |
| 2. **Evaluate:** Use `accuracy()` to compare the models. | Crucial step: objectively compare performance using metrics like **RMSE** (Root Mean Square Error) and **MAE** (Mean Absolute Error). The lowest value indicates the best model. |

**Example Code:**

```r
# Generate forecasts over the test period
model_forecasts <- fit_models |>
  forecast(new_data = testing_set)

# Compare model accuracy
model_accuracy <- model_forecasts |>
  accuracy(stock_data) |>
  select(.model, RMSE, MAE) |>
  arrange(RMSE)

# Print the comparison
model_accuracy
```

### 3.6 Final Forecast & Visualization

| Task & R Commands | Key Learning Points |
| :--- | :--- |
| 1. **Refit:** Fit the best model (identified in Step 3.5) to the **full dataset**. | We use all available data to generate the most reliable final model. |
| 2. **Generate Final Forecast:** Generate a **30-day forecast** (using `h = "30 days"`). | **`h`** specifies the forecast horizon. |
| 3. **Visualize:** Use `autoplot()` to show the historical data and overlay the forecast with its confidence intervals. | Communicate the final prediction clearly to a non-technical audience. |

**Example Code:**

```r
# NOTE: Assume ARIMA was the best model based on Step 3.5 results
best_model <- "ARIMA" 

# Fit the BEST model to the full dataset
final_model_fit <- stock_data |>
  model(
    FinalModel = !!sym(best_model)(Adjusted) # Uses the identified best model
  )

# Generate the 30-day forecast
final_forecast <- final_model_fit |>
  forecast(h = "30 days")

# Visualize the final forecast
stock_data |>
  autoplot(Adjusted) +
  autolayer(final_forecast, alpha = 0.7) +
  labs(
    title = paste("Final 30-Day Stock Price Forecast for", ticker),
    y = "Price ($)",
    subtitle = paste("Model Used:", best_model)
  ) +
  theme_minimal()
```
