# Analytics Engineering Portfolio Project

## Project Name: Djokovic Titles

### Overview
This project demonstrates an end-to-end analytics engineering workflow, transforming raw event-level data into a structured dimensional model using dbt and BigQuery and exposing it for analysis in BI tools. 

### Objective
Build a reliable, automated data pipeline. From raw data to analytics-ready model.

### Problem Statement
Public Tennis data exists but is fragmented across different sources and therefore difficult to analyse on a player basis. How can raw tennis data collated from various sources by transformed into a consistent analytical model which supports player career analysis and exploration of player performance analysis over time.

### Architecture
Built in Google Sheets a curated dataset of all 101 professional titles won by Novak Djokovic (so far!). 

- Ingested this Google Sheets into BigQuery as a linked source.
- Then created a scheduled query which runs daily to create a raw table in BigQuery from this source (thereby keeping the external table isolated from the warehouse).
- Then built a staging layer using dbt.
- And dimension models added after this.
- And finally the fact table. 
- The dimensions and facts then made available to Power BI.

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
- GIT + Visual Studio code (development environment)
- Google Sheets (data entry / source system)
- Power BI (visualisation layer)

### Transformation Layers

#### Staging Layer
- Rename columns
- Standardises formatting 
- Acts as clean interface to raw data

#### Dimension Layer
- Isolates and de-duplicates business entities
- Generates primary keys for each record
- Creates reusable lookup tables

#### Fact Layer
- Analytical table
- Joins to all dimensions via keys
- Represents title-level grain

### Data Quality & Testing

- Not null constraints on source identifiers (Title ID, Date)
- Uniqueness tests on source identifiers
- Accepted values tests for categorical fields (surface, ATP level)

### Key Engineering Decisions

1. Use of dbt for modular transformations.
2. Separation of ingestion into warehouse (currently manual as reasonably static dataset) from external table.
3. Separation of staging, dimensions and fact layers.
4. Use of deterministic surrogate keys (so farm_fingerprint rather than row_number).
