# EDA Approach



## Objective



The objective of Task 2 was to perform exploratory data analysis on the cleaned NYC Yellow Taxi dataset from Task 1.



The analysis focused on understanding important statistics, trip patterns, time-based demand, payment distribution, location activity and unusual records.



## Dataset Used



- Dataset: NYC Yellow Taxi Trip Records

- Period: January 2026

- Cleaned records: 3,724,777

- Columns: 20

- Analysis tool: Snowflake SQL

- Visualization tool: Excel



The cleaned dataset was prepared during Task 1.



## Analysis Areas



The exploratory analysis was performed in the following areas:



### 1. Overall Statistics



Calculated:



- Total number of trips

- Minimum trip distance

- Maximum trip distance

- Average trip distance

- Median trip distance

- Minimum trip duration

- Maximum trip duration

- Average trip duration

- Median trip duration

- Fare amount statistics

- Total amount statistics



Average and median values were compared to understand typical trip characteristics.



### 2. Trip Analysis



Analyzed the distribution of:



- Trip distance

- Trip duration



Trips were grouped into ranges to understand the most common trip lengths and durations.



### 3. Time Analysis



Analyzed taxi demand based on:



- Pickup date

- Day of the week

- Pickup hour



For weekday analysis, average trips per day were calculated to make the comparison more meaningful.



### 4. Payment Analysis



Analyzed:



- Number of trips by payment type

- Average fare amount by payment type

- Average total amount by payment type

- Trip share by payment type



### 5. Location Analysis



The cleaned trip data was joined with the NYC Taxi Zone lookup table.



The analysis covered:



- Top pickup zones

- Top drop-off zones

- Top pickup and drop-off routes



### 6. Anomaly Analysis



Trips with durations above 300 minutes were identified as potential anomalies.



These records were reviewed using:



- Trip duration

- Trip distance

- Fare amount

- Total amount

- Payment type



Unusual records were not automatically removed because an unusual value does not necessarily mean that the record is incorrect.



## Visualization Approach



Six charts were created in Excel to communicate the main patterns identified during the analysis:



1. Trip Distance Distribution

2. Trip Duration Distribution

3. Trips by Pickup Hour

4. Average Trips per Day by Weekday

5. Payment Type Distribution

6. Top 10 Pickup Zones



## Analysis Workflow



The analysis followed this workflow:



1. Start with the cleaned dataset from Task 1.

2. Calculate overall statistics.

3. Analyze trip distance and duration distributions.

4. Analyze demand by date, weekday and pickup hour.

5. Analyze payment-type distribution and average amounts.

6. Analyze pickup zones, drop-off zones and routes.

7. Investigate unusual long-duration records.

8. Create charts for the main patterns.

9. Summarize useful findings and observations.



## Data Scope



The full cleaned dataset contains 3,724,777 records and was analyzed in Snowflake.



A 10,000-row cleaned sample is included in the repository for reference. The sample is not the complete dataset.

