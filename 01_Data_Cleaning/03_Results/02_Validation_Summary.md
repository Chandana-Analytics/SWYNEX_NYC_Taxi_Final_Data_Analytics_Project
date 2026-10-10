# Post-Cleaning Validation

The cleaned table was checked again after the cleaning rules were applied.

The purpose of these checks was to make sure the records removed during cleaning were actually excluded and that the cleaned table did not contain the same issues that were targeted.

---

## 1. Row Count

| Table | Rows |
| Raw table | 3,724,889 |
| Cleaned table | 3,724,777 |
| Records removed | 112 |

The 112 removed records were:
- 111 records with `TRIP_DISTANCE > 1000`
- 1 record where dropoff occurred before pickup

The row counts matched the expected cleaning result.

---

## 2. Trip Distance Validation

The cleaned table was checked again for extreme and negative trip distances.

Results:
- Records with `TRIP_DISTANCE > 1000`: `0`
- Records with negative `TRIP_DISTANCE`: `0`

The 111 extreme-distance records identified during the quality checks were no longer present in the cleaned table.

---

## 3. Timestamp Validation

The cleaned pickup and dropoff timestamps were checked for chronological consistency.

Results:
- Dropoff before pickup: `0`
- Same pickup and dropoff timestamp: `45,069`
- Positive-duration records: `3,679,708`

The negative-duration record was successfully removed.

The same-timestamp records were retained because they were not confirmed as errors.

---

## 4. Duplicate Validation

The cleaned table was checked using the same full-row fingerprint approach used during the initial duplicate investigation.

Results:
- Total cleaned rows: `3,724,777`
- Unique row fingerprints: `3,724,777`
- Duplicate rows: `0`

No duplicate rows were present in the cleaned table based on the fingerprint check.

---

## 5. Location Validation

The pickup and dropoff location IDs were checked again against the official Taxi Zone Lookup table.

Results:
- Invalid pickup location IDs: `0`
- Invalid dropoff location IDs: `0`

All location IDs in the cleaned table matched the lookup table.

---

## 6. Code Validation

The cleaned table was checked for invalid values in the main code fields.

Results:
- Invalid payment types: `0`
- Invalid rate codes: `0`
- Invalid vendor IDs: `0`
- Invalid store-and-forward values: `0`

---

## 7. Timestamp Data Types

The cleaned table was checked to confirm that the timestamp conversion was applied correctly.

The final table contains:
- `TPEP_PICKUP_DATETIME` → `TIMESTAMP_NTZ`
- `TPEP_DROPOFF_DATETIME` → `TIMESTAMP_NTZ`

Both timestamp columns were successfully converted from the numeric epoch format used in the raw table.

---

## 8. Critical Field Validation

The following important fields contained no NULL values in the cleaned table:
- `VENDORID`
- `TPEP_PICKUP_DATETIME`
- `TPEP_DROPOFF_DATETIME`
- `TRIP_DISTANCE`
- `PULOCATIONID`
- `DOLOCATIONID`
- `PAYMENT_TYPE`
- `FARE_AMOUNT`
- `TOTAL_AMOUNT`

The NULL values found in the six systematically missing columns were retained rather than imputed.

---

## 9. Financial Values

The cleaning process did not modify the financial values.

The final cleaned table still contained the original negative financial values that were identified during the investigation.

This was intentional because no reliable rule was found for correcting all of these records.

---

## 10. Final Validation Result

The final cleaned table contains `3,724,777` rows and `20` columns.

The two issues selected for actual row removal were successfully resolved:

- Extreme trip distances greater than `1,000` miles: `0`
- Dropoff before pickup: `0`

Other investigated values were retained where there was not enough evidence to safely modify them.

The raw table was kept unchanged throughout the process.