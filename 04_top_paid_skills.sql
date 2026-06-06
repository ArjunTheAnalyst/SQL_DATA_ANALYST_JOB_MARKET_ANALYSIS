-- SELECT TABLES
SELECT * FROM job_postings_fact;
SELECT * FROM company_dim;
SELECT * FROM skills_job_dim;
SELECT * FROM skills_dim;
/*
Question: What are the highest-paying skills for Data Analysts?
- Examine Remote Data Analyst job postings with available salary data.
- Determine the average salary associated with each skill.
- Rank skills by average salary.
- Why? To uncover which skills are linked to the highest compensation and guide skill development toward maximizing earning potential.
*/
SELECT '=== TOP PAID SKILLS ===' AS info_message;

SELECT TOP 25
	sjd.skill_id,
	sd.skills,
	ROUND(
	AVG(
	CAST(jpf.salary_year_avg AS FLOAT)), 0) AS average_salary
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
	sd.skills	
ORDER BY
	average_salary DESC;

/*
BREAKDOWN
1. PySpark leads the rankings with an average salary exceeding $208K, indicating strong demand for large-scale data processing skills.
2. Cloud, machine learning, and data engineering tools such as DataRobot, Jupyter, Pandas, and Elasticsearch are associated with some of the highest-paying Data Analyst roles.
3. Several collaboration and DevOps technologies, including Bitbucket and GitLab, appear among the top-paying skills, reflecting the increasing integration of analytics with software development workflows.
4. The results suggest that specialized technical skills command significantly higher salaries than traditional analytics tools alone.

TAKEAWAY
The highest-paying Data Analyst roles tend to favor professionals with expertise in big data, machine learning, cloud technologies, and data engineering tools. 
Skills such as PySpark, DataRobot, Pandas, and Elasticsearch are associated with the strongest earning potential, indicating that expanding beyond traditional analytics into advanced technical domains can significantly increase salary opportunities.
*/