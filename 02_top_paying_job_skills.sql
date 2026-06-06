-- SELECT TABLES
SELECT * FROM job_postings_fact;
SELECT * FROM company_dim;
SELECT * FROM skills_job_dim;
SELECT * FROM skills_dim;

/*
Question: What skills are required for the top-paying remote Data Analyst jobs?
- Identify the top 10 highest-paying remote Data Analyst positions.
- Determine the specific skills associated with each of these roles.
- Include the job title, company name, salary, and required skills.
- Why? To understand which technical and analytical skills are most valued in high-paying Data Analyst roles and help job seekers focus on developing skills that align with premium compensation opportunities.
*/

SELECT '=== TOP PAYING JOB SKILLS ===' AS info_message;

WITH top_paying_jobs AS
(SELECT TOP 10
	jpf.job_id,
	jpf.job_title,
	ROUND(
	jpf.salary_year_avg, 0) AS salary_year_avg,
	cd.name AS company_name
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
	jpf.salary_year_avg DESC)

SELECT
	tpj.*,
	sd.skills
FROM
	top_paying_jobs AS tpj
INNER JOIN
	skills_job_dim AS sjd
ON
	tpj.job_id = sjd.job_id
INNER JOIN
	skills_dim AS sd
ON
	sjd.skill_id = sd.skill_id
ORDER BY
	tpj.salary_year_avg DESC;

/*
BREAKDOWN
1. SQL is the most in-demand skill, appearing in 8 of the top 10 highest-paying roles, making it a core requirement for Data Analysts.
2. Python follows closely with 7 occurrences, highlighting its importance for data analysis, automation, and advanced analytics.
3. R appears in 6 roles, reflecting demand for statistical and research-oriented analysis.
4. Excel remains highly relevant, featuring in 5 positions, demonstrating its continued importance in business analytics.
5. SAS and Tableau each appear 4 times, indicating strong demand for statistical analysis and data visualization skills.
6. Skills such as Oracle, Windows, and spreadsheet tools appear less frequently and serve as complementary rather than essential requirements.

TAKEAWAY
The highest-paying remote Data Analyst roles consistently require proficiency in SQL, Python, and R, making them the most valuable skills for maximizing earning potential. 
Employers also value data visualization (Tableau) and traditional analytics tools (Excel, SAS), emphasizing the need to both analyze data and communicate insights effectively.
*/