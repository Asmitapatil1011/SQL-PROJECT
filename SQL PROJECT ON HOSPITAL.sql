SELECT * FROM project_hospital.projectsql;
use project_hospital;
/*HOW MANY UNIQUE MEDICAL CONDITION ARE PRESENT IN THE DATASET*/
Select count(distinct Medical_Condition) 
from projectsql;

/* what is average age of patients in dataset*/
select avg(Age) 
from projectsql;

/* count of group of age*/
select Age,count(*) 
 from projectsql group by Age;
 
/*Which blood type appers most frequently in the dataset*/
select  Blood_Type , count(*) 
from projectsql group by Blood_Type 
order by count(*)  desc limit 1;

/*what is maximum hospital for a patient */
select max(hospital)
 from projectsql;
 
/* How many patients were admitted to each hospital*/
select hospital,count(*)
 from projectsql group by hospital 
 order by count(*) desc; 
 
/*what is the distribution of room numbers for admitted patients*/
select Room_Number,count(*) 
from  projectsql 
 group by Room_Number;
 
/* How many patients have a specific medical codition diabetes */
select count(*) 
from projectsql
 where Medical_Condition = "Diabetes";
 
/* What are different admission types and their counts*/
select  Admission_Type,count(*)
 from projectsql group by Admission_Type 
 order by count(*) desc; 
 
/* How many records are there in database*/
select * 
from projectsql;

/*What are distinct blood type in dataset*/
select distinct Blood_Type
 from projectsql;
 
/* How many patients fall into different age group*/
SELECT
    CASE
        WHEN Age BETWEEN 0 AND 18 THEN '0-18'
        WHEN Age BETWEEN 19 AND 35 THEN '19-35'
        WHEN Age BETWEEN 36 AND 60 THEN '36-60'
        WHEN Age > 60 THEN '61+'
    END AS Age_Group,
    COUNT(*) AS Patients_Count
FROM projectsql
GROUP BY Age_Group;

/*What are the top 5 most prescribed medications in the dataset*/
select Medication
FROM projectsql group by Medication
 order by count(*) desc limit 5;
 
/*What is the average age for male and female patinents seprately */
select Gender ,
 avg(Age) 
 as Average_age 
FROM projectsql 
GROUP BY Gender;

/*what is total billing amount for all patients*/
select sum(Billing_Amount) as total_Billing
from  projectsql;

/*What is average Billing amount for Insurance provider*/
select "Insurance Provider" , 
avg(Billing_Amount) 
as Average_Billing_Amount 
from  projectsql 
group by "Insurance Provider"; 

/*How many patients are addimitted to each hospital*/
select Hospital ,
 count(*) as Admission_count
 from  projectsql
 group by Hospital;
 
/*What are the top 5 most Name Hospital in the dataset*/
select Name, count(Hospital)
 as Hospital from  projectsql 
 group by  Name
 order by count(*) 
 desc limit 5;
 
/*How has the number of admission changed over each month for the past year*/
SELECT 
    YEAR(Date_of_Admission) AS Admission_Year,
    MONTH(Date_of_Admission) AS Admission_Month,
    COUNT(*) AS Admissions_Count
FROM projectsql
GROUP BY Admission_Year, Admission_Month
ORDER BY Admission_Year, Admission_Month;

/* Which insurance provider has the highest number of patients?*/
SELECT "Insurance Provider",
COUNT(*) AS Patients_Count 
FROM  projectsql GROUP BY "Insurance Provider "
ORDER BY Patients_Count DESC LIMIT 1;

/*What is the average room number for each hospital?*/
SELECT Hospital, AVG(Room_Number) 
AS Average_Room_Number FROM 
 projectsql GROUP BY Hospital;
 
 /*Find null value present in the column Date_of_Admission*/
select * from projectsql 
where  Date_of_Admission is  null;

/*Add a column*/
alter table projectsql add column Death_patients int;

/* fill up the values*/
UPDATE projectsql 
SET  Death_patients = 0
WHERE Death_patients IS NULL
LIMIT 1000;






 