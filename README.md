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

**Key Finding:**
Specialized roles in Healthcare, Legal, Research, and Quantitative Analysis command premium salaries, with top salaries approaching $100K annually.
