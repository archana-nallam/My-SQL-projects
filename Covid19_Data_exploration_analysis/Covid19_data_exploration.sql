/*
Covid 19 Data Exploration 
Skills used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types
*/

select * from myportfolio_project.[dbo].[covid_deaths]
order by 3,4



Select *
From myportfolio_project.[dbo].[covid_deaths]
Where continent is not null 
order by 3,4



Select Location, date, total_cases, new_cases, total_deaths, population
From myportfolio_project.[dbo].[covid_deaths]
Where continent is not null 
order by 1,2


/* getting total count of new cases and total deaths*/
select Location, count(total_cases) as Total_cases, count(new_cases) as New_cases,count(total_deaths) as Total_deaths
From myportfolio_project.[dbo].[covid_deaths]
group by Location
order by Location asc


/* getting percentage of total deaths*/
select Location,Total_cases,Total_deaths,(total_deaths/Total_cases)*100 as Death_percentage
From myportfolio_project.[dbo].[covid_deaths]



/* getting percentage of total deaths for a particular location*/
select Location,Total_cases,Total_deaths,(total_deaths/Total_cases)*100 as Death_percentage
From myportfolio_project.[dbo].[covid_deaths]
where location = 'Afghanistan'



select count(*) 
From myportfolio_project.[dbo].[covid_deaths]
where location = 'Afghanistan'



select Location,date,Total_cases,Total_deaths,(total_deaths/Total_cases)*100 as Death_percentage
From myportfolio_project.[dbo].[covid_deaths]
where location like '%India%'
order by date desc



/* getting percentage of total cases over the population for a particular location*/
select Location,date,population,Total_cases,(total_cases/population)*100 as Percentage_affected
From myportfolio_project.[dbo].[covid_deaths]
where location like '%India%'
order by date desc




select Location,date,population,Total_cases,(total_cases/population)*100 as Percentage_affected
From myportfolio_project.[dbo].[covid_deaths]
--where location like '%India%'
order by date desc



select Location,date,population,Total_cases,(total_cases/population)*100 as Percentage_affected
From myportfolio_project.[dbo].[covid_deaths]
where date='2022-10-12'



select Location,date,population,Total_cases,(total_cases/population)*100 as Percentage_affected, year(date) as Year
From myportfolio_project.[dbo].[covid_deaths]
where YEAR(date)='2020'




/* Looking at countries with highest infection rate*/
Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From myportfolio_project.[dbo].[covid_deaths]
Group by Location, Population
order by Location 



Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From myportfolio_project.[dbo].[covid_deaths]
Group by Location, Population
order by PercentPopulationInfected desc 



/* Look for data with continent as Null */
select * from [dbo].[covid_deaths]
where continent is not null



/* Looking at countries with highest death rate and death percentage*/
Select continent, Location, Population, MAX(cast(total_deaths as int)) as Highest_death_count,  Max((total_deaths/population))*100 as Death_percentage
From myportfolio_project.[dbo].[covid_deaths]
where continent is not null
Group by continent,Location, Population
order by continent



/* Looking at countries with highest death rate by continent*/
Select continent, MAX(cast(total_deaths as int)) as Highest_death_count
From myportfolio_project.[dbo].[covid_deaths]
where continent is not null
Group by continent
order by Highest_death_count desc




/* Looking at countries with highest death rate by location*/
Select continent,location, MAX(cast(total_deaths as int)) as Highest_death_count
From myportfolio_project.[dbo].[covid_deaths]
where continent is not null
Group by continent,location
order by Highest_death_count desc



Select location, MAX(cast(total_deaths as int)) as Highest_death_count
From myportfolio_project.[dbo].[covid_deaths]
where continent is null
Group by location
order by Highest_death_count desc



-- GLOBAL NUMBERS

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From myportfolio_project.[dbo].[covid_deaths]
where continent is not null 
order by 1,2


-- Year wise cases and death rate

Select year(date),SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From myportfolio_project.[dbo].[covid_deaths]
where continent is not null 
group by year(date)
order by 1,2


/* Joining both tables*/

select * from
[dbo].[covid_deaths] as d,
[dbo].[covid_vaccinations] as v
where d.date=v.date and d.location=v.location

--Other way to write the same query

select * from
[dbo].[covid_deaths] as d join
[dbo].[covid_vaccinations] as v
on 
d.date=v.date 
and 
d.location=v.location


/* Total population and total vaccinations */
select d.continent,d.location, d.population,d.date, v.total_vaccinations,v.new_vaccinations from
[dbo].[covid_deaths] as d join
[dbo].[covid_vaccinations] as v
on 
d.date=v.date 
and 
d.location=v.location
where d.continent is not null
order by 1,2,3



select d.continent, sum(d.population) as population,year(d.date) as Year, sum(try_cast(v.total_vaccinations as bigint)) as Total_vaccinations from
[dbo].[covid_deaths] as d join
[dbo].[covid_vaccinations] as v
on 
d.date=v.date 
and 
d.location=v.location
where d.continent is not null
group by year(d.date),d.continent


/*Using case statement to check if total vaccinations is more than the total population value*/
select d.continent, sum(d.population) as population,
year(d.date) as Year, 
sum(try_cast(v.total_vaccinations as bigint)) as Total_vaccinations, 
case when sum(try_cast(v.total_vaccinations as bigint))> sum(d.population) then 'Yes' else 'No' end as [NewColumn],
from
[dbo].[covid_deaths] as d join
[dbo].[covid_vaccinations] as v
on 
d.date=v.date 
and 
d.location=v.location
where d.continent is not null
group by year(d.date),d.continent



--Using partition
select d.continent,d.location, d.population,d.date, v.new_vaccinations,
sum(try_cast(v.new_vaccinations as bigint)) over (partition by d.location order by d.location,d.date) as rolling_vaccination_ct
from
[dbo].[covid_deaths] as d join
[dbo].[covid_vaccinations] as v
on 
d.date=v.date 
and 
d.location=v.location
where d.continent is not null
and d.continent='Europe'
order by 2,3


/* Using CTE*/
with PopvsVac (continent, location, population,date, new_vaccinations, rolling_vaccination_ct)
as
(
select d.continent,d.location, d.population,d.date, v.new_vaccinations,
sum(try_cast(v.new_vaccinations as bigint)) over (partition by d.location order by d.location,d.date) as rolling_vaccination_ct
from
[dbo].[covid_deaths] as d join
[dbo].[covid_vaccinations] as v
on 
d.date=v.date 
and 
d.location=v.location
where d.continent is not null
--order by 2,3
)
Select *, (rolling_vaccination_ct/Population)*100 as Percentage
From PopvsVac



-- Using Temp Table to perform Calculation on Partition By in previous query

DROP Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

Insert into #PercentPopulationVaccinated
select d.continent,d.location, d.population,convert(datetime,d.date), v.new_vaccinations,
sum(convert(int,v.new_vaccinations)) over (partition by d.location order by d.location,convert(datetime,d.date)) as rolling_vaccination_ct
from
[dbo].[covid_deaths] as d join
[dbo].[covid_vaccinations] as v
on 
convert(datetime,d.date)=convert(datetime,v.date) 
and 
d.location=v.location
where d.continent is not null


Select *, (RollingPeopleVaccinated/Population)*100
From #PercentPopulationVaccinated


--=================================
-- Using Temp Table to perform Calculation on Partition By in previous query

DROP Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

Insert into #PercentPopulationVaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From [dbo].[covid_deaths] as dea
Join [dbo].[covid_vaccinations] as vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
--order by 2,3

Select *, (RollingPeopleVaccinated/Population)*100
From #PercentPopulationVaccinated

-- Creating View to store data for later visualizations

Create View PercentPopulationVaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From [dbo].[covid_deaths] as dea
Join [dbo].[covid_vaccinations] as vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 