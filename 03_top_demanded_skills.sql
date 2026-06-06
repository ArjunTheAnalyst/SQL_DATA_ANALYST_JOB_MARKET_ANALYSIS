-- SELECT TABLES
SELECT * FROM job_postings_fact;
SELECT * FROM company_dim;
SELECT * FROM skills_job_dim;
SELECT * FROM skills_dim;

/*
Question: What are the most in-demand skills for remote Data Analyst roles?
- Analyze all Data Analyst job postings.
- Identify the skills most frequently requested by employers.
- Rank skills based on the number of job postings requiring them.
- Focus on overall market demand rather than salary-specific roles.
- Why? To identify the skills that employers seek most often, helping aspiring and current Data Analysts prioritize skill development and align their expertise with market needs.
*/

SELECT '=== TOP DEMANDED SKILLS ===' AS info_message;

SELECT TOP 5
	--sjd.skill_id,
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
	jpf.job_title_short LIKE 'Data Analyst'
AND
	jpf.job_work_from_home = 1
GROUP BY
	--sjd.skill_id,
	sd.skills
ORDER BY
	demand_count DESC;

/*
BREAKDOWN
1. SQL is the most in-demand skill, appearing in over 7,000 remote Data Analyst job postings.
2. Excel and Python remain core analytical tools, ranking second and third in demand.
3. Tableau and Power BI highlight the importance of data visualization and dashboarding skills.
4. The results show strong demand for a mix of data querying, analysis, and reporting capabilities.

TAKEAWAY
SQL, Excel, Python, Tableau, and Power BI form the core skill set for remote Data Analysts. 
Professionals proficient in these tools are well-positioned to meet the most common employer requirements in the job market.
*/