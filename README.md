# NYC Taxi Data Analytics Project



An end-to-end data analytics project completed as part of my SWYNEX Technologies internship, using the January 2026 NYC Yellow Taxi Trip Records.



I worked through the complete analytics process, from checking and cleaning the data to exploring trip patterns, creating Excel charts, and building an interactive Power BI dashboard.



## 1. Project Overview



The dataset contains millions of taxi trip records, making it difficult to review trip patterns and data quality issues manually.



My goal was to prepare the data for analysis, understand when and where taxi trips occur, explore trip distances and durations, and present the findings through charts and an interactive dashboard.



## 2. Project Objectives



* Check data quality and clean invalid records.

* Validate the cleaned dataset.

* Analyze trip distance, duration, pickup times, and weekday patterns.

* Explore payment types, pickup and drop-off locations, and common routes.

* Identify unusual records that may need further investigation.

* Present the findings through Excel charts and a Power BI dashboard.



## 3. Dataset Information



| Item                   | Details                                               |

| ---------------------- | ----------------------------------------------------- |

| Dataset                | January 2026 NYC Yellow Taxi Trip Records             |

| Source                 | New York City Taxi and Limousine Commission (NYC TLC) |

| Original records       | 3,724,889                                             |

| Records after cleaning | 3,724,777                                             |

| Records excluded       | 112                                                   |

| Columns                | 20                                                    |



The full dataset was processed and analyzed in Snowflake. The GitHub repository contains a 10,000-row cleaned sample rather than the complete dataset.



## 4. Task 1 — Data Cleaning and Quality Assessment



I used Snowflake SQL to examine the dataset structure, run data quality checks, apply cleaning rules, and validate the results.



The cleaning process excluded:



* 111 records with trip distances greater than 1,000 miles.

* One record where the drop-off timestamp was earlier than the pickup timestamp.



After cleaning, 3,724,777 records remained. The post-cleaning uniqueness check did not identify duplicate records.



The data-cleaning folder contains the SQL scripts, data dictionary, cleaning decisions, data quality results, validation summary, and cleaned sample.



## 5. Task 2 — SQL Exploratory Data Analysis



After cleaning the data, I used SQL to explore six areas:



1\. Overall trip statistics

2\. Trip timing and demand patterns

3\. Trip distance and duration

4\. Payment-type distribution

5\. Pickup and drop-off locations

6\. Potential anomalies in trip records



The analysis helped me compare trip patterns, identify high-volume locations, and examine records that may require additional checks.



### Key findings



* **Trip distance:** About 69.1% of trips were 3 miles or less.

* **Trip duration:** About 88.59% of trips lasted 30 minutes or less.

* **Pickup demand:** The highest pickup volume occurred at 6 PM, with 265,569 trips.

* **Weekday patterns:** Saturday had the highest average daily trip volume, while Sunday had the lowest.

* **Pickup locations:** Upper East Side South recorded the highest pickup volume, with 160,343 trips.

* **Potential anomalies:** The analysis identified trips with unusually long durations and zero recorded distance that may need further investigation.



These findings describe the January 2026 dataset and do not establish long-term trends or financial impact.



## 6. Task 3 — Excel Charts and Power BI Dashboard



### Excel charts



I created six chart images to present the main analysis results:



* Trip Distance Distribution

* Trip Duration Distribution

* Trips by Pickup Hour

* Average Trips per Day by Weekday

* Payment Type Distribution

* Top 10 Pickup Zones



These charts make the main patterns easier to review and compare.



### Power BI dashboard



I built an interactive Power BI dashboard to bring the main metrics and visualizations together.



The dashboard includes four KPI cards:



* Total Trips

* Median Trip Distance

* Median Trip Duration

* Average Total Amount



It also includes visuals for trip patterns, payment types, and pickup zones, with slicers for date, weekday, pickup hour, and payment type.



The dashboard allows users to explore the recorded trip patterns by filtering the data.



## 7. Task 4 — Business Insights and Final Documentation



I brought the work from the earlier stages together in a final project folder. It includes the data-cleaning scripts, SQL analysis, Excel chart images, Power BI dashboard files, business insights, and supporting documentation.



The business-insights report summarizes the findings and identifies areas that could be investigated further, such as driver availability during busy hours, high-volume locations, and unusual trip records.



These are possible areas for further investigation, not proven financial outcomes.



## 8. Tools Used



* **Snowflake SQL:** Data profiling, cleaning, validation, and exploratory analysis.

* **Microsoft Excel:** Charts for presenting the findings.

* **Microsoft Power BI:** Interactive dashboard and KPI reporting.

* **GitHub:** Project organization, version control, and sharing deliverables.



## 9. Project Structure



```text

NYC\_Taxi\_Final\_Data\_Analytics\_Project/

├── 01\_Data\_Cleaning/

│   ├── 01\_SQL\_Scripts/

│   ├── 02\_Documentation/

│   ├── 03\_Results/

│   └── 04\_Cleaned\_Data/

├── 02\_SQL\_Analysis/

│   ├── 01\_SQL\_Scripts/

│   ├── 02\_Results/

│   └── 03\_Documentation/

├── 03\_Excel\_Charts/

├── 04\_Power\_BI\_Dashboard/

├── 05\_Business\_Insights/

├── 06\_Docs/

└── README.md

```



Each folder contains the relevant scripts, results, charts, dashboard files, or documentation for that stage of the project.



## 10. Limitations



* The repository includes a 10,000-row cleaned sample, not the complete dataset.

* The Snowflake trial has expired, so a working live connection or refresh is not guaranteed.

* Payment-type codes should be verified against the official dataset documentation before assigning specific meanings.

* Unusual trip records were treated as potential anomalies rather than automatically classified as errors.

* The analysis covers January 2026 and should not be treated as evidence of long-term or seasonal trends.



## 11. What I Learned



Working on this project gave me practical experience in data quality assessment, SQL-based data cleaning and analysis, Excel chart creation, and Power BI dashboard development.



It also helped me understand the importance of validating data before analysis and presenting findings carefully without making unsupported assumptions.



## Project Deliverables



This repository contains the SQL scripts, cleaning documentation, analysis results, cleaned sample, Excel chart images, Power BI dashboard files, business-insights report, and supporting documentation.



