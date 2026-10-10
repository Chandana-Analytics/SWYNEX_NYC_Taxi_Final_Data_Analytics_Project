# NYC Taxi Data Analytics Project — Overview



## 1. About the Project



For my SWYNEX Technologies internship, I worked on a data analytics project using the January 2026 NYC Yellow Taxi Trip Records published by the New York City Taxi and Limousine Commission (NYC TLC).



I started by checking and cleaning the dataset, then used SQL to explore trip patterns and data quality issues. I also created charts in Excel and built an interactive Power BI dashboard to present the main findings.



## 2. Project Objective



The objective was to prepare the taxi data for analysis, understand travel patterns, and present the results in a way that is easy to review.



I focused on trip distance and duration, pickup demand by hour and weekday, payment-type distribution, high-volume pickup and drop-off locations, and unusual trip records that may need further investigation.



## 3. Dataset and Cleaning



The project used the January 2026 NYC Yellow Taxi Trip Records.



* **Source:** New York City Taxi and Limousine Commission (NYC TLC)

* **Original records:** 3,724,889

* **Records after cleaning:** 3,724,777

* **Records excluded:** 112

* **Columns:** 20



I used Snowflake SQL to profile the data, run quality checks, clean the records, and validate the cleaned dataset. The cleaning process excluded 111 records with trip distances greater than 1,000 miles and one record where the drop-off time was earlier than the pickup time.



The repository contains a 10,000-row cleaned sample, along with the SQL scripts, documentation, and results. The full dataset was processed and analyzed in Snowflake but is not included in the repository.



## 4. Analysis and Dashboard



After cleaning the data, I used SQL to explore overall statistics, trip timing, distance and duration, payment types, locations, and potential anomalies.



I created six Excel chart images to present selected findings, including trip distance, trip duration, pickup-hour demand, weekday patterns, payment types, and the top pickup zones.



I then brought the main metrics and visualizations together in an interactive Power BI dashboard. It includes KPI cards and filters for date, weekday, pickup hour, and payment type, allowing users to explore the recorded trip patterns.



## 5. Tools Used



* **Snowflake SQL:** Data profiling, cleaning, validation, and exploratory analysis.

* **Microsoft Excel:** Charts for presenting analysis results.

* **Power BI:** Interactive dashboard and KPI reporting.

* **GitHub:** Versioned project files, SQL scripts, documentation, and deliverables.



## 6. Project Deliverables



The final project brings together the data-cleaning scripts and results, SQL analysis files, Excel chart images, Power BI dashboard, business insights, and supporting documentation.



## 7. What I Learned



Through this project, I gained practical experience in checking data quality, cleaning a large dataset with SQL, exploring business patterns, creating charts, and presenting findings through a dashboard.



It also helped me understand the importance of validating data before using it for analysis and being careful not to treat unusual records as errors without further investigation.



