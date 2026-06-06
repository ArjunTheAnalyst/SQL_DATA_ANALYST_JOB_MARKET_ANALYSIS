-- SELECT TABLES
SELECT * FROM job_postings_fact;
SELECT * FROM company_dim;
SELECT * FROM skills_job_dim;
SELECT * FROM skills_dim;

/*
Question: Which skills offer the best combination of demand and salary for Data Analysts?
- Identify skills that are both highly demanded and associated with high average salaries.
- Analyze remote Data Analyst positions with available salary information.
- Compare skill demand against average salary to determine the most valuable skills.
- Why? To identify skills that provide both strong job opportunities and high earning potential, helping Data Analysts prioritize their professional development for maximum career impact.
*/
SELECT '=== OPTIMAL SKILLS ===' AS info_message;

WITH skills_demand AS
(SELECT
	sjd.skill_id,
	sd.skills,
	COUNT(sjd.skill_id) AS demand_count
FROM
	job_postings_fact AS jpf
INNER JOIN
	skills_job_dim AS sjd
ON
	jpf.job_id = sjd.job_id
INNER JOIN
	skills_dim AS sd
ON
	sjd.skill_id = sd.skill_id
WHERE
	jpf.job_work_from_home = 1
AND
	jpf.job_title_short LIKE 'Data Analyst'
AND
	jpf.salary_year_avg IS NOT NULL
GROUP BY
	sjd.skill_id,
	sd.skills),

average_salary AS
(SELECT
	sjd.skill_id,
	sd.skills,
	ROUND(AVG(CAST(jpf.salary_year_avg AS FLOAT)),0) AS avg_salary
FROM
	job_postings_fact AS jpf
INNER JOIN
	skills_job_dim AS sjd
ON
	jpf.job_id = sjd.job_id
INNER JOIN
	skills_dim AS sd
ON
	sjd.skill_id = sd.skill_id
WHERE
	jpf.job_work_from_home = 1
AND
	jpf.job_title_short LIKE 'Data Analyst'
AND
	jpf.salary_year_avg IS NOT NULL
GROUP BY
	sjd.skill_id,
	sd.skills)

SELECT TOP 25
	skills_demand.skill_id,
	skills_demand.skills,
	demand_count,
	avg_salary
FROM
	skills_demand
INNER JOIN
	average_salary
ON
	skills_demand.skill_id = average_salary.skill_id
WHERE
	demand_count > 10
ORDER BY
	avg_salary DESC,
	demand_count DESC;

/*
BREAKDOWN
1. Go is the highest-paying skill, with an average salary of $115K+.
2. Cloud platforms (Snowflake, Azure, AWS, BigQuery) dominate the rankings, reflecting strong demand for cloud-based analytics and data infrastructure expertise.
3. Data engineering technologies such as Hadoop and SSIS command premium salaries, highlighting the value of working with large-scale data systems.
4. Python (236 postings) and Tableau (230 postings) have the highest demand among all listed skills while still offering salaries near or above $100K.
5. Skills with lower demand but higher salaries often indicate niche expertise, whereas highly demanded skills provide broader job opportunities.

TAKEAWAY
The most valuable skills for aspiring Data Analysts are those that combine strong demand with competitive salaries. 
While niche technologies such as Go, Hadoop, and Snowflake offer the highest pay, Python, R, SQL-related tools, and Tableau provide the best balance of market demand and earning potential. 
Developing a foundation in analytics tools alongside cloud and data engineering technologies can significantly enhance career prospects and salary growth.
*/