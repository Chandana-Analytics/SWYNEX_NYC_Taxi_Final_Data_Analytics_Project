# Tools and Methodology



## 1. How I Worked on the Project



I worked on the NYC Yellow Taxi dataset in stages. I started by checking the data quality, then cleaned the records and used SQL to explore trip patterns. After that, I created charts in Excel and built a Power BI dashboard to bring the main findings together.



## 2. Snowflake SQL — Data Cleaning and Analysis



I used Snowflake SQL to work with the January 2026 NYC Yellow Taxi Trip Records.



For data cleaning, I checked the dataset structure, reviewed data quality issues, applied the cleaning rules, and validated the cleaned records.



The original dataset contained 3,724,889 records across 20 columns. I excluded 111 records with trip distances greater than 1,000 miles and one record where the drop-off time was earlier than the pickup time. This left 3,724,777 records for analysis.



I then used SQL to explore six main areas:



* Overall trip statistics

* Trip timing and demand patterns

* Trip distance, duration, and related measures

* Payment-type distribution

* Pickup and drop-off locations

* Potential anomalies in trip records



These analyses helped me understand the data before presenting the findings visually.



## 3. Microsoft Excel — Charts



I created six chart images from the analysis results:



* Trip Distance Distribution

* Trip Duration Distribution

* Trips by Pickup Hour

* Average Trips per Day by Weekday

* Payment Type Distribution

* Top 10 Pickup Zones



I used these charts to make the main patterns easier to understand and compare.



## 4. Power BI — Interactive Dashboard



I built an interactive Power BI dashboard using the cleaned taxi data.



The dashboard includes four KPI cards: Total Trips, Median Trip Distance, Median Trip Duration, and Average Total Amount.



It also includes visuals for trip patterns, payment types, and pickup zones, along with slicers for date, weekday, pickup hour, and payment type. These filters let users explore the results from different perspectives.



## 5. GitHub — Project Organization



I organized the project into separate folders for data cleaning, SQL analysis, Excel charts, the Power BI dashboard, business insights, and supporting documentation.



The repository includes the SQL scripts, cleaning documentation, analysis results, a 10,000-row cleaned data sample, Excel chart images, and the Power BI dashboard files.



## 6. Important Limitations



The full dataset was processed and analyzed in Snowflake, but only a 10,000-row cleaned sample is included in the project repository. The Snowflake trial has expired, so the project should not be described as having a currently working live connection or refresh.



Some unusual trip records were treated as potential anomalies for further investigation rather than automatically classified as errors.



## 7. What I Learned



This project gave me practical experience in data quality checks, SQL-based cleaning and analysis, Excel chart creation, and Power BI dashboard development. It also helped me understand why data validation matters before using results for reporting or business decisions.



