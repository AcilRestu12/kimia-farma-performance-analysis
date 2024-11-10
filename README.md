# Kimia Farma Performance Analysis
Analysis of Kimia Farma's business performance 2020-2023.



## Table of Contents
- [Background](#background)
- [Objective](#objective)
- [Problem Statement](#problem-statement)
- [Available Data](#available-data)
- [Steps Overview](#steps-overview)
  - [1. Importing Datasets to BigQuery](#1-importing-datasets-to-bigquery)
  - [2. Creating Analytical Tables](#2-creating-analytical-tables)
  - [3. Building the Performance Analytics Dashboard](#3-building-the-performance-analytics-dashboard)
- [Conclusion](#conclusion)


## Background
Kimia Farma, as one of the largest pharmaceutical companies in Indonesia, needed a tool to comprehensive monitor the business performance of its branches across the province. With data spread from 2020 to 2023, a solution was needed to assist management in data-driven decision-making.


## Objective
The objective of this project is to build an interactive dashboard that visualizes business performance based on total transactions, revenue, and profit per branch. This dashboard aims to make it easier to analyze branch performance, identify low-performing branches, and view annual trends.


## Problem Statement
Kimia Farma faces challenges in: 
- Monitoring branch performance in real-time. 
- Identifying low performing branches despite their high ratings. 
- Making strategic decisions based on in-depth data. 
- Viewing year-on-year performance trends efficiently.


## Available Data
The data used in this project includes:
- [**Transaction Data:**](data/kf_final_transaction.csv) This dataset contains detailed information on transactions.
- [**Product Data:**](data/kf_product.csv) This dataset contains detailed product information.
- [**Inventory Data:**](data/kf_inventory.csv) This dataset provides information about inventory levels for products at various branches.
- [**Branch Data:**](data/kf_kantor_cabang.csv) This dataset contains branch-specific information.


## Steps Overview
### 1. Importing Datasets to BigQuery
The first step in this project was to import the datasets into BigQuery. The datasets were uploaded from local sources and stored in BigQuery tables, which include:
- `kf_final_transaction`
- `kf_product`
- `kf_iventory`
- `kf_kantor_cabang`

To load data into BigQuery, follow these steps:

1. Navigate to the BigQuery console.
2. Create a dataset for the project, in this case kimia_farma.
3. Click on "Create Table" and upload the dataset in CSV format.
4. Set up schema fields as necessary.
5. Repeat for all datasets.


### 2. Creating Analytical Tables
Once the data was imported into BigQuery, several analytical tables were created to prepare data for the performance dashboard. Create query used to create the table combining transaction, product, and branch data. The SQL query can be seen [here](code/create_tb_analisa.sql).

The table [tb_analisa](/data/tb_analisa.csv) combines information from all three datasets to calculate nett_sales and nett_profit for each transaction.


### 3. Building the Performance Analytics Dashboard
The Kimia Farma Business Performance Dashboard provides comprehensive insights into the business's performance across different branches and time periods. Here is a [link](https://lookerstudio.google.com/reporting/904ac2cf-8c10-497b-9b53-f9e3e77b8ada) to the live dashboard. The dashboard consists of two main pages:

1. Kimia Farma Business Performance (2020-2023)
This page gives an overall summary of the business performance from 2020 to 2023. Key features include:

    - Filter Options:
        - Province: Allows users to filter by specific provinces in Indonesia.
        - City: Further refines the data to a particular city.
        - Date Range: Users can set a specific time range to view the performance metrics.

    - Key Performance Metrics:
        - Total Transaction: Displays the total number of transactions conducted over the selected time period. In this case, the total transaction count is 672,458.
        - Total Revenue: The total revenue generated, displayed in Indonesian Rupiah (IDR), amounts to IDR 346,961,801,575.
        - Total Profit: The total profit earned, showing IDR 98,539,911,168

    - Transaction Trend by Year:
        
        A bar chart visualizing total transactions for each year from 2020 to 2023. Transaction numbers are quite consistent, with around 167,000 to 168,000 transactions per year.
    
    - Monthly Revenue Trend Comparison:
        
        A line chart compares the monthly revenue for each year (2020-2023). It highlights fluctuations in revenue across different months, with noticeable spikes in May and November each year. The revenue trend is relatively stable, ranging from IDR 6.6 billion to 7.4 billion per month.

2. Performance by Branch
This second page provides detailed insights into the performance of different Kimia Farma branches across Indonesia. It includes the following sections:

    - Filter Options:
        - Province: Users can focus on specific provinces.
        - Date Range: Users can filter data for a certain time frame.

    - Top 10 Total Provincial Branch Transactions:
        A bar chart showing the provinces with the highest number of total transactions. Jawa Barat leads by a significant margin, followed by Sumatra Utara and Jawa Tengah.

    - Top 5 Branches with Highest Rating but Lowest Transaction Rating:
        
        A dual-rating bar chart comparing branch ratings with transaction ratings. Branches like Balikpapan, Sibolga, and Ambon have high customer satisfaction ratings but lower transaction rates, indicating that despite good service, these branches need to attract more transactions.

    - Top 10 Nett Sales Provincial Branches:
        
        This chart highlights provinces with the highest net sales, where Jawa Barat stands out with a massive lead, followed by Sumatra Utara and Jawa Tengah. This gives insight into which provinces contribute the most to the company's revenue.

    - Indonesia's Geo Map for Total Profit of Each Province:
        
        A geographical map of Indonesia visualizing the total profit generated by each province. The map provides an easy-to-understand visualization of how profit is distributed across the country, with larger circles representing higher profit regions.


## Conclusion
The project integrates transaction, product, inventory and branch data to provide a holistic view of Kimia Farma's business performance. By visualizing key metrics such as net sales, transaction volume, and branch ranking, the Performance Analytics Dashboard enables decision making and allocation of resources correctly. Future development can focus on expanding the dashboard to include real-time monitoring and advanced predictive analysis.

