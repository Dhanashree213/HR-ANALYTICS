-- 1st KPI - Average Attrition rate for all Departments


select Department, CONCAT(ROUND((sum(CASE WHEN Attrition ='Yes' Then 1 else 0 end) / Count(EmployeeNumber))*100,2),'%') as "Average Attrition Rate"
from mergedfinal 
group by Department;


-- 2ND KPI -  Average Hourly rate of Male Research Scientist


SELECT Gender, JobRole,AVG(HOURLYRATE) AS "Average Hourly Rate Of Male Research Scientist" 
FROM mergedfinal 
WHERE GENDER = "MALE" AND JOBROLE="RESEARCH SCIENTIST";


-- 3RD KPI - Attrition rate Vs Monthly income stats


SELECT floor(monthlyincome/10000)*10000 as  "Monthly income" ,CONCAT(round(SUM(CASE WHEN Attrition ='Yes' Then 1 else 0 end) *100.00/Count(EmployeeNumber),2),'%') 
as "Attrition Rate"
FROM mergedfinal 
group by 1
order by 1;


-- 4th kpi - Average working years for each Department


select   Department ,round(avg( YearsInCurrentRole),2) AS "Average Working Years"
from mergedfinal 
group by department 
order by 1;


-- 5th kpi - Job Role Vs Work life balance


 select Department,
 case
    when worklifebalance=1 then 'excellent'
    when worklifebalance=2 then 'good'
    when worklifebalance=3 then 'average'
    when worklifebalance=4 then 'poor'
    else 'null'
 end as worklife_balance ,count(EmployeeNumber)
 from mergedfinal
 group by 1,2
order by 1;


-- 6th kpi - Attrition rate Vs Year since last promotion relation


 select distinct(YearsSinceLastPromotion), sum(case attrition when 'yes' then 1 else 0 end)/count(employeenumber)*100 as atr_rate 
 from mergedfinal
 group by YearsSinceLastPromotion
 order by YearsSinceLastPromotion;
