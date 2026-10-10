# Cleaning Decisions

## Purpose

The purpose of the cleaning step was to prepare the January 2026 NYC Yellow Taxi data for analysis while avoiding changes that could not be supported by the data.

The raw table was kept unchanged. A separate cleaned table, `YELLOW_TAXI_CLEANED`, was created from the raw table.

---

## 1. Timestamp Conversion

The pickup and dropoff datetime columns were stored as epoch timestamps in microseconds in the raw table.

The two columns were converted to `TIMESTAMP_NTZ` in the cleaned table.

- `TPEP_PICKUP_DATETIME`
- `TPEP_DROPOFF_DATETIME`

This was done so the timestamps could be used directly for date, time and duration checks.

No other columns had their data types changed.

---

## 2. Extremely Large Trip Distances

During the data quality checks, some trip distances were much larger than normal taxi trip distances.

There were:

- 111 records with `TRIP_DISTANCE > 1000` miles.

The investigation showed extremely large values, including a maximum distance of `269,097.48` miles.

These records were removed because the values were extreme compared with the rest of the trip-distance data and were not suitable for the analysis-ready dataset.

**Decision:** Remove 111 records.

---

## 3. Dropoff Before Pickup

The pickup and dropoff timestamps were checked to make sure the trip ended after it started.

One record had the dropoff time before the pickup time.

The record showed:
- Pickup location: 46
- Dropoff location: 86
- Trip distance: 16.5 miles
- Passenger count: 1
- Payment type: 1
- Fare: 66.50
- Total amount: 67.00

Because the recorded trip chronology was not possible, this record was removed.

**Decision:** Remove 1 record.

---

## 4. Missing Values

Six columns had missing values:
- `PASSENGER_COUNT`
- `RATECODEID`
- `STORE_AND_FWD_FLAG`
- `CONGESTION_SURCHARGE`
- `AIRPORT_FEE`
- `CBD_CONGESTION_FEE`

There were `1,088,058` NULL values in each of these columns in the raw data.

The missing values were not random. All of these NULLs were associated with `PAYMENT_TYPE = 0`, which represents Flex Fare.

Other important fields such as pickup and dropoff timestamps, trip distance, pickup and dropoff locations, payment type, fare amount and total amount were not NULL in these records.

Because the missing values followed a clear pattern and there was not enough information to safely fill them, they were not replaced.

**Decision:** Keep the NULL values. No imputation was performed.

---

## 5. Duplicate Records

Duplicate checks were performed in two ways.

First, possible duplicate groups were investigated using trip fields such as vendor, pickup time, dropoff time, pickup location, dropoff location and trip distance.

There were `35,713` groups with two records. However, the records in these groups had differences in their financial details, so they could not be confirmed as duplicate trips.

A full-row fingerprint check was also performed.

The result was:
- Total rows: `3,724,889`
- Unique rows: `3,724,889`
- Duplicate rows: `0`

Since no exact duplicate rows were found, no duplicate records were removed.

**Decision:** Keep the records.

---

## 6. Passenger Count

Passenger counts were investigated because some values were unusual.

The data contained:
- `14,787` records with passenger count `0`
- A small number of records with passenger counts `7`, `8` and `9`
- `1,088,058` NULL passenger counts

The zero-passenger records were investigated. Many had positive trip distances and positive total amounts.

The records with passenger counts of 7, 8 and 9 were also inspected. Some had valid-looking trip distances and financial values.

There was not enough evidence to say that these values were incorrect.

**Decision:** Keep the passenger counts unchanged.

---

## 7. Zero Trip Distance

There were `125,738` records with a trip distance of `0`.

These records were investigated instead of automatically being removed.

Among them:
- `122,657` had positive total amounts
- `172` had zero total amounts
- `2,909` had negative total amounts

Because a zero distance did not always mean that the record was invalid, these records were retained.

**Decision:** Keep zero-distance records.

---

## 8. Negative Financial Values

Negative values were found in several financial columns.

The raw data contained:
- Negative fare: `39,463`
- Negative extra: `20,035`
- Negative MTA tax: `37,730`
- Negative tip: `67`
- Negative tolls: `3,391`
- Negative improvement surcharge: `39,732`
- Negative congestion surcharge: `30,448`
- Negative airport fee: `9,225`
- Negative total amount: `39,984`

These values were investigated rather than automatically treated as errors.

Negative totals were especially concentrated in payment types such as `Dispute`, `Cash` and `No charge`.

Because the data can contain adjustments and dispute-related records, there was not enough evidence to apply one correction rule to all negative values.

**Decision:** Keep the negative financial values unchanged.

---

## 9. Negative Fare with Non-Negative Total

There were `39,463` records with a negative fare.

Among them:
- `39,445` also had a negative total
- `18` had a non-negative total

The 18 exceptional records were inspected individually.

They were associated with `PAYMENT_TYPE = 0` (Flex Fare) and contained negative fare values with positive total amounts.

These records were treated as anomalies requiring review, but there was not enough information to determine the correct replacement values.

**Decision:** Keep the records unchanged.

---

## 10. Negative Total with Non-Negative Fare

There were `537` cash-payment records where the total amount was negative while the fare amount was zero or positive.

These records were inspected to understand whether the negative totals might be explained by other charge fields.

The records contained different negative charge components, so they were not treated as a single type of error.

**Decision:** Keep the records unchanged.

---

## 11. Payment Type

The payment type values found in the dataset were:
- `0`
- `1`
- `2`
- `3`
- `4`

These correspond to the valid payment type codes used for the Yellow Taxi data.

No unexpected payment type values were found.

**Decision:** No cleaning was required.

---

## 12. Rate Code

The non-NULL rate code values found were:
- `1`
- `2`
- `3`
- `4`
- `5`
- `6`
- `99`

These were checked against the valid rate codes.

No invalid non-NULL rate codes were found.

**Decision:** No cleaning was required.

---

## 13. Store and Forward Flag

The populated values were:
- `N`
- `Y`

No unexpected populated values were found.

The NULL values were associated with Flex Fare records and were kept.

**Decision:** No values were changed.

---

## 14. Vendor ID

The vendor IDs found were:
- `1`
- `2`
- `6`
- `7`

No invalid vendor IDs were found.

**Decision:** No cleaning was required.

---

## 15. Pickup and Dropoff Location IDs

The pickup and dropoff location IDs were checked for valid ranges and were also checked against the official Taxi Zone Lookup table.

The lookup table contained `265` location IDs.

The referential integrity check found:
- Invalid pickup location IDs: `0`
- Invalid dropoff location IDs: `0`

**Decision:** No location IDs were changed.

---

## 16. Same Pickup and Dropoff Timestamp

There were `45,069` records where pickup and dropoff timestamps were exactly the same.

These records were investigated.

Among them:
- `43,905` had positive trip distance
- `45,059` had positive total amounts
- `1,164` had zero distance
- `10` had zero total amounts

Since many of these records contained valid trip and financial information, same timestamps were not treated as an automatic error.

**Decision:** Keep the records.

---

## 17. Trips Crossing the January Date Boundary

Some records had pickup or dropoff timestamps just outside the January calendar range.

There were:
- 6 trips with pickup before January 1
- 1 trip with pickup on or after February 1
- 2 trips with dropoff before January 1
- 2,282 trips with dropoff on or after February 1

These can occur when a trip starts in one month and ends in another.

They were therefore not automatically removed.

**Decision:** Keep these records unless they were removed for another confirmed quality issue.

---

## 18. Very Long Trip Duration

The trips with February dropoffs were checked for unusually long durations.

Two records had durations longer than 24 hours.

They represented the same trip details except for the total amount, with one record having a positive total and the other a negative total.

There was not enough evidence to determine which record was incorrect.

These records were therefore retained.

**Decision:** No removal or correction was made.

---

## 19. Financial Reconciliation

The `TOTAL_AMOUNT` field was compared with the available fare and charge components as part of the quality investigation.

The first reconciliation formula included `EXTRA`. When sample differences were investigated, the difference matched the `EXTRA` amount, showing that including `EXTRA` in that calculation was not appropriate for this check.

The reconciliation was then checked without `EXTRA`.

The results still showed differences for many records:
- Matching totals: `1,414,591`
- Different totals: `1,222,240`

The Flex Fare records could not be evaluated in the same way because the relevant fields contained NULL values.

The official data dictionary does not provide a simple formula confirming that `TOTAL_AMOUNT` must equal the sum of all these fields.

Because there was no reliable correction rule, `TOTAL_AMOUNT` was not changed.

**Decision:** Keep the financial values unchanged.

---

## 20. Text Consistency

Text fields were checked for:
- Leading or trailing spaces
- Unexpected lowercase values
- Empty strings
- Blank or whitespace-only values
- Unexpected categorical values

No such issues were found.

**Decision:** No text cleaning was required.

---

## 21. Numeric and Code Validation

Numeric financial and distance fields were checked for special values such as NaN, positive infinity and negative infinity.

No such values were found.

Integer-style ID and code fields were also checked for fractional values.

No fractional values were found.

**Decision:** No cleaning was required.

---

# Final Cleaning Applied

After completing the investigations, only two data quality rules resulted in row removal:

1. Remove records where `TRIP_DISTANCE > 1000`.

2. Remove records where `TPEP_DROPOFF_DATETIME` is earlier than `TPEP_PICKUP_DATETIME`.

The two timestamp columns were also converted from epoch microseconds to `TIMESTAMP_NTZ`.

### Final Row Counts
- Raw table: `3,724,889` rows
- Extreme-distance records removed: `111`
- Negative-duration record removed: `1`
- Cleaned table: `3,724,777` rows

The raw table was kept unchanged throughout the process.