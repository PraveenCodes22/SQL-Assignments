
insert into country_pollution(Country, Temperature, CO2_Emissions, Date)
values	('USA', 25.3, 5000, 2020),
	('India', 30.5, 3000, 2020),
	('Brazil', 28.1, 2000, 2020),
	('China', 24.0, 7000, 2020),
	('Russia', 18.5, 4000, 2020),
	('Canada', 10.0, 1500, 2015),
	('Australia', 22.2, 2500, 2015),
	('Germany', 15.5, 1000, 2015),
	('UK', 14.2, 1200, 2015),
	('Japan', 23.3, 3500, 2015),
	('South Africa', 35.0, 1800, 2010),
	('France', 19.7, 900, 2010),
	('Egypt', 32.0, 1500, 2010),
	('Italy', 20.8, 1100, 2010),
	('Argentina', 26.4, 2200, 2010);

select * from country_pollution;

--1. Question: Write a query to find the countries with the highest temperatures in the dataset?

select top 1 Country, Temperature
from country_pollution
order by Temperature desc;

--2. Question: Write a query to identify the countries with the lowest CO2 emissions in the dataset.

select top 1 Country, Temperature
from country_pollution
order by Temperature asc;

--3. Question: Write a query to find all temperature records above a specific value, for example, 20 degrees Celsius.

select * from
country_pollution
where Temperature > 20
order by Temperature asc;

--4. Question: Write a query to list all countries with CO2 emissions data available for the year 2020.

select Country, CO2_Emissions 
from country_pollution
where Date = 2020;

--5. Question: Write a query to count the total number of temperature records in the dataset.

select count(*) as Total_Temperature_Records
from country_pollution
where Temperature is not null;

--6. Question: Write a query to identify any countries with missing temperature data for a specific year, for example, 2015.

select Country
from country_pollution
where Date = 2015 and Temperature is null

--7. Question: Write a query to find the average temperature for each year in the dataset.

select date, avg(Temperature) as Avg_Temperature
from country_pollution
group by date;


--8. Question: Write a query to calculate the total CO2 emissions for all countries in the dataset.
select sum(CO2_Emissions) as Total_CO2_Emissions
from country_pollution;

--9. Question: Write a query to sort the temperature data in descending order based on the temperature values.

select Country, Temperature
from country_pollution
order by Temperature desc;


with cte as (
	select *,
	ROW_NUMBER() over (partition by Country order by Date) as rn
	from country_pollution
)
delete from cte
where rn>1