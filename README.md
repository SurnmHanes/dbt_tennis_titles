# Analytics Engineering Portfolio Project

## Project Name: Djokovic Titles

### Overview
This project demonstrates an end-to-end analytics engineering workflow using **dbt and BigQuery**, transforming raw tennis match data into a structured dimensional model ready for analysis by BI tools.

The pipeline follows a modern layered architecture:<br>
**raw ingestion -> staging -> dimensions -> fact -> BI**

### Objective
Build a reliable, automated data pipeline. From raw data to analytics-ready model.

### Problem Statement
Public tennis data exists but is fragmented across different sources and therefore difficult to analyse on an individual player basis. How can raw tennis data collated from various sources by transformed into a consistent analytical model which supports player career analysis and exploration of player performance analysis over time?

### Architecture

#### Data Ingestion
- Raw dataset curated and maintained in **Google Sheets**
- Loaded into **BigQuery via linked table**
- Scheduled query run daily to create a persistent <code>raw_titles</code> table to decouple warehouse from external dependency (Google Sheets).


#### Transformation Pipeline (dbt)
The dbt project is structured into 3 layers:

1. Staging Layer
- Renames and standardises raw fields
- Ensures consistent formatting.
- Provides a clean interface to raw ingestion layer.

2. Dimension Layer
- Extracts and de-duplicates business entities
- Generates deterministic surrogate keys
- Produces reusable tables

3. Fact Layer
- One row per tournament win
- Joins to all dimension tables via foreign keys
- Table created across which metrics can be calculated
   
### Data Model

#### Fact Table
- fact_titles
- grain: 1 row per title win

#### Dimensions
- dim_location
- dim_tournament
- dim_surface
- dim_opponent
- dim_date

### Tech Stack

- BigQuery (data warehouse)
- dbt (data transformation)
- SQL (analytics logic)
- GIT + Visual Studio code (development environment)
- Google Sheets (data entry / source system)
- Power BI (visualisation layer)

### Data Quality & Testing
Implemented via dbt <code>sources.yml</code>

- <code>not_null</code> constraints on source identifiers (Title ID, Date)
- <code>Unique</code> tests on source identifiers
- <code>accepted_values</code> tests on categorical fields (surface, ATP level)

### Key Engineering Decisions

1. Use of dbt for modular transformations.
2. Separation of ingestion into warehouse (currently manual as reasonably static dataset) from external table.
3. Separation of staging, dimensions and fact layers.
4. Use of deterministic surrogate keys (<code>farm_fingerprint</code>).
5. Avoidance of volatile keys (<code>row_number</code>) for dimension table stability.
6. Star schema design for analytical simplicity.

### Future Improvements

- Add incremental models for large-scale scenarios
- Introduce data freshness tests on ingestion layer
- Extend model to multi-player dataset
- Add metrics layer for reusable KPIs
