
/* Top Paying Skills for the job title 'Business Analyst' */

SELECT 
    jp.job_id,
    jp.job_title_short,
    s.skills,
    s.type,
    jp.salary_year_avg
FROM job_postings_fact jp
LEFT JOIN skills_job_dim sj ON jp.job_id = sj.job_id
LEFT JOIN skills_dim s ON sj.skill_id = s.skill_id
WHERE jp.salary_year_avg IS NOT NULL AND jp.job_title_short ='Business Analyst' AND s.skills IS NOT NULL
ORDER by jp.salary_year_avg DESC
Limit 10;

/* Lowest Paying Skills for the job title 'Business Analyst' */

SELECT 
    jp.job_id,
    jp.job_title_short,
    s.skills,
    s.type,
    jp.salary_year_avg
FROM job_postings_fact jp
LEFT JOIN skills_job_dim sj ON jp.job_id = sj.job_id
LEFT JOIN skills_dim s ON sj.skill_id = s.skill_id
WHERE jp.salary_year_avg IS NOT NULL AND jp.job_title_short ='Business Analyst' AND s.skills IS NOT NULL
ORDER by jp.salary_year_avg ASC
Limit 10;

