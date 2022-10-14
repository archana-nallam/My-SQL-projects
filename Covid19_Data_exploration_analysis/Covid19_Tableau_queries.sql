-- GLOBAL NUMBERS

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From myportfolio_project.[dbo].[covid_deaths]
where continent is not null 
order by 1,2



Select location, sum(cast(new_deaths as int)) as TotalDeathCount
From myportfolio_project.[dbo].[covid_deaths]
where continent is null
and location not in ('World', 'European Union', 'International')
Group by location
order by TotalDeathCount desc



/* Looking at countries with highest death rate and death percentage*/
Select Location, Population, MAX(cast(total_cases as int)) as Highest_infection_count,  Max((total_cases/population))*100 as Infection_percentage
From myportfolio_project.[dbo].[covid_deaths]
where continent is not null
Group by Location, Population
order by Infection_percentage desc



Select Location, Population,date, MAX(cast(total_cases as int)) as Highest_infection_count,  Max((total_cases/population))*100 as Infection_percentage
From myportfolio_project.[dbo].[covid_deaths]
where continent is not null
Group by Location, Population,date
order by Infection_percentage desc
