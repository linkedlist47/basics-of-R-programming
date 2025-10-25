***

# ✅ To-Do List: R Stock Price Forecasting Project

This checklist is based on the provided code and uses **Apple (AAPL)** as the default stock.

## 🚀 Phase 1: Setup and Data Preparation

| Status | Task | Details |
| :---: | :--- | :--- |
| $\square$ | **Install Required Packages** | Run `install.packages(c("tidyverse", "tidyquant", "fable", "fpp3"))` in RStudio console. |
| $\square$ | **Load Libraries** | Load all necessary libraries: `library(tidyverse)`, `library(tidyquant)`, `library(fpp3)`. |
| $\square$ | **Acquire Data** | Run the code in **Section 1 (Setup and Data Acquisition)** to download stock data (`AAPL`) and create the `stock_data` object. |
| $\square$ | **Visualize Data (EDA)** | Run the first `autoplot()` code in **Section 2 (Exploratory Data Analysis)** to generate the initial time series plot. |
| $\square$ | **Decompose Series** | Run the decomposition code (using `STL`) in **Section 2** to break the series into trend, seasonality, and remainder. |

---

## 💻 Phase 2: Modeling and Evaluation

| Status | Task | Details |
| :---: | :--- | :--- |
| $\square$ | **Split Data** | Run the code to create the `training_set` and `testing_set` (using the last 180 days for testing). |
| $\square$ | **Fit Models** | Run the `model()` code to fit the three candidate models: **NAIVE**, **ETS**, and **ARIMA**. The result is stored in `fit_models`. |
| $\square$ | **Generate Test Forecasts** | Run the `forecast()` code on `fit_models` to predict values for the test period. The result is stored in `model_forecasts`. |
| $\square$ | **Compare Accuracy** | Run the `accuracy()` code to calculate the **RMSE** and **MAE** for each model. Identify and save the name of the **best model** (lowest RMSE) in a variable like `best_model`. |

---

## ✨ Phase 3: Final Forecast and Documentation

| Status | Task | Details |
| :---: | :--- | :--- |
| $\square$ | **Refit Final Model** | Use the **best model name** identified in Phase 2 to refit it to the **full** `stock_data` dataset. |
| $\square$ | **Generate Final Forecast** | Run the `forecast(h = "30 days")` code to predict the next 30 days of stock prices. |
| $\square$ | **Visualize Final Result** | Run the final `autoplot()` code to generate the plot showing historical data and the 30-day forecast with confidence intervals. |
| $\square$ | **Prepare Final Output** | Save the final forecast plot and the `model_accuracy` table. If required by your course, save the entire R script as an **R Markdown** file (`.Rmd`) or a plain R script (`.R`). |

By the way, to unlock the full functionality of all Apps, enable [Gemini Apps Activity](https://myactivity.google.com/product/gemini).
