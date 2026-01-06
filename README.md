# Walmart-Sales-Data-Analysis-With-SQL


## 📌 Project Overview
This project performs an end-to-end analysis of Walmart sales data using MySQL.  
The goal is to analyze **customer behavior, product performance, and sales trends** to generate actionable business insights.

---

## 🧾 Dataset
- Walmart Sales Data (CSV)
- Contains transaction-level sales data including:
  - Customer type
  - Product categories
  - Sales, revenue, profit
  - Date & time of purchase
  - Payment methods
  - Customer ratings

---

## 🛠️ Tools & Technologies
- MySQL
- MySQL Workbench
- SQL (DDL, DML, Aggregations, Subqueries)

---

## 🧹 Data Cleaning Steps
- Removed duplicate invoice records
- Handled missing and invalid values
- Standardized categorical fields
- Validated numeric columns
- Created derived columns (day_name, month_name)

---

## 👥 Customer Analysis
- Customer distribution by type
- Revenue contribution by customer type
- Gender-wise sales analysis
- Average spending behavior

---

## 📦 Product Analysis
- Best and worst performing product lines
- Revenue and profit by product category
- Identification of low-performing products
- Product-wise customer satisfaction (ratings)

---

## 💰 Sales Analysis
- Total revenue and sales volume
- Branch and city-wise performance
- Monthly and daily sales trends
- Peak sales hours
- Payment method usage

---

## 📉 Key Insights
- Members contribute higher revenue than normal customers
- Certain product lines consistently underperform
- Sales peak during evening hours
- E-wallet is the most preferred payment method
- Branch A generates the highest revenue

---

## 📂 Project Structure

Walmart-Sales-MySQL-Project/
│
├── dataset/
│ └── Walmart Sales Data.csv
├── sql/
│ └── walmart_sales_analysis.sql
└── README.md

## 🚀 Future Enhancements
- Build Power BI dashboard using this dataset
- Automate reporting queries
- Add stored procedures and views
