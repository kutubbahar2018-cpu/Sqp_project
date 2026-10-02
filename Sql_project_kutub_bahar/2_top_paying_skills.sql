
/* Q2 Top individual highest paying job postings for the 'Business Analyst' title, and specific skills required*/

WITH top_jobs AS (
    SELECT job_id, job_title_short, salary_year_avg
    FROM job_postings_fact
    WHERE salary_year_avg IS NOT NULL
      AND job_title_short = 'Business Analyst'
    ORDER BY salary_year_avg DESC
    LIMIT 10
)
SELECT
    tj.job_id,
    tj.job_title_short,
    tj.salary_year_avg,
    s.skills,
    s.type
FROM top_jobs tj
LEFT JOIN skills_job_dim sj ON tj.job_id = sj.job_id
LEFT JOIN skills_dim s      ON sj.skill_id = s.skill_id
ORDER BY tj.salary_year_avg DESC;
