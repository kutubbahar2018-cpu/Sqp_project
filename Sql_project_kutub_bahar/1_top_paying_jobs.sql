
/*Question 1: What are the top 10 paying jobs for the job title 'Business Analyst'? */

/* Q1.1 Top 10 paying jobs for the job title 'Business Analyst' */

SELECT 
    jp.job_id,
    jp.job_title_short,
    jp.salary_year_avg,
    jp.job_country,
    c.name as Company_Name
FROM job_postings_fact jp
LEFT JOIN company_dim c ON jp.company_id = c.company_id
WHERE jp.salary_year_avg IS NOT NULL AND jp.job_title_short ='Business Analyst'
ORDER BY jp.salary_year_avg DESC
LIMIT 10;

/* Q1.2 Top lowest paying jobs for the job title 'Business Analyst' */
SELECT 
    jp.job_id,
    jp.job_title_short,
    jp.salary_year_avg,
    jp.job_country,
    c.name as Company_Name
FROM job_postings_fact jp
LEFT JOIN company_dim c ON jp.company_id = c.company_id
WHERE jp.salary_year_avg IS NOT NULL AND jp.job_title_short ='Business Analyst'
ORDER BY jp.salary_year_avg ASC
LIMIT 10;

/* Q1.3 Top Countries with the most jobs as per our top 10 paying jobs for the job title 'Business Analyst' */

Select 
    jobs.job_country,
    Count(*) as Total_Job_Postings
    FROM
(SELECT 
    jp.job_id,
    jp.job_title_short,
    jp.salary_year_avg,
    jp.job_country,
    c.name as Company_Name
FROM job_postings_fact jp
LEFT JOIN company_dim c ON jp.company_id = c.company_id
WHERE jp.salary_year_avg IS NOT NULL AND jp.job_title_short ='Business Analyst'
ORDER BY jp.salary_year_avg DESC
LIMIT 10) as jobs
Group by jobs.job_country
order by Total_Job_Postings DESC;

/* Q1.4 Top Countries with the most jobs as per our lowest 10 paying jobs for the job title 'Business Analyst' */
Select 
    jobs.job_country,
    Count(*) as Total_Job_Postings
    FROM
(SELECT 
    jp.job_id,
    jp.job_title_short,
    jp.salary_year_avg,
    jp.job_country,
    c.name as Company_Name
FROM job_postings_fact jp
LEFT JOIN company_dim c ON jp.company_id = c.company_id
WHERE jp.salary_year_avg IS NOT NULL AND jp.job_title_short ='Business Analyst'
ORDER BY jp.salary_year_avg ASC
LIMIT 10) as jobs
Group by jobs.job_country
order by Total_Job_Postings DESC;