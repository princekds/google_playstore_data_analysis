# 📱 Google Play Store Analytics

### End-to-End Data Analytics Project | Python • SQL • Machine Learning

![Project Type](https://img.shields.io/badge/Project-Data%20Analytics-blue)
![Tools](https://img.shields.io/badge/Tools-Python%20%7C%20SQL-orange)
![Domain](https://img.shields.io/badge/Domain-Mobile%20App%20Market-green)

---

## 🚀 Project Overview

The Google Play Store contains millions of applications competing for user attention. Understanding what makes an app successful requires analyzing multiple factors — user engagement, ratings, pricing strategy, developer performance, category trends, geographic demand, and app visibility.

This project performs a complete **end-to-end data analytics workflow**, transforming raw Play Store data into meaningful business insights:

```
Data Understanding → Data Cleaning → Exploratory Data Analysis
→ Feature Engineering → Machine Learning → SQL Business Analysis
```

---

## 🎯 Business Objectives

**📈 App Success Analysis**
Identify top-performing apps by installs, the relationship between ratings/reviews and popularity, and the characteristics of successful applications.

**🏷️ Category Intelligence**
Analyze the most competitive categories, which categories see higher user demand, and performance differences between genres.

**💰 Monetization Strategy**
Understand free vs. paid app performance, the impact of pricing strategy, and behavior across price segments.

**👨‍💻 Developer Performance**
Evaluate which developers have the largest portfolios, which generate the highest install volume, and how developer activity relates to market presence.

**🌍 Geographic Demand**
Analyze which countries show the strongest app demand, regional engagement differences, and country-level performance patterns.

**🔎 Discovery Visibility**
Understand app visibility patterns, popular discovery sources, and the factors affecting app reach.

---

## 📂 Dataset Overview

The project uses three cleaned datasets.

### 1️⃣ Applications Dataset — `apps_featured.csv`
- **Granularity:** 1 row = 1 application
- **Primary key:** `app_id`

Contains application details, category information, install performance, ratings and reviews, monetization info, developer details, update lifecycle data, and visibility metrics.

| Area | Features |
|---|---|
| Performance | `estimated_installs`, `ratings`, `reviews` |
| Monetization | `price`, `free`, `paid_app`, `price_category` |
| Developer | `developer`, `developer_id`, `developer_app_count` |
| Engagement | `review_rate`, `rating_strength` |
| Updates | `days_since_update`, `update_frequency` |
| Visibility | `discovery_count` |
| ML Features | `install_category`, `log_installs` |

### 2️⃣ Country Statistics Dataset — `app_country_stats_clean.csv`
- **Granularity:** 1 row = application–country combination
- **Relationship:** `apps.app_id → country_stats.app_id`
- **Used for:** country demand analysis, regional comparisons, engagement analysis

### 3️⃣ Discovery Dataset — `discovery_signals_clean.csv`
- **Granularity:** 1 row = discovery event
- **Relationship:** `apps.app_id → discovery_signals.app_id`
- **Used for:** visibility analysis, keyword analysis, discovery trend analysis

---

## 🧹 Data Cleaning Approach

Cleaning decisions were made based on business meaning rather than simply dropping missing values.

- **Missing update information** — Missing update dates were preserved rather than dropped, since they can represent real lifecycle behavior. A flag column, `update_missing`, was created to track this.
- **Currency standardization** — Missing currencies were filled with `USD`, the dominant currency among paid apps.
- **Price imputation** — Missing prices were filled using category-level pricing patterns, since pricing behavior varies significantly across categories.
- **Discovery data handling** — Missing category, collection, and keyword values were replaced with `Unknown`. Missing rankings were preserved using a `chart_rank_missing` flag.

---

## ⚙️ Feature Engineering

**Popularity**
- `log_installs` — a log transformation to correct for the heavy skew in install counts
- `install_category` — apps grouped into Very Low, Low, Medium, High, Very High

**Engagement**
- `review_rate` — reviews ÷ installs
- `rating_strength` — combines rating score and rating volume into a single quality indicator

**Monetization**
- `paid_app`, `price_category` — used to compare monetization strategies

**Developer**
- `developer_app_count` — measures portfolio strength

**Update Lifecycle**
- `update_year`, `update_month`, `days_since_update`, `update_frequency`, `update_missing` — used to analyze app maintenance behavior

---

## 🤖 Machine Learning Analysis

**Prediction target:** `install_category` (Very Low / Low / Medium / High / Very High)

**Data leakage prevention:** install-related features were excluded from the model — `estimated_installs`, `min_installs`, `max_installs`, `log_installs` — so the model learns from meaningful app characteristics instead of memorizing install numbers.

---

## 🗄️ SQL Business Analysis

**Schema**

| Table | Primary Key | Relationship |
|---|---|---|
| `apps` | `app_id` | — |
| `country_stats` | `id` | `app_id → apps.app_id` |
| `discovery_signals` | `id` | `app_id → apps.app_id` |

**Analysis performed**
- **Market overview** — total apps, number of developers, average ratings, total install volume
- **App performance** — highest-install apps, most-reviewed apps, high-engagement apps
- **Category analysis** — app count, average installs, and average ratings by category
- **Monetization analysis** — free vs. paid apps, performance across price segments
- **Developer analysis** — developers with the most apps and the highest install volume
- **Country analysis** — countries with the highest demand, regional engagement patterns
- **Discovery analysis** — discovery sources, keywords, visibility trends
- **Advanced business questions:**
  - Do frequently updated apps perform better?
  - Do higher-rated apps achieve more installs?
  - Which apps have strong ratings but low visibility?
  - Which apps have high installs but rating risks?

---

## 📁 Project Structure

```
Google-Play-Store-Analytics/
│
├── Data/
│   ├── apps_featured.csv
│   ├── app_country_stats_clean.csv
│   └── discovery_signals_clean.csv
│
├── Notebooks/
│   ├── Data_Understanding.ipynb
│   ├── Data_Cleaning.ipynb
│   ├── EDA.ipynb
│   ├── Feature_Engineering.ipynb
│   └── ML_Modeling.ipynb
│
├── SQL/
│   └── SQL_Analysis.sql
│
├── Presentation/
│   └── Final_Presentation.pptx
│
└── README.md
```

---

## 🛠️ Technologies Used

- **Programming:** Python, Pandas, NumPy
- **Visualization:** Matplotlib, Seaborn
- **Machine Learning:** Scikit-learn
- **Database:** SQL

---

## 📌 Key Insights

- A small percentage of applications dominate total installs.
- Ratings and reviews strongly influence user trust and popularity.
- Larger categories don't always produce better-performing apps.
- Developer activity can improve marketplace presence.
- Visibility and discovery exposure contribute to app growth.
- Ratings should be evaluated together with review volume, not in isolation.
- Regular app updates may influence long-term performance.

---

## 📦 Project Deliverables

- ✔ Cleaned datasets
- ✔ Exploratory data analysis
- ✔ Feature engineering pipeline
- ✔ Machine learning analysis
- ✔ SQL business analysis
- ✔ Final documentation

---

## 👤 Author

**Prince Kaushik**
📧 pkinsight.ds@gmail.com

*Data Analytics Portfolio Project — Google Play Store Market Intelligence Analysis*
