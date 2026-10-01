
/* Top 10 Overall Skills for the job title 'Business Analyst' */
SELECT 
    jp.job_title_short,
    s.skills,
    s.type,
    Count(*) as Total_Job_Postings
FROM job_postings_fact jp
LEFT JOIN skills_job_dim sj ON jp.job_id = sj.job_id
LEFT JOIN skills_dim s ON sj.skill_id = s.skill_id
WHERE jp.salary_year_avg IS NOT NULL AND jp.job_title_short ='Business Analyst' AND s.skills IS NOT NULL
Group by s.skills, s.type, jp.job_title_short
ORDER by Total_Job_Postings DESC
Limit 10;

/* Top 10 useless Skills for the job title 'Business Analyst' */
SELECT 
    jp.job_title_short,
    s.skills,
    s.type,
    Count(*) as Total_Job_Postings
FROM job_postings_fact jp
LEFT JOIN skills_job_dim sj ON jp.job_id = sj.job_id
LEFT JOIN skills_dim s ON sj.skill_id = s.skill_id
WHERE jp.salary_year_avg IS NOT NULL AND jp.job_title_short ='Business Analyst' AND s.skills IS NOT NULL
Group by s.skills, s.type, jp.job_title_short
ORDER by Total_Job_Postings ASC
Limit 10;

