# Exploratory Data Analysis — Results \& Insights



## Dataset Overview



The exploratory analysis was performed on the cleaned January 2026 NYC Yellow Taxi dataset.



- Cleaned records: 3,724,777

- Columns: 20

- Analysis tool: Snowflake SQL

- Analysis period for time-based analysis: January 2026

- Source: NYC TLC Yellow Taxi Trip Records



---



## 1. Overall Trip Statistics



### Trip Distance



- Minimum trip distance: 0 miles

- Maximum trip distance: 295.99 miles

- Average trip distance: 3.37 miles

- Median trip distance: 1.81 miles



The average distance is higher than the median, indicating that a smaller number of longer trips increase the average.



### Trip Duration



- Minimum duration: 0 minutes

- Maximum duration: 7,508 minutes

- Average duration: 17.19 minutes

- Median duration: 13 minutes



The average duration is higher than the median, showing that longer-duration trips affect the average.



### Fare and Total Amount



- Average fare amount: 20.80

- Median fare amount: 15.60

- Average total amount: 29.18

- Median total amount: 23.05



Both fare and total amount have averages above their medians, indicating a right-skewed distribution.



---



## 2. Trip Distance Distribution



| Distance Range | Trips | Share |

|---|---:|---:|

| 0 miles | 125,738 | 3.38% |

| >0–1 miles | 814,511 | 21.87% |

| >1–3 miles | 1,633,452 | 43.85% |

| >3–5 miles | 458,120 | 12.30% |

| >5–10 miles | 413,556 | 11.10% |

| >10 miles | 279,400 | 7.50% |



### Insight



Short trips make up a large share of the dataset. Approximately **69.1% of trips are 3 miles or less**, while the median trip distance is 1.81 miles.



---



## 3. Trip Duration Distribution



| Duration Range | Trips | Share |

|---|---:|---:|

| 0 minutes | 73,209 | 1.97% |

| 1–5 minutes | 402,194 | 10.80% |

| 6–15 minutes | 1,699,384 | 45.62% |

| 16–30 minutes | 1,124,959 | 30.20% |

| 31–60 minutes | 357,698 | 9.60% |

| 60+ minutes | 67,333 | 1.81% |



### Insight



Most trips are relatively short in duration. Approximately **88.59% of trips are 30 minutes or less**, with the 6–15 minute range containing the largest number of trips.



---



## 4. Time-Based Demand Analysis



### Hourly Demand



Pickup demand was analyzed by hour for January 2026.



- Lowest demand: 4 AM — 28,672 trips

- Highest demand: 6 PM — 265,569 trips



### Insight



Taxi demand varies substantially throughout the day. Demand is lowest during the early morning hours and increases through the day, reaching its highest level at approximately **6 PM** before declining later in the evening.



### Weekday Demand



Average trips per day by weekday:



| Weekday | Average Trips per Day |

|---|---:|

| Monday | 94,855 |

| Tuesday | 120,844 |

| Wednesday | 126,414 |

| Thursday | 131,065 |

| Friday | 131,045 |

| Saturday | 134,427 |

| Sunday | 93,409 |



### Insight



Daily demand varies across the week. Saturday had the highest average number of trips per day at **134,427**, while Sunday had the lowest at **93,409**.



Average daily trips were used instead of only total weekday counts to account for the different number of occurrences of each weekday in January 2026.



---



## 5. Payment Type Analysis



| Payment Type | Trips | Share |

|---|---:|---:|

| 1 | 2,249,744 | 60.40% |

| 0 | 1,087,950 | 29.21% |

| 2 | 314,042 | 8.43% |

| 4 | 56,400 | 1.51% |

| 3 | 16,641 | 0.45% |



### Insight



The trip distribution is concentrated in payment types **1 and 0**, which together account for **89.61% of all cleaned trips**.



Payment type codes are reported as codes here rather than assigning business meanings without separately verifying the official data dictionary.



---



## 6. Location Analysis



### Top Pickup Zones



| Rank | Pickup Zone | Trips |

|---|---|---:|

| 1 | Upper East Side South | 160,343 |

| 2 | Upper East Side North | 153,635 |

| 3 | JFK Airport | 152,589 |

| 4 | Midtown Center | 146,641 |

| 5 | Penn Station/Madison Sq West | 110,700 |

| 6 | Lincoln Square East | 110,004 |

| 7 | Midtown East | 108,701 |

| 8 | Times Sq/Theatre District | 106,112 |

| 9 | East Village | 100,992 |

| 10 | Upper West Side South | 97,464 |



### Top Drop-off Zones



| Rank | Drop-off Zone | Trips |

|---|---|---:|

| 1 | Upper East Side North | 156,658 |

| 2 | Upper East Side South | 146,725 |

| 3 | Midtown Center | 121,569 |

| 4 | Murray Hill | 99,579 |

| 5 | Times Sq/Theatre District | 99,155 |

| 6 | Lincoln Square East | 97,679 |

| 7 | Upper West Side South | 97,283 |

| 8 | Lenox Hill West | 95,942 |

| 9 | East Chelsea | 90,433 |

| 10 | Midtown East | 89,408 |



### Insight



Trip activity is geographically concentrated in several high-volume Manhattan zones. **Upper East Side South** recorded the highest number of pickups, while **Upper East Side North** recorded the highest number of drop-offs.



---



## 7. Route Analysis



The highest-volume pickup-to-drop-off routes included:



| Pickup Zone | Drop-off Zone | Trips |

|---|---|---:|

| Upper East Side South | Upper East Side North | 24,197 |

| Upper East Side North | Upper East Side South | 21,055 |

| Upper East Side North | Upper East Side North | 17,343 |

| Upper East Side South | Upper East Side South | 16,185 |

| Midtown Center | Upper East Side South | 10,380 |



These results show that several high-volume routes are concentrated around Manhattan's major taxi-demand areas.



---



## 8. Anomaly Analysis



Trips with durations above 300 minutes were reviewed as potential anomalies.



- Trips above 300 minutes: 1,432

- Zero-distance trips among them: 167

- Positive-distance trips: 1,265

- Average distance: 4.42 miles

- Median distance: 1.64 miles



### Insight



A small group of trips has unusually long recorded durations. Some of these records also have zero distance or unusually large financial values.



These records were **not automatically removed during Task 2**, because the purpose of EDA is to identify and describe unusual patterns rather than assume that every unusual record is incorrect.



The anomaly analysis therefore treats these records as observations requiring further investigation rather than confirmed data errors.



---

# Key Findings



1. Most taxi trips are short. About 69.1% of trips are 3 miles or less, and the median trip distance is 1.81 miles.



2. Most trips are also short in duration. About 88.59% of trips are completed within 30 minutes, with a median duration of 13 minutes.



3. Taxi demand changes significantly throughout the day. The lowest pickup volume was at 4 AM with 28,672 trips, while 6 PM had the highest with 265,569 trips.



4. Demand also changes by weekday. Saturday had the highest average daily trip volume, while Sunday had the lowest.



5. Most trips fall under payment types 1 and 0, which together account for 89.61% of cleaned trips.



6. A few locations account for a large share of pickup and drop-off activity. Upper East Side South had the highest pickup count, while Upper East Side North had the highest drop-off count.



7. There are some unusual long-duration trips. 1,432 trips lasted more than 300 minutes, including 167 trips with zero recorded distance. These were kept as anomalies rather than automatically treated as errors.

---



## Analysis Approach



The analysis focused on:



- Overall descriptive statistics

- Trip distance and duration distributions

- Time-based demand patterns

- Payment type distribution

- Pickup and drop-off locations

- Common routes

- Anomaly identification



The analysis was performed using SQL in Snowflake on the cleaned dataset produced during Task 1.

