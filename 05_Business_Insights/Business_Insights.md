# NYC Taxi Data Analytics — Business Insights



## 1. Project Overview



In this project, I analyzed the January 2026 NYC Yellow Taxi Trip Records to understand trip patterns and identify data quality issues. I used SQL in Snowflake for data cleaning and analysis, Excel for charts, and Power BI to present the main findings in an interactive dashboard.



The project covered three main stages: checking and cleaning the data, exploring trip patterns, and presenting the results in a dashboard.



## 2. Dataset and Data Cleaning



The original dataset contained 3,724,889 records and 20 columns. After the data cleaning process, 3,724,777 records remained.



During cleaning, I excluded:



* 111 records with trip distances greater than 1,000 miles.

* One record where the drop-off timestamp was earlier than the pickup timestamp.



After cleaning, the validation checks found no duplicate records.



This step helped prepare the data for analysis and reduced the risk of using clearly invalid records in the results.



## 3. Key Findings



### Trip distance and duration



The median trip distance was **1.81 miles**, and the median trip duration was **13 minutes**. About **69.1% of trips were 3 miles or less**, while **88.59% lasted 30 minutes or less**.



These figures show that shorter trips account for a large share of the recorded journeys. They provide useful context for understanding taxi demand, although trip distance and duration alone do not tell us which journeys are most profitable.



### Pickup demand by hour



The highest pickup volume occurred at **6 PM, with 265,569 trips**. The lowest occurred at **4 AM, with 28,672 trips**.



Demand varied considerably by hour. This pattern could help taxi operators investigate when more drivers may be needed and when demand is quieter.



### Demand by weekday



Saturday had the highest average daily trip volume at **134,427 trips**, while Sunday had the lowest at **93,409 trips**.



Using average trips per day makes the weekday comparison more meaningful because each weekday occurred a different number of times during January 2026.



### Payment types



Payment types **1 and 0 together accounted for 89.61% of cleaned trips**.



I retained the numeric codes in the analysis rather than assigning meanings without checking the official data dictionary. The distribution shows how trips are grouped by the recorded payment type, but it does not by itself explain customer payment preferences.



### Pickup and drop-off locations



**Upper East Side South** had the highest pickup volume, with **160,343 trips**. **Upper East Side North** had the highest drop-off volume, with **156,658 trips**.



Several of the highest-volume locations were in Manhattan. These results help identify areas with substantial recorded taxi activity and could be useful for further geographic demand analysis.



### Common routes



One of the most frequent routes was from Upper East Side South to Upper East Side North, with **24,197 trips**. The reverse route recorded **21,055 trips**.



The route results show that some journeys were concentrated between a small number of high-volume locations.



### Unusual trip durations



The analysis identified **1,432 trips lasting more than 300 minutes**, including **167 trips with zero recorded distance**.



These records were retained as potential anomalies rather than automatically removed. An unusually long duration or zero distance may indicate a data issue, but further investigation is needed before classifying a trip as invalid.



## 4. Power BI Dashboard



I created an interactive Power BI dashboard to bring the main metrics and findings together.



The dashboard includes:



* Total Trips: approximately 3.72 million

* Median Trip Distance: 1.81 miles

* Median Trip Duration: 13 minutes

* Average Total Amount: 29.18, displayed with a dollar sign in the dashboard



It also includes filters for date, weekday, pickup hour, and payment type. The visuals cover trip distance, trip duration, pickup-hour demand, weekday patterns, payment types, and the top 10 pickup zones.



The dashboard makes it easier to explore the results by filtering the data and comparing different categories.



## 5. Business Recommendations



Based on the findings, I would investigate these areas further:



1. **Driver availability:** Review hourly and weekday demand patterns before making decisions about driver allocation.

2. **Location planning:** Examine high-volume pickup and drop-off zones to understand where vehicle availability may need attention.

3. **Trip validation:** Investigate long-duration and zero-distance trips before deciding whether they are data errors.

4. **Payment reporting:** Confirm the meaning of payment codes before using them to draw conclusions about payment preferences.

5. **Data quality checks:** Apply consistent validation checks to future datasets to support reliable reporting.



These are possible next steps based on the observed patterns. The analysis does not establish the financial impact of these recommendations.



## 6. Conclusion



This project gave me practical experience with data cleaning, SQL-based exploratory analysis, Excel visualizations, and Power BI dashboard development.



The analysis highlighted differences in trip distance, duration, pickup demand, weekday activity, payment types, locations, and common routes. Bringing these findings together in a dashboard made the results easier to explore and review.



The final project includes the SQL scripts, data quality documentation, EDA results, Excel charts, and interactive Power BI dashboard used throughout the analysis.



