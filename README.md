# COVID-19 MySQL Data Exploration and Tableau Dashboard

## Project Overview

This project explores global COVID-19 data using MySQL and presents the results in an interactive Tableau dashboard. The project covers the complete workflow: setting up the database, importing and preparing the source data, conducting exploratory analysis with SQL, preparing summarized tables for Tableau, and building an interactive visualization. The analysis examines COVID-19 cases, deaths, infection rates, and vaccination progress across countries and continents.

## Tableau Dashboard

https://public.tableau.com/app/profile/cristina.mcm/viz/CovidDashBoard_17869347611880/Dashboard1

<img width="1670" height="1116" alt="Screenshot 2026-08-19 200048" src="https://github.com/user-attachments/assets/d821499b-8b5b-4cc0-af69-c245adf13ddf" />

## Repository Contents

- [data](data/)
  - [covid_deaths.csv](data/covid_deaths.csv) - cases, deaths, population, and location information
  - [covid_vaccinations.csv](data/covid_vaccinations.csv) - vaccination and related public-health information
  - [covid_tableau_data.xlsx](data/covid_tableau_data.xlsx) - the results of the queries from tableau_queries.sql
- [database_setup.sql](database_setup.sql)
- [data_exploration.sql](data_exploration.sql)
- [tableau_queries.sql](tableau_queries.sql)

## Dataset

This project uses public global COVID-19 data from Our World in Data. The original data is provided in separate deaths and vaccinations files, while [covid_tableau_data.xlsx](data/covid_tableau_data.xlsx) contains the query results prepared for Tableau.

## Database Setup and Data Import

The [database_setup.sql](database_setup.sql) script:

- Creates the MySQL database and source tables
- Defines the required data types
- Imports the CSV files using `LOAD DATA LOCAL INFILE`
- Converts imported dates using `STR_TO_DATE()`
- Validates the imported data

## SQL Data Exploration

The [data_exploration.sql](data_exploration.sql) script examines:

- COVID-19 cases, deaths, and death percentages
- Infection counts and population infection rates
- Countries and continents with the highest case and death counts
- Global case and death totals
- Vaccination progress by country
- Cumulative vaccinations using a window function

## Tableau Data Preparation

The [tableau_queries.sql](tableau_queries.sql) script generates the summarized results exported to [covid_tableau_data.xlsx](data/covid_tableau_data.xlsx) for use in Tableau.

## Acknowledgment

This guided portfolio project was based on Alex The Analyst’s SQL and Tableau portfolio project tutorials. The original SQL Server workflow was adapted for MySQL Workbench, including changes to database setup, data import, date conversion, temporary-table handling, and query syntax.
