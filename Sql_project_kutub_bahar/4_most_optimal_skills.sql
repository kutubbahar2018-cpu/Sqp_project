    /* ---Most Optimal Skills for Business Analyst Job Title based on Salary and Total Job Postings */

    /* CTE to get the top 10 paying skills for Business Analyst job title and the top 10 overall skills for Business Analyst job title */
    With Top_paying_Skills as (
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
    ),
    /* CTE to get the top 10 overall skills for Business Analyst job title */
    Top_Overall_Skills as (
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
    ) 
    /* ADDITIONAL QUERY TO GET THE MOST OPTIMAL SKILLS FOR BUSINESS ANALYST JOB TITLE BASED ON SALARY AND TOTAL JOB POSTINGS */
    Select 
        tps.skills,
        tps.type,
        tps.salary_year_avg,
        tos.Total_Job_Postings
    FROM Top_paying_Skills tps
    LEFT JOIN Top_Overall_Skills tos ON tps.skills = tos.skills
    ORDER by tps.salary_year_avg DESC, tos.Total_Job_Postings DESC
    Limit 10;
    