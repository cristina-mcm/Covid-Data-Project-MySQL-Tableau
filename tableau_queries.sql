-- Queries used for Tableau Project

use covid_project;

-- 1

Select sum(new_cases) as total_cases, sum(new_deaths) as total_deaths,
(sum(new_deaths)/sum(new_cases))*100 as new_death_percentage
from covid_deaths
where continent is not null
order by 1,2;

-- 2

Select location, SUM(new_deaths) as TotalDeathCount
-- Where location like '%states%'
from covid_deaths
where continent is null 
and location not in ('World', 'European Union', 'International')
group by location
order by TotalDeathCount desc;

-- 3

Select Location, population, max(total_cases) as highest_infection_count, max((total_cases/population))*100 as percent_population_infected
from covid_deaths
-- where location like '%states%'
where continent is not null
group by location, population
order by percent_population_infected desc;

-- 4

Select Location, population, date, max(total_cases) as highest_infection_count, max((total_cases/population))*100 as percent_population_infected
from covid_deaths
-- where location like '%states%'
group by location, population, date
order by percent_population_infected desc;

-- 5

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
