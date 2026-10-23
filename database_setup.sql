-- COVID-19 Data Exploration Project
-- Database: MySQL
-- Dataset: Our World in Data

-- Create project database
CREATE DATABASE covid_project;
USE covid_project;

-- Create table for COVID-19 deaths data
CREATE TABLE covid_deaths (
    iso_code VARCHAR(10),
    continent VARCHAR(50),
    location VARCHAR(100),
    date DATE,
    population DOUBLE,
    total_cases DOUBLE,
    new_cases DOUBLE,
    new_cases_smoothed DOUBLE,
    total_deaths DOUBLE,
    new_deaths DOUBLE,
    new_deaths_smoothed DOUBLE,
    total_cases_per_million DOUBLE,
    new_cases_per_million DOUBLE,
    new_cases_smoothed_per_million DOUBLE,
    total_deaths_per_million DOUBLE,
    new_deaths_per_million DOUBLE,
    new_deaths_smoothed_per_million DOUBLE,
    reproduction_rate DOUBLE,
    icu_patients DOUBLE,
    icu_patients_per_million DOUBLE,
    hosp_patients DOUBLE,
    hosp_patients_per_million DOUBLE,
    weekly_icu_admissions DOUBLE,
    weekly_icu_admissions_per_million DOUBLE,
    weekly_hosp_admissions DOUBLE,
    weekly_hosp_admissions_per_million DOUBLE
);

-- Create table for COVID-19 vaccinations data
CREATE TABLE covid_vaccinations (
    iso_code VARCHAR(10),
    continent VARCHAR(50),
    location VARCHAR(100),
    date DATE,
    new_tests DOUBLE,
    total_tests DOUBLE,
    total_tests_per_thousand DOUBLE,
    new_tests_per_thousand DOUBLE,
    new_tests_smoothed DOUBLE,
    new_tests_smoothed_per_thousand DOUBLE,
    positive_rate DOUBLE,
    tests_per_case DOUBLE,
    tests_units VARCHAR(50),
    total_vaccinations DOUBLE,
    people_vaccinated DOUBLE,
    people_fully_vaccinated DOUBLE,
    new_vaccinations DOUBLE,
    new_vaccinations_smoothed DOUBLE,
    total_vaccinations_per_hundred DOUBLE,
    people_vaccinated_per_hundred DOUBLE,
    people_fully_vaccinated_per_hundred DOUBLE,
    new_vaccinations_smoothed_per_million DOUBLE,
    stringency_index DOUBLE,
    population_density DOUBLE,
    median_age DOUBLE,
    aged_65_older DOUBLE,
    aged_70_older DOUBLE,
    gdp_per_capita DOUBLE,
    extreme_poverty DOUBLE,
    cardiovasc_death_rate DOUBLE,
    diabetes_prevalence DOUBLE,
    female_smokers DOUBLE,
    male_smokers DOUBLE,
    handwashing_facilities DOUBLE,
    hospital_beds_per_thousand DOUBLE,
    life_expectancy DOUBLE,
    human_development_index DOUBLE
);

-- Import COVID-19 deaths data from CSV.
-- NULLIF converts blank CSV fields to NULL.
-- STR_TO_DATE converts dates from M/D/YYYY to MySQL DATE format.

LOAD DATA LOCAL INFILE 'path/to/covid_deaths.csv'
INTO TABLE covid_deaths
FIELDS TERMINATED BY ','
IGNORE 1 ROWS
(
    @iso_code,
    @continent,
    @location,
    @date,
    @population,
    @total_cases,
    @new_cases,
    @new_cases_smoothed,
    @total_deaths,
    @new_deaths,
    @new_deaths_smoothed,
    @total_cases_per_million,
    @new_cases_per_million,
    @new_cases_smoothed_per_million,
    @total_deaths_per_million,
    @new_deaths_per_million,
    @new_deaths_smoothed_per_million,
    @reproduction_rate,
    @icu_patients,
    @icu_patients_per_million,
    @hosp_patients,
    @hosp_patients_per_million,
    @weekly_icu_admissions,
    @weekly_icu_admissions_per_million,
    @weekly_hosp_admissions,
    @weekly_hosp_admissions_per_million
)
SET
    iso_code = NULLIF(TRIM(@iso_code), ''),
    continent = NULLIF(TRIM(@continent), ''),
    location = NULLIF(TRIM(@location), ''),
    date = STR_TO_DATE(NULLIF(TRIM(@date), ''), '%m/%d/%Y'),
    population = NULLIF(TRIM(@population), ''),
    total_cases = NULLIF(TRIM(@total_cases), ''),
    new_cases = NULLIF(TRIM(@new_cases), ''),
    new_cases_smoothed = NULLIF(TRIM(@new_cases_smoothed), ''),
    total_deaths = NULLIF(TRIM(@total_deaths), ''),
    new_deaths = NULLIF(TRIM(@new_deaths), ''),
    new_deaths_smoothed = NULLIF(TRIM(@new_deaths_smoothed), ''),
    total_cases_per_million = NULLIF(TRIM(@total_cases_per_million), ''),
    new_cases_per_million = NULLIF(TRIM(@new_cases_per_million), ''),
    new_cases_smoothed_per_million = NULLIF(TRIM(@new_cases_smoothed_per_million), ''),
    total_deaths_per_million = NULLIF(TRIM(@total_deaths_per_million), ''),
    new_deaths_per_million = NULLIF(TRIM(@new_deaths_per_million), ''),
    new_deaths_smoothed_per_million = NULLIF(TRIM(@new_deaths_smoothed_per_million), ''),
    reproduction_rate = NULLIF(TRIM(@reproduction_rate), ''),
    icu_patients = NULLIF(TRIM(@icu_patients), ''),
    icu_patients_per_million = NULLIF(TRIM(@icu_patients_per_million), ''),
    hosp_patients = NULLIF(TRIM(@hosp_patients), ''),
    hosp_patients_per_million = NULLIF(TRIM(@hosp_patients_per_million), ''),
    weekly_icu_admissions = NULLIF(TRIM(@weekly_icu_admissions), ''),
    weekly_icu_admissions_per_million = NULLIF(TRIM(@weekly_icu_admissions_per_million), ''),
    weekly_hosp_admissions = NULLIF(TRIM(@weekly_hosp_admissions), ''),
    weekly_hosp_admissions_per_million = NULLIF(TRIM(@weekly_hosp_admissions_per_million), '');
    

-- Import COVID-19 vaccinations data from CSV.
-- NULLIF converts blank CSV fields to NULL.
-- STR_TO_DATE converts dates from M/D/YYYY to MySQL DATE format.

LOAD DATA LOCAL INFILE 'path/to/Covid_Vaccinations.csv'
INTO TABLE covid_vaccinations
FIELDS TERMINATED BY ','
IGNORE 1 ROWS
(
    @iso_code,
    @continent,
    @location,
    @date,
    @new_tests,
    @total_tests,
    @total_tests_per_thousand,
    @new_tests_per_thousand,
    @new_tests_smoothed,
    @new_tests_smoothed_per_thousand,
    @positive_rate,
    @tests_per_case,
    @tests_units,
    @total_vaccinations,
    @people_vaccinated,
    @people_fully_vaccinated,
    @new_vaccinations,
    @new_vaccinations_smoothed,
    @total_vaccinations_per_hundred,
    @people_vaccinated_per_hundred,
    @people_fully_vaccinated_per_hundred,
    @new_vaccinations_smoothed_per_million,
    @stringency_index,
    @population_density,
    @median_age,
    @aged_65_older,
    @aged_70_older,
    @gdp_per_capita,
    @extreme_poverty,
    @cardiovasc_death_rate,
    @diabetes_prevalence,
    @female_smokers,
    @male_smokers,
    @handwashing_facilities,
    @hospital_beds_per_thousand,
    @life_expectancy,
    @human_development_index
)

SET
    iso_code = NULLIF(TRIM(@iso_code), ''),
    continent = NULLIF(TRIM(@continent), ''),
    location = NULLIF(TRIM(@location), ''),
    date = STR_TO_DATE(NULLIF(TRIM(@date), ''), '%m/%d/%Y'),
    new_tests = NULLIF(TRIM(@new_tests), ''),
    total_tests = NULLIF(TRIM(@total_tests), ''),
    total_tests_per_thousand = NULLIF(TRIM(@total_tests_per_thousand), ''),
    new_tests_per_thousand = NULLIF(TRIM(@new_tests_per_thousand), ''),
    new_tests_smoothed = NULLIF(TRIM(@new_tests_smoothed), ''),
    new_tests_smoothed_per_thousand = NULLIF(TRIM(@new_tests_smoothed_per_thousand), ''),
    positive_rate = NULLIF(TRIM(@positive_rate), ''),
    tests_per_case = NULLIF(TRIM(@tests_per_case), ''),
    tests_units = NULLIF(TRIM(@tests_units), ''),
    total_vaccinations = NULLIF(TRIM(@total_vaccinations), ''),
    people_vaccinated = NULLIF(TRIM(@people_vaccinated), ''),
    people_fully_vaccinated = NULLIF(TRIM(@people_fully_vaccinated), ''),
    new_vaccinations = NULLIF(TRIM(@new_vaccinations), ''),
    new_vaccinations_smoothed = NULLIF(TRIM(@new_vaccinations_smoothed), ''),
    total_vaccinations_per_hundred = NULLIF(TRIM(@total_vaccinations_per_hundred), ''),
    people_vaccinated_per_hundred = NULLIF(TRIM(@people_vaccinated_per_hundred), ''),
    people_fully_vaccinated_per_hundred = NULLIF(TRIM(@people_fully_vaccinated_per_hundred), ''),
    new_vaccinations_smoothed_per_million = NULLIF(TRIM(@new_vaccinations_smoothed_per_million), ''),
    stringency_index = NULLIF(TRIM(@stringency_index), ''),
    population_density = NULLIF(TRIM(@population_density), ''),
    median_age = NULLIF(TRIM(@median_age), ''),
    aged_65_older = NULLIF(TRIM(@aged_65_older), ''),
    aged_70_older = NULLIF(TRIM(@aged_70_older), ''),
    gdp_per_capita = NULLIF(TRIM(@gdp_per_capita), ''),
    extreme_poverty = NULLIF(TRIM(@extreme_poverty), ''),
    cardiovasc_death_rate = NULLIF(TRIM(@cardiovasc_death_rate), ''),
    diabetes_prevalence = NULLIF(TRIM(@diabetes_prevalence), ''),
    female_smokers = NULLIF(TRIM(@female_smokers), ''),
    male_smokers = NULLIF(TRIM(@male_smokers), ''),
    handwashing_facilities = NULLIF(TRIM(@handwashing_facilities), ''),
    hospital_beds_per_thousand = NULLIF(TRIM(@hospital_beds_per_thousand), ''),
    life_expectancy = NULLIF(TRIM(@life_expectancy), ''),
    human_development_index = NULLIF(TRIM(@human_development_index), '');

-- Verify successful import

SELECT COUNT(*) FROM covid_deaths;
SELECT COUNT(*) FROM covid_vaccinations;

SELECT *
FROM covid_deaths
LIMIT 20;

SELECT *
FROM covid_vaccinations
LIMIT 20;