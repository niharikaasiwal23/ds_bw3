# Project 7 — Sales Conversion & Marketing Funnel Analysis

## Overview

This project explores what drives customers to respond to marketing campaigns, using a rich dataset of customer demographics, purchasing behavior, and campaign responses. Our goal is to uncover patterns in customer segments, identify key factors influencing conversion, and optimize the sales funnel through data-driven insights.

---

## Dataset

- **Title:** Customer Personality Analysis
- **Source:** [Kaggle - Marketing Campaign Data](https://www.kaggle.com/datasets/imakash3011/customer-personality-analysis)
- **Size:** 2,240 records, 29 columns

---

## 🛠️ Project Tasks

### 1. Data Cleaning & Preprocessing (Python)
- Removed missing values and duplicates
- Converted date columns (e.g., `Dt_Customer`) into datetime format
- Derived new features:
  - `TotalSpending` from product-wise spending
  - `TotalCampaignAccepted` as a sum of all campaign responses
  - `HasChildren` based on number of kids/teens at home

### 2. Exploratory Data Analysis (EDA)
- Explored demographic distributions (age, income, education)
- Calculated basic stats on purchases, income, and response rates
- Examined campaign reach and customer engagement

### 3. SQL-Based Insights
- Queried most responsive customer segments
- Aggregated response and spending data by marital status and education
- Calculated average conversion and lifetime value per segment

### 4. Visualizations (Python - Matplotlib & Seaborn)

| Visualization | Purpose |
|---------------|---------|
| **Heatmap** of response rate by demographics | Understand conversion by education & marital status |
| **Bar chart** of total spending by product category | Identify top revenue-generating products |
| **Line chart** of campaign performance over time | Observe response trends across time |
| **Customer funnel dashboard** | Visualize engagement across marketing stages |
| **Scatter plot** of Income vs. Spending | Assess correlation between income and total spend |
| **Channel preference bar chart** | Compare purchases via Web, Catalog, Store |
| **Boxplot** of wine spending by education | Study behavioral variance by education |

### 5. Statistical Testing (T-Tests)
Performed **independent samples t-tests** to validate if differences between groups are statistically significant:

| Comparison | Variable | Result |
|------------|----------|--------|
| Married vs Single | Total Spending | ✔️/❌ (based on p-value) |
| Responded vs Not Responded | Total Spending | ✔️/❌ |
| With vs Without Children | Income | ✔️/❌ |

Each test included logic to **reject or fail to reject** the null hypothesis at α = 0.05.

---

## 📌 Key Insights

- Spending and campaign response rates vary significantly across demographic segments.
- Wine and meat are the top categories by total spending.
- Web and store purchases dominate over catalog-based shopping.
- Certain customer groups (e.g., high-income, no children) show higher responsiveness.
- Statistically significant differences were found between certain segments using t-tests.

---

## 👨‍💻 Tech Stack

- **Languages:** Python, SQL
- **Libraries:** Pandas, Matplotlib, Seaborn, SciPy
- **Tools:** Jupyter Notebook, Google Colab, MySQL

---

## ✨ Team Contributions

| Name | Contribution |
|------|--------------|
| Gnaneshwar | Data Cleaning, EDA |
| Yadvendra Dhakad | SQL Queries |
| Niharika Asiwal | Visualizations, Statistical Testing (Python), Github & Documentation |

---

## 📎 Files

- `MarketingCampaign_CleanedData.csv` — cleaned dataset
- `Data_Cleaning.ipynb` — Data cleaning and EDA
- `Project 7.sql` — SQL script
- `Visualizations and t-tests.ipynb` — Visualizations, t-tests
- `README.md` — project documentation

---

## 📫 Contact

For questions or collaboration, feel free to reach out to the team.

