use covid_project;

-- Select Data that I will be using

Select Location, date, total_cases, new_cases, total_deaths, population
from covid_deaths
where continent is not null
order by 1,2; -- order by location, then date

-- Looking at Total Cases vs Total Deaths (death rate)
-- Shows the likelihood of dying if you contract Covid-19 in your country (for example  United States)
Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as death_percentage
from covid_deaths
where location like '%states%' -- see only United States
and continent is not null
order by 1,2;

-- Looking at Total Cases vs Population
-- Shows what percentage of population got Covid-19
Select Location, date, population, total_cases, (total_cases/population)*100 as cases_percentage
from covid_deaths
where location like '%states%' -- see only United States
and continent is not null
order by 1,2;

-- Looking at countries with highest infection rate compared to population

Select Location, population, max(total_cases) as highest_infection_count, max((total_cases/population))*100 as percent_population_infected
from covid_deaths
-- where location like '%moldova%'
where continent is not null
group by location, population
order by percent_population_infected desc;

-- Looking at countries with highest death rate compared to population

Select Location, population, max(total_deaths) as total_death_count, max((total_deaths/population))*100 as percent_deaths
from covid_deaths
-- where location like '%moldova%'
where continent is not null
group by location, population
order by total_death_count desc;

-- Showing continents with the highest death rate

Select continent, max(total_deaths) as total_death_count, max((total_deaths/population))*100 as percent_deaths
from covid_deaths
-- where location like '%moldova%'
where continent is not null
group by continent
order by total_death_count desc;

-- GLOBAL NUMBERS

Select date, sum(new_cases) as total_cases, sum(new_deaths) as total_deaths,
(sum(new_deaths)/sum(new_cases))*100 as new_death_percentage
from covid_deaths
where continent is not null
group by date
order by 1,2;

Select sum(new_cases) as total_cases, sum(new_deaths) as total_deaths,
(sum(new_deaths)/sum(new_cases))*100 as new_death_percentage
from covid_deaths
where continent is not null
order by 1,2;

-- Looking at Total Population vs Vaccinations

select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(vac.new_vaccinations) over (partition by dea.location order by dea.location, dea.date) as rolling_people_vaccinated
-- (rolling_people_vaccinated/dea.population) *100
from covid_deaths dea
join covid_vaccinations vac
	on dea.location = vac.location
    and dea.date = vac.date
where dea.continent is not null
order by 2,3;

-- USE CTE

with pop_vs_vac (continent, location, date, population, new_vaccinations, rolling_people_vaccinated)
as
(
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(vac.new_vaccinations) over (partition by dea.location order by dea.location, dea.date) as rolling_people_vaccinated
from covid_deaths dea
join covid_vaccinations vac
	on dea.location = vac.location
    and dea.date = vac.date
where dea.continent is not null
)

select *, (rolling_people_vaccinated/population) *100
from pop_vs_vac;

-- TEMP TABLE
drop temporary table if exists percent_population_vaccinated;

create temporary table percent_population_vaccinated
(
continent VARCHAR(100),
location VARCHAR(100),
date DATE,
population DOUBLE,
new_vaccinations DOUBLE,
rolling_people_vaccinated DOUBLE
);

Insert into percent_population_vaccinated
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(vac.new_vaccinations) over (partition by dea.location order by dea.location, dea.date) as rolling_people_vaccinated
from covid_deaths dea
join covid_vaccinations vac
	on dea.location = vac.location
    and dea.date = vac.date
where dea.continent is not null;

select *, (rolling_people_vaccinated/population) *100
from percent_population_vaccinated;

-- Creating View to store data for later visualizations

Create view percent_population_vaccinated as
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(vac.new_vaccinations) over (partition by dea.location order by dea.location, dea.date) as rolling_people_vaccinated
from covid_deaths dea
join covid_vaccinations vac
	on dea.location = vac.location
    and dea.date = vac.date
where dea.continent is not null;

SELECT * FROM covid_project.percent_population_vaccinated;