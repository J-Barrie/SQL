--Performing a left join on the regions and countries tables using region_id this returns 25 records
select regions.region_id, region_name, country_name
	from regions
	left join countries on regions.region_id = countries.region_id

--Using left join, write a query that returns all columns from countries table, and city, 
--postal_code and state_province from the locations table. How many records were returned in total? 28 records

select countries.country_id, country_name, region_id,
	   city, postal_code, state_province
from countries
left join locations on countries.country_id=locations.country_id

--Suppose we aim to identify departments located in different countries, 
--you need to perform a left join that returns country_name from the countries table, 
--and location_id, street_address, city and state_province from the locations table, 
--then add department_id, and department_name from departments table to the result using a right join.
select countries.country_id, country_name, region_id,
		   locations.location_id, street_address, city, state_province,
		   department_id, department_name
		   from countries
		   left join locations on countries.country_id = locations.country_id
		   right join departments on locations.location_id = departments.location_id

--Write a query that returns employee_id, first_name, last_name, email, phone_number, hire_date,
--job, department_id, and department_name for employees hired after 1997-06-25. 

select employee_id, first_name, last_name, email, phone_number, hire_date, employees.department_id, department_name
	from employees
	inner join departments on employees.department_id=departments.department_id
	where employees.hire_date >= '1997-06-25'

--Write a query using right join, to select first_name, last_name, salary from employees table,
--and all fields from the jobs table for employees with maximum salary of less than 12000. 

select first_name, last_name, salary,
	  jobs.job_id, job_title, min_salary, max_salary
	  from employees
	  right join jobs on employees.job_id = jobs.job_id
	  where jobs.max_salary < 12000

--Perform an inner join to select all columns except job_id, email, and phone_number from employees table,
--and select all columns from the dependents tables. How many records were returned? 30

select  employees.employee_id, employees.first_name, employees.last_name, hire_date, salary, manager_id, department_id,
	    dependent_id, dependents.first_name, dependents.last_name, dependents.relationship
		from employees
		inner join dependents on employees.employee_id=dependents.employee_id

--Using full join, select all columns from the jobs table, and all columns from the employees table, 
--except job_id in the latter

select employee_id, first_name, last_name, email, phone_number, hire_date, employees.job_id, salary, manager_id, department_id,
	   job_title, min_salary, max_salary
	   from employees
	   full join jobs on employees.job_id = jobs.job_id 

--Use left join to return a query that selects all columns from the regions table,
--and all columns from the countries table except region_id from the latter and excluding Asian region.

select regions.region_id, region_name, country_id, country_name
	from regions
	left join countries on regions.region_id = countries.region_id 
	where region_name!='Asia'

--Using left join, select all columns from the departments table, first_name, last_name, manager_id
--from the employees table, and then using join, include all columns from the jobs table where the 
--minimum salary is above 8000 and the job title excludes president.

Select departments.department_id, department_name, location_id, first_name, last_name, manager_id,
       jobs.job_id, job_title, min_salary, max_salary
from departments 
left join employees on departments.department_id = employees.department_id 
join jobs on employees.job_id= jobs.job_id
where jobs.min_salary>8000 and jobs.job_title != 'president'

--Create a stored procedure that select all columns from the jobs table, 
--and first_name, last_name and employee_id from employees table then order the result
--by first_name in ascending order. Hint: Use inner join.


CREATE PROCEDURE JobsEmployees   

AS     
    SELECT jobs.job_id, job_title, min_salary, max_salary, first_name, last_name, employee_id 
    FROM jobs
	inner join employees on jobs.job_id =employees.job_id
	order by first_name;
   
-- Execute Stored Procedure
exec JobsEmployees