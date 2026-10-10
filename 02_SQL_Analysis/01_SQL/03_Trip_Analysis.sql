-- SWYNEX Internship - Task 2
-- NYC Taxi Exploratory Data Analysis
-- Trip Analysis


-- 1. Trip distance distribution
SELECT
    CASE
        WHEN TRIP_DISTANCE = 0 THEN '0 miles'
        WHEN TRIP_DISTANCE <= 1 THEN '>0-1 miles'
        WHEN TRIP_DISTANCE <= 3 THEN '>1-3 miles'
        WHEN TRIP_DISTANCE <= 5 THEN '>3-5 miles'
        WHEN TRIP_DISTANCE <= 10 THEN '>5-10 miles'
        ELSE '>10 miles'
    END AS DISTANCE_RANGE,
    COUNT(*) AS TOTAL_TRIPS
FROM NYC_TAXI_DQ.RAW.YELLOW_TAXI_CLEANED
GROUP BY DISTANCE_RANGE
ORDER BY
    CASE DISTANCE_RANGE
        WHEN '0 miles' THEN 1
        WHEN '>0-1 miles' THEN 2
        WHEN '>1-3 miles' THEN 3
        WHEN '>3-5 miles' THEN 4
        WHEN '>5-10 miles' THEN 5
        WHEN '>10 miles' THEN 6
    END;

-- 2. Trip duration distribution
SELECT
    CASE
        WHEN DATEDIFF('minute', TPEP_PICKUP_DATETIME, TPEP_DROPOFF_DATETIME) = 0 THEN '0 minutes'
        WHEN DATEDIFF('minute', TPEP_PICKUP_DATETIME, TPEP_DROPOFF_DATETIME) <= 5 THEN '1-5 minutes'
        WHEN DATEDIFF('minute', TPEP_PICKUP_DATETIME, TPEP_DROPOFF_DATETIME) <= 15 THEN '6-15 minutes'
        WHEN DATEDIFF('minute', TPEP_PICKUP_DATETIME, TPEP_DROPOFF_DATETIME) <= 30 THEN '16-30 minutes'
        WHEN DATEDIFF('minute', TPEP_PICKUP_DATETIME, TPEP_DROPOFF_DATETIME) <= 60 THEN '31-60 minutes'
        ELSE '60+ minutes'
    END AS DURATION_RANGE,
    COUNT(*) AS TOTAL_TRIPS
FROM NYC_TAXI_DQ.RAW.YELLOW_TAXI_CLEANED
GROUP BY DURATION_RANGE
ORDER BY
    CASE DURATION_RANGE
        WHEN '0 minutes' THEN 1
        WHEN '1-5 minutes' THEN 2
        WHEN '6-15 minutes' THEN 3
        WHEN '16-30 minutes' THEN 4
        WHEN '31-60 minutes' THEN 5
        WHEN '60+ minutes' THEN 6
    END;