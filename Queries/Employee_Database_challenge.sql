--  Deliverable 1

select e.emp_no , e.first_name , e.last_name , t.title , t.from_date , t.to_date 
into  retirement_titles 
from employees e 
join titles t 
on e.emp_no = t.emp_no 
where e.birth_date between '1952-01-01' and '1955-12-31';

drop table  retirement_titles ;
select * from retirement_titles;

SELECT DISTINCT ON (rt.emp_no)
rt.emp_no ,
rt.first_name,
rt.last_name,
rt.title 
INTO unique_titles 
FROM retirement_titles rt 
WHERE rt.to_date ='9999-01-01'
ORDER BY rt.emp_no , rt.to_date  DESC;

select * from unique_titles ;
drop table unique_titles;

select count(ut.title), ut.title 
into retiring_titles
from unique_titles ut
group by ut.title 
order by count(ut.title) desc; 


--Deliverable 2


select
	distinct on(e.emp_no)
	e.emp_no ,
	e.first_name ,
	e.last_name ,
	e.birth_date ,
	de.from_date ,
	de.to_date ,
	t.title 
into mentorship_eligibilty
from employees e 
inner join dept_emp de  
on (e.emp_no = de.emp_no)
left join titles t 
on e.emp_no = t.emp_no 
where (de.to_date='9999-01-01') and (e.birth_date between '1965-01-01' and '1965-12-31')
order by e.emp_no 