# Project Limitations



## 1. Dataset Included in the Repository



The analysis was carried out using the January 2026 NYC Yellow Taxi Trip Records. The complete dataset was processed and analyzed in Snowflake, but the GitHub repository contains only a 10,000-row cleaned sample rather than the full dataset.



## 2. Snowflake Access



The Snowflake trial used during the project has expired. I have retained the SQL scripts, documentation, and saved analysis results in the project repository. However, I cannot currently guarantee that the original Snowflake connection or dashboard refresh will work.



## 3. Potential Data Anomalies



The analysis identified unusual records, including trips with very long durations and trips with zero recorded distance. These records were treated as potential anomalies for further investigation rather than automatically classified as errors.



Additional checks would be needed to understand why these values occurred and whether any records should be excluded.



## 4. Payment-Type Codes



The analysis presents payment types using the numeric codes recorded in the dataset. I have not assigned meanings to those codes without verifying them against the official dataset documentation. Confirming the code definitions would be necessary before drawing conclusions about individual payment methods.



## 5. Scope of the Analysis



This project focuses on data from January 2026. The findings describe patterns observed during that month and should not be treated as evidence of long-term or seasonal trends.



The analysis can help identify areas for further investigation, but it does not independently establish taxi profitability, customer preferences, or the financial impact of operational changes.



## 6. Dashboard Connectivity



The Power BI dashboard is included as a project deliverable. Because the Snowflake trial has expired, its current connection and refresh status have not been guaranteed. The dashboard should therefore be presented as a saved analytical deliverable unless its connection and refresh are tested successfully.



