# Data Quality Summary

## Dataset

The dataset used for this project is the January 2026 NYC Yellow Taxi Trip Records dataset.

The raw table contains `3,724,889` rows and `20` columns.

The data was checked for missing values, duplicates, incorrect data types, invalid values, unusual values, timestamp issues, financial inconsistencies and location ID issues.

---

## 1. Missing Values

Six columns contained NULL values:
- `PASSENGER_COUNT`
- `RATECODEID`
- `STORE_AND_FWD_FLAG`
- `CONGESTION_SURCHARGE`
- `AIRPORT_FEE`
- `CBD_CONGESTION_FEE`

Each of these columns had `1,088,058` NULL values.

The NULL values were found only in records where `PAYMENT_TYPE = 0` (Flex Fare).

Important fields such as pickup time, dropoff time, trip distance, pickup location, dropoff location, payment type, fare amount and total amount were populated in these records.

The missing values were therefore kept as they were. No values were filled in based on assumptions.

---

## 2. Duplicate Check

Potential duplicate trips were first checked using a combination of vendor, pickup time, dropoff time, pickup location, dropoff location and trip distance.

This produced `35,713` groups with two records.

However, the records in these groups had different financial details, so they could not be confirmed as duplicate trips.

A second check was performed using a full-row fingerprint.

The result was:
- Total rows: `3,724,889`
- Unique row fingerprints: `3,724,889`
- Duplicate rows based on the fingerprint: `0`

No duplicate records were removed.

---

## 3. Data Type Check

The pickup and dropoff datetime fields were stored as epoch timestamps in microseconds in the raw table.

They were converted to `TIMESTAMP_NTZ` in the cleaned table.

No other data type transformation was applied during cleaning.

---

## 4. Payment, Rate and Vendor Codes

The main code fields were checked for unexpected values.

### Payment Type

The dataset contained these payment type values:
`0`, `1`, `2`, `3`, `4`

No unexpected payment type values were found.

### Rate Code

The non-NULL rate codes found were:
`1`, `2`, `3`, `4`, `5`, `6`, `99`

No invalid non-NULL rate codes were found.

### Vendor ID

The vendor IDs found were:
`1`, `2`, `6`, `7`

No invalid vendor IDs were found.

### Store and Forward Flag

The populated values were:
`Y` and `N`

No unexpected populated values were found.

---

## 5. Passenger Count

Passenger count was checked because some values were unusual.

The data contained:
- `14,787` records with passenger count `0`
- A small number of records with passenger counts `7`, `8` and `9`
- `1,088,058` NULL passenger counts

The zero-passenger records were investigated. Many had positive trip distances and positive total amounts.

The records with passenger counts of `7`, `8` and `9` were also checked.

Some contained normal-looking trip distances and financial values.

There was not enough evidence to say these values were incorrect.

No passenger counts were changed.

---

## 6. Trip Distance

Trip distance was checked for negative, zero and unusually large values.

Results:
- Negative distance: `0`
- Zero distance: `125,738`
- Positive distance: `3,599,151`
- Maximum distance: `269,097.48` miles

Zero-distance trips were investigated separately because many of them had positive financial amounts.

There were `111` records with trip distance greater than `1,000` miles.

Some of these records contained extremely large values, including a maximum of `269,097.48` miles.

These records were removed from the cleaned table.

---

## 7. Timestamp Checks

The pickup and dropoff timestamps were converted from epoch microseconds and checked for chronological issues.

The raw data contained:
- `1` record where dropoff occurred before pickup
- `45,069` records where pickup and dropoff had the same timestamp

The single record where dropoff occurred before pickup was removed.

The same-timestamp records were investigated. Many had positive trip distances and positive total amounts, so they were not automatically treated as errors.

They were kept in the cleaned data.

---

## 8. Financial Value Checks

Negative values were found in several financial columns.

The raw data contained:

| Field | Negative records |
| `FARE_AMOUNT` | 39,463 |
| `EXTRA` | 20,035 |
| `MTA_TAX` | 37,730 |
| `TIP_AMOUNT` | 67 |
| `TOLLS_AMOUNT` | 3,391 |
| `IMPROVEMENT_SURCHARGE` | 39,732 |
| `CONGESTION_SURCHARGE` | 30,448 |
| `AIRPORT_FEE` | 9,225 |
| `TOTAL_AMOUNT` | 39,984 |

These values were investigated instead of automatically being removed.

Negative totals occurred across different payment types, including Dispute, Cash and No charge.

Since there was no single correction rule that could be safely applied to all of these records, the financial values were left unchanged.

---

## 9. Negative Fare and Total Amount

There were `39,463` records with a negative fare.

Among these:
- `39,445` also had a negative total
- `18` had a non-negative total

The `18` records with negative fare and non-negative total were inspected separately.

They had `PAYMENT_TYPE = 0` (Flex Fare) and contained different fare and charge values.

There was not enough information to determine the correct value for these records.

They were therefore kept unchanged.

---

## 10. Negative Total with Non-Negative Fare

There were `537` cash-payment records where the total amount was negative while the fare amount was zero or positive.

These records were inspected to understand the other charge fields.

The records contained different combinations of negative charge values, so they were not treated as one common error type.

No values were changed.

---

## 11. Pickup and Dropoff Location IDs

Pickup and dropoff location IDs were checked for valid ranges and were also compared with the official NYC Taxi Zone Lookup table.

The lookup table contained `265` location IDs.

The check found:
- Invalid pickup location IDs: `0`
- Invalid dropoff location IDs: `0`

No location IDs were changed.

---

## 12. Same Pickup and Dropoff Timestamp

There were `45,069` records where the pickup and dropoff timestamps were exactly the same.

These records were investigated further.

Among them:
- `43,905` had positive trip distance
- `45,059` had positive total amount
- `1,164` had zero distance
- `10` had zero total amount

Because many of these records contained other trip and financial information, the same timestamp by itself was not treated as a confirmed error.

The records were kept.

---

## 13. Trips Crossing the January Date Boundary

The January file contained a small number of trips whose pickup or dropoff timestamp was outside the January calendar range.

The checks found:
- `6` pickups before January 1
- `1` pickup on or after February 1
- `2` dropoffs before January 1
- `2,282` dropoffs on or after February 1

These records can represent trips that started in one month and ended in another.

They were not removed based on the date boundary alone.

---

## 14. Very Long Trip Duration

The records with February dropoffs were checked for unusually long trip durations.

Two records had durations longer than 24 hours.

They had the same trip details but different total amounts. One had a positive total and the other had a negative total.

There was not enough evidence to determine which record should be changed.

These records were kept.

---

## 15. Financial Reconciliation

`TOTAL_AMOUNT` was compared with the available fare and charge fields as part of the data quality investigation.

The first reconciliation calculation included `EXTRA`.

When sample records were investigated, the difference between the calculated amount and `TOTAL_AMOUNT` matched the `EXTRA` amount.

Because of this, `EXTRA` was excluded from the revised reconciliation calculation.

The revised check gave:
- Matching totals: `1,414,591`
- Different totals: `1,222,240`

The remaining `1,088,058` Flex Fare records could not be evaluated by this calculation because the relevant fields contained NULL values.

The official data dictionary does not provide a simple formula confirming that `TOTAL_AMOUNT` must equal the sum of all the available charge fields.

Because there was no reliable correction rule, `TOTAL_AMOUNT` was not changed.

---

## 16. Text Consistency

Text fields were checked for:
- Leading or trailing spaces
- Unexpected lowercase values
- Empty strings
- Blank or whitespace-only values
- Unexpected categorical values

No issues were found in these checks.

No text values were changed.

---

## 17. Numeric Validation

The main numeric fields were checked for special values such as:
- NaN
- Positive infinity
- Negative infinity

No such values were found.

Integer-style ID and code fields were also checked for fractional values.

No fractional values were found.

---

# Final Cleaning Result

After completing the quality checks, only two conditions resulted in rows being removed:

1. `TRIP_DISTANCE > 1000`

2. Dropoff timestamp earlier than pickup timestamp

The pickup and dropoff timestamp fields were also converted from epoch microseconds to `TIMESTAMP_NTZ`.

### Row Count

| Stage | Rows |
| Raw data | 3,724,889 |
| Extreme-distance records removed | 111 |
| Negative-duration record removed | 1 |
| Cleaned data | 3,724,777 |

The raw table was not modified.

The cleaned table contains `3,724,777` rows and `20` columns.

---

## Final Result

Most of the unusual values found during the investigation were kept because there was not enough evidence to safely change them.

The final cleaning was limited to the issues that could be clearly identified from the data:
- 111 extreme-distance records were removed.
- 1 record with dropoff before pickup was removed.
- Pickup and dropoff epoch timestamps were converted to `TIMESTAMP_NTZ`.

The cleaned table was then checked again to confirm that the applied cleaning rules were successful.