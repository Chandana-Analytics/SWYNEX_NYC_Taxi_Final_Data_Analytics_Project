# Data Dictionary

## Dataset Overview

**Dataset:** NYC Yellow Taxi Trip Records — January 2026

The dataset contains individual Yellow Taxi trip records from New York City.

Each row represents one recorded taxi trip.

The 20 columns are grouped below based on what information they contain.


## 1. Trip Information

### VENDORID
**Meaning:** Identifies the technology provider that submitted the trip record.
**Raw Data Type:** `NUMBER(38,0)`
**Final Data Type:** `NUMBER(38,0)`

---

### TPEP_PICKUP_DATETIME

**Meaning:** The date and time when the taxi meter was engaged and the trip started.
**Raw Data Type:** `NUMBER`
**Final Data Type:** `TIMESTAMP_NTZ`
**Data Change:** The raw value was stored as epoch time in microseconds. It was converted into a readable timestamp during cleaning.

---

### TPEP_DROPOFF_DATETIME

**Meaning:** The date and time when the taxi meter was disengaged and the trip ended.
**Raw Data Type:** `NUMBER`
**Final Data Type:** `TIMESTAMP_NTZ`
**Data Change:** The raw value was stored as epoch time in microseconds. It was converted into a readable timestamp during cleaning.

---

### PASSENGER_COUNT

**Meaning:** The number of passengers reported by the driver for the trip.
**Raw Data Type:** `FLOAT`
**Final Data Type:** `FLOAT`

---

### TRIP_DISTANCE

**Meaning:** The distance travelled during the trip, measured in miles.
**Raw Data Type:** `FLOAT`
**Final Data Type:** `FLOAT`

---

## 2. Rate and Trip Location Information

### RATECODEID

**Meaning:** Identifies the rate type applied to the trip.
**Raw Data Type:** `NUMBER(38,0)`
**Final Data Type:** `NUMBER(38,0)`

---

### STORE_AND_FWD_FLAG

**Meaning:** Indicates whether the trip record was stored temporarily before being sent to the technology provider.
- `Y` — The record was stored and forwarded later.
- `N` — The record was not stored and forwarded later.
**Raw Data Type:** `TEXT`
**Final Data Type:** `TEXT`

---

### PULOCATIONID

**Meaning:** Identifies the Taxi Zone where the passenger was picked up.
**Raw Data Type:** `NUMBER(38,0)`
**Final Data Type:** `NUMBER(38,0)`

---

### DOLOCATIONID

**Meaning:** Identifies the Taxi Zone where the passenger was dropped off.
**Raw Data Type:** `NUMBER(38,0)`
**Final Data Type:** `NUMBER(38,0)`

---

## 3. Payment Information

### PAYMENT_TYPE

**Meaning:** Identifies the payment method used for the trip through a numeric code.

The codes present in this dataset are:
- `0` — Flex Fare
- `1` — Credit card
- `2` — Cash
- `3` — No charge
- `4` — Dispute
**Raw Data Type:** `NUMBER(38,0)`
**Final Data Type:** `NUMBER(38,0)`

---

## 4. Fare and Charge Information

### FARE_AMOUNT

**Meaning:** The base fare calculated by the taxi meter.
**Raw Data Type:** `FLOAT`
**Final Data Type:** `FLOAT`

---

### EXTRA

**Meaning:** Additional charges or extras applied to the trip.
**Raw Data Type:** `FLOAT`
**Final Data Type:** `FLOAT`

---

### MTA_TAX

**Meaning:** The MTA tax amount associated with the trip.
**Raw Data Type:** `FLOAT`
**Final Data Type:** `FLOAT`

---

### TIP_AMOUNT

**Meaning:** The tip amount recorded for the trip. Credit-card tips are automatically recorded, while cash tips are not included.
**Raw Data Type:** `FLOAT`
**Final Data Type:** `FLOAT`

---

### TOLLS_AMOUNT

**Meaning:** The total amount of tolls paid during the trip.
**Raw Data Type:** `FLOAT`
**Final Data Type:** `FLOAT`

---

### IMPROVEMENT_SURCHARGE

**Meaning:** The improvement surcharge charged on the trip.
**Raw Data Type:** `FLOAT`
**Final Data Type:** `FLOAT`

---

### TOTAL_AMOUNT

**Meaning:** The total amount charged to the passenger, excluding cash tips.
**Raw Data Type:** `FLOAT`
**Final Data Type:** `FLOAT`

---

### CONGESTION_SURCHARGE

**Meaning:** The congestion surcharge applied to the trip when applicable.
**Raw Data Type:** `FLOAT`
**Final Data Type:** `FLOAT`

---

### AIRPORT_FEE

**Meaning:** The airport-related fee charged when applicable.
**Raw Data Type:** `FLOAT`
**Final Data Type:** `FLOAT`

---

### CBD_CONGESTION_FEE

**Meaning:** The congestion fee associated with the Central Business District congestion charge when applicable.
**Raw Data Type:** `FLOAT`
**Final Data Type:** `FLOAT`

---

## Data Type Change Summary

Only the two timestamp columns had their data type changed during cleaning:

| Column | Before | After |
| `TPEP_PICKUP_DATETIME` | `NUMBER` | `TIMESTAMP_NTZ` |
| `TPEP_DROPOFF_DATETIME` | `NUMBER` | `TIMESTAMP_NTZ` |

All other columns retained their original data types.

The raw table was kept unchanged. The cleaned table contains the same 20 columns with the timestamp conversion applied.