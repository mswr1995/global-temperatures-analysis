# Global Land Temperature Analysis

This project focuses on analyzing global land temperature data to uncover historical trends and insights. The analysis involves data preprocessing, exploratory data analysis (EDA), hypothesis testing, and forecasting. The project is structured with R scripts for data processing and analysis, and Python notebooks for time-series forecasting.

---

## **Table of Contents**
- [Project Overview](#project-overview)
- [Dataset](#dataset)
- [R Scripts](#r-scripts)
- [Results](#results)

---

## **Project Overview**
This analysis aims to:
1. Explore global temperature trends and variations over time.
2. Compare temperature patterns before and after 1950 to investigate potential impacts of climate change.
3. Forecast future temperature trends using advanced time-series models.

### **Key Findings**
- **Global Temperature Increase**: Average global temperatures have risen significantly, particularly post-1950.
- **Statistical Significance**: Hypothesis testing confirmed a substantial difference in average temperatures before and after 1950, with a **p-value < 2.2e-16**.
- **Visual Insights**: Clear patterns of temperature increase were observed through EDA, with figures saved in the `figures/` directory.

---

## **Dataset**
The dataset used in this project contains:
- **Columns**:
  - `dt`: Date of the temperature record.
  - `AverageTemperature`: The average land temperature (in °C).
  - `AverageTemperatureUncertainty`: The uncertainty in the temperature measurement (in °C).
  - `Country`: The country of the recorded temperature.
- **Source**: [Kaggle](https://www.kaggle.com/datasets/vijayvvenkitesh/global-land-temperatures-by-country) or similar global temperature datasets.

---

## **R Scripts**
1. 01-import-data.r
- Purpose: Load and preprocess the dataset.
- Key Steps:
Clean missing or invalid values.
Filter for valid date ranges.
Save the cleaned dataset for further analysis.
2. 02-exploratory-data-analysis.r
- Purpose: Perform exploratory data analysis (EDA) to identify temperature trends and patterns.
- Outputs:
Time-series plots of global average temperatures.
Density plots comparing temperature distributions before and after 1950.
Heatmaps of country-level temperature changes.
- Figures Saved: All plots are saved in the figures/ directory.
3. 03-hypothesis-testing.r
- Purpose: Conduct statistical hypothesis testing to evaluate temperature differences.
- Method:
Two-sample t-tests to compare average temperatures pre-1950 and post-1950.
Output statistical summaries and confidence intervals.

---

## **Results**
### Key Insights from EDA
1. Global Trends:
- Significant temperature increase post-1950.
- Strong upward trend in global average temperatures, evident in time-series plots.
2. Country-Level Analysis:
- Heatmaps highlight warming patterns in Europe, North America, and Asia.
- Density plots for countries like the USA and Russia reveal shifts in temperature distributions, with more frequent occurrences of higher temperatures.
### Hypothesis Testing
1. Test Result:
- Null Hypothesis: There is no significant difference in average temperatures pre- and post-1950.
- Alternative Hypothesis: There is a significant difference in average temperatures.
2. Outcome: The null hypothesis is rejected, confirming that post-1950 temperatures are significantly higher.