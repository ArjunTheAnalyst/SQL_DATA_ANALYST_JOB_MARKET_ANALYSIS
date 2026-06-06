# 📊 Data Analyst Job Market Analysis with SQL
## Overview

This project explores the remote Data Analyst job market using SQL. By analyzing job postings, salaries, and skill requirements, the project uncovers insights into:<br>

• The highest-paying remote Data Analyst jobs<br>
• Skills required for top-paying positions<br>
• Most in-demand Data Analyst skills<br>
• Highest-paying technical skills<br>
• Skills that offer the best combination of demand and salary<br>

The objective is to provide actionable insights for aspiring and experienced Data Analysts looking to maximize their employability and earning potential.

## Dataset

This project uses a job postings dataset containing Data Analyst roles posted throughout **2023**. The dataset includes information on job titles, salaries, companies, locations, remote work availability, and required skills.

### Dataset Coverage

* Year: **2023**
* Focus: **Data Analyst job postings**
* Includes:

  * Job titles and descriptions
  * Company information
  * Salary data
  * Required skills
  * Remote work indicators

## Database Tables

| Table             | Description                                                                 |
| ----------------- | --------------------------------------------------------------------------- |
| job_postings_fact | Job posting details including salary, location, posting date, and job title |
| company_dim       | Company information                                                         |
| skills_job_dim    | Bridge table linking jobs and skills                                        |
| skills_dim        | Skill definitions                                                           |

> **Note:** All insights and conclusions in this project are based on Data Analyst job postings from **2023** and reflect market conditions during that period.

## Business Questions
**1. What are the top-paying remote Data Analyst jobs?**<br>
Identified the highest-paying remote Data Analyst roles with available salary information and included hiring company details.

**Key Finding:**<br>
Specialized roles in Healthcare, Legal, Research, and Quantitative Analysis command premium salaries, with top salaries approaching $100K annually.<br>

**2. What skills are required for the top-paying remote Data Analyst jobs?**<br>
Analyzed the skills associated with the highest-paying remote Data Analyst positions.

**Key Finding:**<br>
SQL, Python, R, Excel, SAS, and Tableau appeared most frequently among top-paying opportunities.<br>

**3. What are the most in-demand skills for remote Data Analysts?**<br>
Measured skill demand by counting occurrences across remote Data Analyst job postings.<br>

**Key Finding:**<br>
SQL, Excel, Python, Tableau, and Power BI emerged as the most requested skills by employers.<br>

**4. What are the highest-paying skills?**<br>
Calculated average salary by skill to identify technologies associated with the strongest compensation.<br>

**Key Finding:**
Big data, machine learning, cloud, and data engineering technologies significantly outperformed traditional analytics tools in average salary.<br>

**5. Which skills offer the best combination of demand and salary?**<br>
Combined salary and demand metrics to identify the most valuable skills for career growth.<br>

**Key Finding:**
Cloud technologies, data engineering tools, and programming languages provide the strongest balance of market demand and earning potential.<br>

## Key Insights
### 💰 Salary Insights
• Top remote Data Analyst salaries approached $100K annually.<br>
• Domain expertise often commanded higher compensation than generic analyst roles.<br>
• Specialized analytical positions consistently ranked among the highest-paying opportunities.<br>

### 🔥 Most In-Demand Skills
• SQL<br>
• Excel<br>
• Python<br>
• Tableau<br>
• Power BI<br>

###🚀 Highest-Value Skills
• Go<br>
• Snowflake<br>
• Azure<br>
• AWS<br>
• Hadoop<br>
• Python<br>
• Tableau<br>

These skills demonstrated either strong salary potential, strong demand, or both.

## SQL Techniques Used
• Common Table Expressions (CTEs)<br>
• Joins<br>
• Aggregate Functions<br>
• Filtering & Sorting<br>
• Data Exploration<br>
• Salary Analysis<br>
• Demand Analysis<br>

## Tools Used
• Microsoft SQL Server<br>
• SQL Server Management Studio (SSMS)<br>
• Git<br>
• GitHub

## Project Structure

```
Data-Analyst-Job-Market-Analysis
│
├── sql_queries
│   ├── 01_top_paying_jobs.sql
│   ├── 02_top_paying_job_skills.sql
│   ├── 03_top_demanded_skills.sql
│   ├── 04_top_paying_skills.sql
│   └── 05_optimal_skills.sql
│
└── README.md
```
## Conclusion
The analysis demonstrates that successful Data Analysts require a combination of technical, analytical, and business-focused skills. While SQL remains the foundational skill across the market, professionals who expand into cloud platforms, programming, data engineering, and visualization tools position themselves for greater demand and higher salaries.<br>

For Data Analysts seeking long-term career growth, developing expertise in SQL, Python, Tableau, cloud technologies, and modern data platforms offers the strongest alignment with current market trends.
