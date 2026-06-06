# 🤖 Impact of AI on Student Academic Life | SQL Analysis

> **Analyzing how AI tool adoption affects GPA, productivity, career confidence, and academic behaviour across 1,500 students using SQL Server (SSMS) — structured query-driven analysis from a Kaggle dataset.**

---

## 📌 Project Overview

Artificial Intelligence tools are rapidly reshaping how students study, research, and prepare for careers. This project uses **structured SQL analysis in Microsoft SQL Server (SSMS)** to investigate the measurable academic and behavioural impact of AI adoption among 1,500 higher-education students across six majors.

The analysis covers tool popularity, usage patterns, GPA changes pre- and post-AI adoption, time savings, ethical concerns, and career confidence — answering real questions with data rather than assumption.

This project demonstrates proficiency in **SQL querying, window functions, CTEs, aggregation, and analytical thinking** applied to an education and HR-adjacent domain.

---

## 🎯 Business / Research Objective

The analysis is structured to answer six core questions:

- Which AI tools are most widely adopted and for what purposes?
- Does AI adoption measurably improve student GPA?
- How much time do students save weekly by using AI tools?
- Which AI tool produces the highest academic improvement?
- Do career confidence levels vary by major, and does AI usage influence them?
- Are ethical concerns about AI evenly distributed across student populations?

---

## 📂 Dataset Overview

| Attribute | Details |
|---|---|
| **Source** | Kaggle — AI Impact on Student Life 2026 |
| **File** | `AI_Impact_Student_Life_2026.csv` |
| **Records** | 1,500 students |
| **Columns** | 11 features |
| **No missing values** | 0 nulls, 0 duplicate Student IDs |

### Columns

| Column | Description |
|---|---|
| `Student_ID` | Unique student identifier |
| `Age` | Student age (18–25) |
| `Major` | Academic discipline (6 majors) |
| `Primary_AI_Tool` | Main AI tool used (5 tools) |
| `Task_Frequency_Daily` | Daily AI usage frequency (1–10 tasks) |
| `Main_Usage_Case` | Primary purpose of AI use (5 categories) |
| `GPA_Baseline` | GPA before AI adoption |
| `GPA_Post_AI` | GPA after AI adoption |
| `Time_Saved_Hours_Weekly` | Weekly hours saved through AI use |
| `AI_Ethics_Concern` | Ethical concern level (Low / Medium / High) |
| `Career_Confidence_Score` | Career readiness confidence score (1–10) |

---

## 🛠️ Tools Used

| Tool | Purpose |
|---|---|
| **SQL Server Management Studio (SSMS)** | Query execution and analysis |
| **T-SQL** | Aggregations, CTEs, window functions, ranking |
| **Kaggle** | Dataset source |
| **Excel** | Initial data inspection |

---

## 🗂️ SQL Techniques Demonstrated

| Technique | Used In |
|---|---|
| `GROUP BY` + `COUNT`, `AVG`, `ROUND` | Tool popularity, usage cases, GPA averages |
| `DENSE_RANK() OVER(PARTITION BY ... ORDER BY ...)` | Ranking usage cases within each major |
| `CTE (WITH clause)` | GPA improvement by tool; ethics concern analysis; confidence categorization |
| `CASE WHEN` | Career confidence segmentation (Low / Medium / High) |
| `Window Functions` | Partitioned ranking, percentage calculations over groups |
| `Subqueries` | Nested analysis for percentage share within groups |
| Data Quality Checks | NULL checks, duplicate detection via `HAVING COUNT(*) > 1` |

---

## 🔍 Queries Performed & Findings

### 1. Data Quality Check
Verified 1,500 total records, zero duplicate `Student_ID` values, and zero missing values across all 11 columns before analysis began.

---

### 2. Students per Major & AI Tool Distribution

| Major | Students |
|---|---|
| Fine Arts | 263 |
| Data Science | 259 |
| Biology | 259 |
| Business Administration | 256 |
| Software Engineering | 242 |
| Modern History | 221 |

---

### 3. Most Popular AI Tool

| AI Tool | Students |
|---|---|
| GitHub Copilot | 311 |
| Gemini Pro | 302 |
| Perplexity | 302 |
| Claude 3.5 | 297 |
| ChatGPT-4o | 288 |

**Finding:** GitHub Copilot is the most widely adopted tool, though all five tools are used in near-equal proportions across the student population.

---

### 4. Most Popular Usage Cases

| Usage Case | Students |
|---|---|
| Exam Prep | 341 |
| Literature Review | 308 |
| Essay Drafting | 301 |
| Brainstorming | 286 |
| Code Debugging | 264 |

**Finding:** Exam Prep is the dominant use case across all majors, followed by Literature Review and Essay Drafting — indicating AI is primarily used to reduce effort on tedious, repetitive academic tasks.

---

### 5. Top Usage Case by Major *(DENSE_RANK with PARTITION BY)*

| Major | #1 Usage | #2 Usage | #3 Usage |
|---|---|---|---|
| Biology | Exam Prep | Essay Drafting | Brainstorming |
| Business Administration | Essay Drafting | Exam Prep | Literature Review |
| Data Science | Exam Prep | Brainstorming | Literature Review |
| Fine Arts | Exam Prep | Literature Review | Code Debugging |
| Modern History | Essay Drafting | Literature Review | Brainstorming |
| Software Engineering | Literature Review | Exam Prep | Brainstorming |

**Finding:** Across all majors, Exam Prep, Literature Review, Essay Drafting, and Brainstorming dominate — confirming AI is used predominantly for cognitively heavy, time-intensive academic work.

---

### 6. Average Time Saved Weekly

**Finding:** Students save an average of **8.51 hours per week** through AI tool use — equivalent to over a full workday recovered each week.

---

### 7. GPA Before vs. After AI Adoption

| Metric | Value |
|---|---|
| Average GPA (Before AI) | 3.26 |
| Average GPA (After AI) | 3.34 |
| Percentage Change | **+2.69%** |

**Finding:** Students experienced an average GPA increase of 2.69% after AI adoption, indicating a measurable positive academic impact.

---

### 8. GPA Improvement by AI Tool *(CTE + DENSE_RANK)*

| AI Tool | GPA Gain | % Change | Rank |
|---|---|---|---|
| ChatGPT-4o | +0.094 | 2.87% | 1 |
| Perplexity | +0.092 | 2.83% | 2 |
| GitHub Copilot | +0.091 | 2.81% | 3 |
| Gemini Pro | +0.082 | 2.49% | 4 |
| Claude 3.5 | +0.080 | 2.48% | 5 |

**Finding:** All tools produce similar improvement (~2.5–2.9% GPA gain). ChatGPT-4o leads marginally, but no single tool produces dramatically superior academic outcomes.

---

### 9. AI Ethics Concern Distribution *(CTE + Window Percentage)*

Ethical concern levels are near-equally distributed across the student population:

| Concern Level | Students | Share |
|---|---|---|
| Low | 523 | 34.9% |
| High | 496 | 33.1% |
| Medium | 481 | 32.1% |

**Finding:** Ethical concerns are fairly balanced across all majors, with no major exhibiting overwhelmingly high or low concern — suggesting AI ethics awareness is broadly uniform in this cohort.

---

### 10. Career Confidence by Major *(AVG + GROUP BY)*

| Major | Avg Confidence Score (1–10) |
|---|---|
| Business Administration | 5.68 |
| Data Science | 5.67 |
| Fine Arts | 5.62 |
| Software Engineering | 5.29 |
| Biology | 5.14 |
| Modern History | 5.05 |

**Finding:** Business Administration and Data Science students demonstrate the highest career confidence. Modern History students report the lowest confidence levels.

---

### 11. Does Confidence Correlate with GPA Improvement? *(CTE + Window Function)*

**Finding:** No causation can be claimed. There is only a moderate, statistically weak correlation between GPA gains and career confidence (correlation ≈ 0.02). GPA improvement alone does not predict career confidence levels.

---

### 12. Does Time Saved Increase Career Confidence?

**Finding:** No statistically significant relationship found between weekly hours saved through AI use and career confidence scores across majors.

---

### 13. Does More AI Usage Lead to Better GPA?

**Finding:** AI usage is associated with modest GPA improvement, but increasing usage frequency alone does not drive significantly better academic performance. GPA improvement remains fairly stable (0.07–0.10 range) regardless of daily task frequency, suggesting that *how* AI is used matters more than *how often*.

---

## 💡 Business Insights

> *All insights are directly supported by the SQL queries and dataset. No assumptions have been made.*

**📌 AI adoption is a measurable productivity driver in higher education.**
Students save an average of 8.51 hours per week — equivalent to over a full workday — by leveraging AI tools for exam prep, literature review, and essay drafting.

**📌 GPA improvement is real but modest (+2.69%).**
The average GPA gain of 2.69% after AI adoption is consistent across all tools and majors. This is a directional positive signal, not a transformational one — suggesting AI augments learning rather than replacing effort.

**📌 Exam prep is the universal use case across all majors.**
Regardless of discipline, students primarily use AI to reduce the cognitive load of exam preparation, literature review, and essay drafting — pointing to AI as a tool for managing academic volume rather than replacing deep thinking.

**📌 Tool choice matters less than expected.**
All five AI tools produce similar GPA gains (2.48%–2.87%). The narrow spread suggests that the benefit comes from AI use itself, not from selecting any particular tool.

**📌 Usage frequency is not the performance driver.**
GPA improvements plateau regardless of daily task frequency — students using AI 1 task/day and 10 tasks/day show similar academic outcomes. Strategic use outweighs frequent use.

**📌 Career confidence is not driven by AI metrics.**
Neither GPA gains, time saved, nor AI usage frequency showed meaningful correlation with career confidence scores. Confidence is likely shaped by major, career clarity, and internship exposure — not AI adoption alone.

**📌 Ethical concern about AI is evenly distributed.**
Low, Medium, and High concern groups are nearly equal in size (~33% each), indicating no consensus on AI ethics among this student cohort — a signal that institutions may need structured ethical frameworks rather than assuming students self-regulate.

---

## 🧠 Skills Demonstrated

```
SQL Querying          → 13 structured analytical queries from data quality to advanced ranking
CTEs                  → Multi-step analysis with WITH clauses for GPA improvement and ethics %
Window Functions      → DENSE_RANK() OVER(PARTITION BY ... ORDER BY ...) for within-group ranking
Aggregations          → COUNT, AVG, ROUND, GROUP BY across categorical and numerical dimensions
CASE WHEN             → Custom segmentation of career confidence into Low/Medium/High tiers
Data Quality Checks   → NULL detection, duplicate ID validation before analysis
Analytical Thinking   → Hypothesis testing (confidence vs. GPA, time saved vs. confidence)
Business Storytelling → Final conclusion synthesizing all query findings into one narrative
```

---

## 🚀 Project Outcome

This SQL project demonstrates that AI adoption in higher education produces measurable but nuanced outcomes — students recover nearly a full workday per week and see modest GPA improvements, but usage frequency and tool choice have less impact than expected. The analysis also surfaces an important negative finding: career confidence cannot be explained by AI metrics alone, pointing institutions toward holistic student development rather than AI adoption as a standalone intervention.

The project showcases end-to-end SQL analytical workflow — from data quality validation through multi-layered aggregation, CTE-based ranking, and window function analysis — producing a structured, business-ready conclusion from raw educational data.

---

## 📁 Repository Structure

```
ai-impact-student-life-sql/
│
├── 📄 AI_Impact_Student_Life_2026.csv     # Source dataset (1,500 records, 11 columns)
├── 🗃️ AI_SQL_QUERY.sql                    # Full SQL analysis script (13 queries + comments)
└── 📝 README.md
```

> 💡 **To run the queries:** Import `AI_Impact_Student_Life_2026.csv` into SQL Server as a table named `AI_Impact`, then execute `AI_SQL_QUERY.sql` in SSMS.

---

## 👩‍💼 About Me

**Kajal Tiwari**
MBA (Business Analytics & HR) | Fresher Data & HR Analyst

I am a final-year MBA student specializing in Business Analytics and Human Resource Management, building a portfolio at the intersection of people data and business intelligence. My focus is on translating raw data into decisions — using SQL, Power BI, and Excel to solve real HR and business problems.

📌 **Technical Skills:** SQL (SSMS · T-SQL) · Power BI · Excel · DAX · Power Query · Data Visualization  
📌 **Domain Skills:** HR Analytics · Education Analytics · Workforce Planning · Reporting · MIS


*This project is part of my Data & HR Analytics portfolio. Dataset source: Kaggle — AI Impact on Student Life 2026. Used for educational and portfolio purposes only.*
- AI adoption was associated with improved academic outcomes.
