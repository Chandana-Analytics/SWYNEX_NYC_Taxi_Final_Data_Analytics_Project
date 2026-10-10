-- NYC Taxi Data Cleaning Project
-- January 2026 Yellow Taxi Trip Records
-- Cleaning the data after the quality checks

USE DATABASE NYC_TAXI_DQ;
USE SCHEMA RAW;

-- Create a cleaned table.
-- The original raw table is kept unchanged.

-- Based on the checks:
-- 1. 111 records had extremely large trip distances (>1000 miles).
-- 2. 1 record had dropoff time before pickup time.
-- 3. The two timestamp columns were stored as epoch microseconds,
--    so they are converted to normal timestamps here.

-- Other issues were investigated but not changed because
-- there was not enough evidence to safely modify those values.

CREATE OR REPLACE TABLE YELLOW_TAXI_CLEANED AS
SELECT
    VENDORID,
    TO_TIMESTAMP_NTZ(TPEP_PICKUP_DATETIME / 1000000)
        AS TPEP_PICKUP_DATETIME,
    TO_TIMESTAMP_NTZ(TPEP_DROPOFF_DATETIME / 1000000)
        AS TPEP_DROPOFF_DATETIME,
    PASSENGER_COUNT,
    TRIP_DISTANCE,
    RATECODEID,
    STORE_AND_FWD_FLAG,
    PULOCATIONID,
    DOLOCATIONID,
    PAYMENT_TYPE,
    FARE_AMOUNT,
    EXTRA,
    MTA_TAX,
    TIP_AMOUNT,
    TOLLS_AMOUNT,
    IMPROVEMENT_SURCHARGE,
    TOTAL_AMOUNT,
    CONGESTION_SURCHARGE,
    AIRPORT_FEE,
    CBD_CONGESTION_FEE
FROM YELLOW_TAXI_RAW
WHERE TRIP_DISTANCE <= 1000
  AND TPEP_DROPOFF_DATETIME >= TPEP_PICKUP_DATETIME;