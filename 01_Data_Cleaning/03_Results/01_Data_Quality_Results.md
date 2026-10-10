# Data Quality Results

## Dataset Size

| Check | Result |
| Raw records | 3,724,889 |
| Cleaned records | 3,724,777 |
| Records removed | 112 |
| Columns | 20 |

The 112 removed records consisted of:
- 111 records with `TRIP_DISTANCE > 1000`
- 1 record where dropoff occurred before pickup

---

## Missing Values

The raw data contained `1,088,058` NULL values in each of these columns:
- `PASSENGER_COUNT`
- `RATECODEID`
- `STORE_AND_FWD_FLAG`
- `CONGESTION_SURCHARGE`
- `AIRPORT_FEE`
- `CBD_CONGESTION_FEE`

These NULLs were associated with `PAYMENT_TYPE = 0` (Flex Fare).

The values were not imputed.

After cleaning, these columns contained `1,087,950` NULL values each.

The reduction in the NULL count was caused by the removal of records that met the cleaning rules, not by filling the missing values.

---

## Duplicate Check

The full-row fingerprint check found:
- Total raw rows: `3,724,889`
- Unique row fingerprints: `3,724,889`
- Duplicate rows based on the fingerprint: `0`

No duplicate records were removed.

---

## Trip Distance Checks

| Check | Result |
| Negative distance | 0 |
| Zero distance | 125,738 |
| Positive distance | 3,599,151 |
| Distance > 1000 miles | 111 |

The 111 extreme-distance records were removed.

After cleaning:
- Distance > 1000 miles: `0`
- Negative distance: `0`

---

## Timestamp Checks

The raw data contained:
- `1` record with dropoff before pickup
- `45,069` records with the same pickup and dropoff timestamp

The single negative-duration record was removed.

After cleaning:
- Dropoff before pickup: `0`
- Same pickup/dropoff timestamp: `45,069`
- Positive-duration records: `3,679,708`

The same-timestamp records were retained because they were not confirmed as invalid.

---

## Location Validation

Pickup and dropoff location IDs were checked against the official NYC Taxi Zone Lookup table.

The lookup table contained `265` location IDs.

Results:

| Check | Invalid records |
| Pickup location ID | 0 |
| Dropoff location ID | 0 |

No location IDs were changed.

---

## Code Validation

The following fields were checked for invalid values:
- `PAYMENT_TYPE`
- `RATECODEID`
- `VENDORID`
- `STORE_AND_FWD_FLAG`

No invalid values were found in the final cleaned table.

---

## Final Structural Checks

The cleaned table contains:
- `20` columns
- Pickup timestamp as `TIMESTAMP_NTZ`
- Dropoff timestamp as `TIMESTAMP_NTZ`
- No duplicate row fingerprints
- No negative trip distances
- No negative-duration records

The raw table was kept unchanged.

The final cleaned table contains `3,724,777` records.