-- SELECT TABLES
SELECT * FROM job_postings_fact;
SELECT * FROM company_dim;
SELECT * FROM skills_job_dim;
SELECT * FROM skills_dim;

/*
Question: What are the top-paying remote Data Analyst jobs?
- Identify the top 10 highest-paying remote Data Analyst roles
- Exclude job postings without salary information
- Include company names associated with each role

- Why? To help Data Analysts understand the upper end of the salary market and identify employers offering premium compensation for remote positions.
*/

SELECT '=== TOP PAYING JOBS ===' AS info_message;

SELECT TOP 10
	jpf.job_id,
	jpf.job_title,
	jpf.job_schedule_type,
	ROUND(
	jpf.salary_year_avg, 0) AS salary_year_avg,
	jpf.job_posted_date,
	cd.name AS company_name
	--jpf.job_location,
FROM
	job_postings_fact AS jpf
LEFT JOIN
	company_dim AS cd
ON
	jpf.company_id = cd.company_id
WHERE
	jpf.job_location LIKE 'Anywhere'
AND
	jpf.job_title_short LIKE 'Data Analyst'
AND
	jpf.salary_year_avg IS NOT NULL
ORDER BY
	jpf.salary_year_avg DESC;

/*
BREAKDOWN:
1. Research Data Analyst at Calbright College is the highest-paying role at $99,747.
2. Specialized analytical positions such as Legal Project Management Data Analyst, Earth Observation Data Analyst, and Healthcare Analytics Data Analyst command premium salaries.
3. Multiple roles are offered through recruiting firms such as Get It Recruit, suggesting strong demand for experienced remote analysts across industries.
4. Healthcare, legal, research, and quantitative finance domains appear prominently among the highest-paying opportunities.
5. The small salary gap between the highest and lowest-ranked roles (~$2,250) indicates that top remote Data Analyst positions are competitively compensated.

TAKEAWAY 
Organizations are willing to pay a premium for Data Analysts with domain expertise (Healthcare, Legal, Finance, Research) and specialized technical skills (SQL Analytics, Data Conversion, Quantitative Analysis), even in fully remote settings.
*/
