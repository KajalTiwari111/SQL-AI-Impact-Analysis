
--ANALYSING "IMPACT OF AI ON STUDENTS" 
--SOURCE: KAGGLE DATASET
--Select * from AI_Impact;
--DATA QUALITY CHECK
--select * from AI_Impact where GPA_Baseline is null;
--select Student_ID, Count(*) from AI_Impact Group by Student_ID having Count(*)>1;

-- Data Quality Summary
-- Total Records: 1500
-- Duplicate Student_ID: 0
-- Missing Values: 0

--Select Distinct(Primary_AI_Tool) from AI_Impact;
--FINDINGS: GEMINI PRO,CLAUDE 3.5,GITHUB COPILOT,CHATGPT -4.0 , PERPLEXITY

--select Distinct(Age) from AI_Impact;
-- FINDINGS: 18, 19,20,21,22,23,24,25

--Select Max(AI_Ethics_concern) from AI_Impact;
--FINDINGS: MEDIUM

--Select Avg(Task_Frequency_Daily) from AI_Impact;
--FINDING: 5 HOUR

--Select Count(Student_ID) from AI_Impact;
--Select distinct(Major) from AI_Impact;
--NUMBER OF STUDENTS IN EACH MAJOR & POPULAR AI TOOL 
/*
select  Major, Count(student_ID) as Total_Students,
Primary_AI_Tool from AI_Impact 
group by Major, Primary_AI_Tool order by Total_Students desc;
*/
-- AI ENABLED STUDENTS IN EACH MAJOR
/*
select  Major, Count(student_ID) as Total_Students
 from AI_Impact 
group by Major order by Total_Students desc;
*/
--FINDINGS: FINE ARTS > DATA SCIENCE = BIOLOGY > BUSINESS ADMINISTRATION > SOFTWARE ENGINEERING > MODERN HISOTRY

--MOST POPULAR AI TOOL
/*
select Primary_AI_Tool, count(Student_ID) as Number_Of_students
from AI_Impact group by Primary_AI_Tool order by Number_Of_students desc; 
*/
--FINDINGS: GITHUB COPILOT > GEMINI PRO > PERPLEXITY > CLAUDE3.5 > CHATGPT-4.0

--MOST POPULAR USE CASE OF TOOLS
/*
select Main_Usage_Case, count(*)as Total_studnets from AI_Impact
group by Main_Usage_Case order by Total_studnets desc;
*/
--FINDINGS: EXAM PREP > LITERATURE REVIEW > ESSAY DREAFTING > BRAINSTORMING > CODE DEBUGGING

--POPULAR USE CASES BY MAJORS
/*
select Major, count(Major) as Students,Main_Usage_Case
from AI_Impact  group by Major,Main_Usage_Case order by Students desc;
*/
--CLUTTERED FINDINGS
--ATTEMPT 2
/*
select Major, DENSE_RANK()over(order by Major desc)as Majors_Rank
,Main_Usage_Case, count(Main_Usage_Case) as Total_Usages
from AI_Impact group by Major,Main_Usage_Case order by Total_Usages desc;
*/
--ATTEMPT 3
/*
SELECT
    Major,
   Main_Usage_Case,
    COUNT(*) AS Total_Usages,
    DENSE_RANK() OVER(
        PARTITION BY Major
        ORDER BY COUNT(*) DESC
    ) AS Rank_In_Usage_Case
FROM AI_Impact
GROUP BY Main_Usage_Case, Major
ORDER BY Major,
         Rank_In_Usage_Case;
*/
/*
FINDINGS: BIOLOGY(EXAM PREP > ESSAY DRAFTING > BRAINSTROMING) 
BUSSINESS ADMINISTRATION( ESSAY PREP >EXAM PREP > lITERATURE REVIEW)
DATA SCIENCE( EXAM PREP > BRAINSTORMING > LITERATURE REVIEW)
INE ARTS( EXAM PREP > LITERATURE REVIEW > CODE DEBUGGING)

INSIGHTS: AMONG ALL THE MAJORS EXAM PREP, LITERATURE REVIEW, ESSAY DRAGTING , BRAINSTORMING
HAVE ARE MOST POPULAR USAGES.TELLING AI IS USED MOSTLY FOR THE PURPOSE OF TEDIOUS TASK.
REPLACES THE HARD HUMAN LABOUR.
*/
-- AVERAGE TIME SAVED EACH WEEK
/*
select avg(Time_Saved_Hours_Weekly) as Avg_time_saved
  from AI_Impact;
  */
--FINDINGS: 8 HOURS

--AVERAGE PERCENTAGE CHANGE IN GPA BEFORE AND AFTER AI INTERVENTION
/*
select round(AVG(GPA_Baseline),2) as Before_avg,
       Round(avg(GPA_Post_AI), 2)  as After_avg,
       Round(((avg(GPA_Post_AI) - Avg(GPA_Baseline))*100.0/Avg(GPA_Baseline)), 2)as Percentage_change
       from AI_Impact;
*/
--FINDING:Students experienced an average
--GPA increase of 2.69% after AI adoption,
--indicating a measurable positive academic impact.

--HIGHEST ETHICAL CONCERN GROUP
 /*
 with Ethics_concern as(
     select Major,AI_Ethics_Concern, count(*) as Number
    from AI_Impact group by AI_Ethics_Concern,Major)
  select Major,AI_Ethics_Concern, Number,
  100*Number/sum(Number)over(Partition by Major) as ethical_percentage
  from Ethics_concern order by Major,ethical_percentage desc;
  */
  --FINDING: Ethical concerns are fairly balanced across all majors, 
  --with no major exhibiting overwhelmingly high or low concern levels.
 
 --STUDENTS WITH MOST CAREER CONFIDENCE
 /*
 with confidence_category as(
     select Major, case when Career_Confidence_Score <=4 then 'Low'
     when Career_Confidence_Score<=7 then 'Medium'
     else 'High' end as Confidence_Level
     From AI_Impact)
  select Major,Confidence_level, Count(*)as Total_Students
     from confidence_category
     group by Major,Confidence_Level
     order by Major,Total_Students desc;
*/
--FINDING: MOST OF THE STUDENTS FALL IN THE LOW TO MODERATE CONFIDENCE LEVEL STRATA.

--WHICH MAJOR HAS THE HIGHEST CAREER CONFIDENCE?
/*
select Major,(AVG(Career_Confidence_Score)as Confidence_Avg
  from AI_Impact
  group by Major order by Confidence_Avg;
  */
 --FINDING: Business Administration and Data Science students
 --demonstrate the highest career confidence, 
 --while Modern History students report the lowest confidence levels.

 -- WHICH AI TOOL SHOWS HIGHEST GPA IMPROVEMENT
 /*
 with GPA_Improvement as
    (select Primary_AI_Tool,
     AVG(GPA_Baseline)as Avg_Baseline_GPA,AVG(GPA_Post_AI)
     as Avg_post_AI,Round(AVG(GPA_Post_AI)-AVG(GPA_Baseline),2) as Avg_Difference,             
     Round((avg(GPA_Post_AI)-avg(GPA_Baseline))*100.0/avg(GPA_Baseline),2)
     as Percentage_change from AI_Impact group by Primary_AI_Tool)
    select Primary_AI_Tool,Avg_Difference,Percentage_change,
    DENSE_RANK()over(order by Percentage_change desc)as Percentage_change_Rank
    from GPA_Improvement;
*/
--FINDING: AN AVERAGE PERCENTAGE % OF NEARLY 3% IS SEEN.
-- CHATGPT-4.0 > PERPLEXITY > GITHUB COPILOT > GEMINI PRO > CLAUDE 3.5

--DOES CONFIDENCE CORELATES GPA IMPROVEMENT?
/*
Select  Round(Avg(GPA_Post_AI- GPA_Baseline),2)as GPA_Gain,
      avg(Career_Confidence_Score) as Avg_Career_Confidence,
      DENSE_RANK()Over(order by (avg(GPA_Post_AI - GPA_Baseline))desc) 
      as Rank_No
      From AI_Impact group by Career_Confidence_Score ;
      */
--FINDINGS: NO CAUSATION CAN BE CLAIMED, MODERATE CO-RELATION BETWEEN GPA GAINS & CAREER CONFIDENCE.

--DOES SAVING TIME INCREASES CAREER CONFIDENCE?
/*
select  Major,avg(Time_Saved_hours_Weekly)as Avg_Time_Saved,
      AVG(Career_Confidence_Score)as Avg_Career_Confidence, 
      from AI_Impact  group by Major order by Avg_Career_Confidence desc ;
   */

   --FINDINGS: FOUND NO STATISTICALLY SIGNIFICANT RELATION.

-- DOES MORE AI USAGE LEAD TO IMPROVED GPA
/*
SELECT Task_Frequency_Daily,
Round(AVG(GPA_Post_AI-GPA_Baseline),2) AS GPA_Improvement
FROM AI_Impact
GROUP BY Task_Frequency_Daily
ORDER BY Task_Frequency_Daily;
*/
 --FINDING:
--AI usage is associated with modest GPA improvement, 
--but increasing usage frequency alone does not appear 
--to drive significantly better academic performance.

/* FINAL BUSINESS CONCLUSION

AI adoption has become a significant productivity driver in
higher education, enabling students to save time and achieve
modest academic improvements. The analysis suggests that the
value of AI lies not in how frequently it is used, but in how
effectively it is applied to academic tasks. Students who
strategically leverage AI tools benefit from improved learning
efficiency, while maintaining balanced perspectives on ethical
considerations and career readiness.

*/