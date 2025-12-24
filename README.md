# SQL-Data-Analytics-Project


This project consists of a comprehensive suite of SQL scripts designed to build, explore, analyze, and report on a retail data warehouse. The project creates a "Gold" schema layer and performs advanced analytics ranging from basic data exploration to complex customer segmentation and performance reporting.

## 📂 Project Structure

The project is organized sequentially. Scripts should generally be executed in order, starting with the database initialization.

### 1. Database Setup & Initialization
* **`scripts/00_init_database.sql`**: Initializes the `DataWarehouseAnalytics` database. It creates the dimensional model tables (`gold_dim_customers`, `gold_dim_products`, `gold_fact_sales`) and loads data from CSV files.

### 2. Data Exploration
These scripts are used to understand the dataset's shape, boundaries, and quality.
* **`scripts/01_database_exploration.sql`**: Inspects the technical schema, listing tables, columns, and data types using `INFORMATION_SCHEMA`.
* **`scripts/02_dimensions_exploration.sql`**: Explores distinct values in dimension tables (e.g., unique countries, product categories).
* **`scripts/03_date_range_exploration.sql`**: Determines temporal boundaries, finding the first/last order dates and the age range of customers.
* **`scripts/04_measures_exploration.sql`**: Calculates high-level KPIs such as Total Sales, Total Quantity, and Total Orders to establish baseline metrics.

### 3. Analytical Deep Dives
These scripts answer specific business questions using intermediate to advanced SQL techniques.
* **`scripts/05_magnitude_analysis.sql`**: detailed aggregation by dimensions (e.g., revenue by category, customers by country).
* **`scripts/06_ranking_analysis.sql`**: Identifies top and bottom performers (products/customers) using ranking window functions (`RANK`, `DENSE_RANK`).
* **`scripts/07_change_over_time_analysis.sql`**: Analyzes monthly sales trends to track growth over time.
* **`scripts/08_cumulative_analysis.sql`**: Calculates running totals and moving averages to visualize cumulative growth.
* **`scripts/09_performance_analysis.sql`**: Performs Year-over-Year (YoY) analysis using `LAG()` to compare current performance against historical data.
* **`scripts/10_data_segmentation.sql`**: Groups data into meaningful buckets, such as price ranges for products or "VIP/New" segments for customers.
* **`scripts/11_part_to_whole_analysis.sql`**: Calculates the percentage contribution of specific categories to the overall sales total.

### 4. Reporting Views
These scripts create permanent Views to simplify querying for end-user reporting tools.
* **`scripts/12_report_customers.sql`**: Creates the `gold_report_customers` view, consolidating customer demographics, segmentation (VIP/Regular), and lifetime value metrics.
* **`scripts/13_report_products.sql`**: Creates the `gold_report_products` view, consolidating product performance, recency, and performance categorization (High/Mid/Low Performer).

---

## 🗄️ Database Schema

The project utilizes a Star Schema architecture:

1.  **`gold_fact_sales`**: The central fact table containing transactional data (orders, sales amount, quantity, dates).
2.  **`gold_dim_customers`**: Dimension table containing customer details (demographics, location, birthdates).
3.  **`gold_dim_products`**: Dimension table containing product catalog details (categories, costs, product lines).

---

## 🛠️ Technical Highlights

This project demonstrates proficiency in the following SQL techniques:

* **Window Functions**: Used extensively for ranking (`RANK`), cumulative sums (`SUM() OVER`), and trend analysis (`LAG`, `LEAD`).
* **CTEs (Common Table Expressions)**: Used to structure complex logic and break down queries into readable steps.
* **Date Manipulation**: Usage of `TIMESTAMPDIFF` and `DATE_FORMAT` (MySQL syntax) for cohort and age analysis.
* **Data Segmentation**: Complex `CASE` statements to categorize continuous data into discrete business logic groups.
* **Views**: Encapsulating complex logic into reusable database objects.

---

## 🚀 How to Run

1.  **Prerequisites**: Ensure you have a MySQL server instance running.
2.  **Data Loading**: Open `scripts/00_init_database.sql`.
    * *Note*: You must update the file paths in the `LOAD DATA LOCAL INFILE` commands to point to the actual location of your CSV files on your machine.
3.  **Execution**: Run the scripts in the numerical order provided (00 through 13).
