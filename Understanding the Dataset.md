\--------------------------------------------------------------------------------

#### Google Play Store App Dataset 2026

\--------------------------------------------------------------------------------



##### Data Model:-

&#x20;                        apps (Primary Table)

&#x20;                              |

&#x20;                              | app\_id (common key)

&#x20;         ----------------------------------------------

&#x20;         |                                            |

&#x20;         |                                            |

app\_country\_stats                             discovery\_signals





This is essentially a star-schema-like design where apps acts as the central table.





\------------------------------------------------------------------------------------------------------------------------------------------



* ##### apps (Master Table)



Granularity: One row per app.



Contains:



1. App metadata
2. Developer information
3. Pricing
4. Ratings
5. Downloads
6. Categories
7. Android requirements
8. Description
9. Media assets



This is fact table for app-level analytics.



\------------------------------------------------------------------------------------------------------------------------------------------

* ##### app\_country\_stats



Granularity: One row per app per country.



Contains:



1. Country
2. Installs
3. Ratings
4. Reviews
5. Country-specific score
6. Price
7. Free/Paid



This enables regional analysis.



\------------------------------------------------------------------------------------------------------------------------------------------

* ##### discovery\_signals



Granularity: One row per discovery event.



Contains:



1. Search keyword
2. Collection
3. Chart rank
4. Country
5. Discovery source
6. Signal category



This tells how users found the app.



\------------------------------------------------------------------------------------------------------------------------------------------

* ##### Folder Structure

Google-Play-Store-Analytics/



│

├── data/

│   ├── raw/

│   ├── cleaned/

│   └── processed/

│

├── notebooks/

│   ├── 01\_Data\_Understanding.ipynb

│   ├── 02\_Data\_Cleaning.ipynb

│   ├── 03\_EDA.ipynb

│   ├── 04\_Feature\_Engineering.ipynb

│   └── 05\_Machine\_Learning.ipynb

│

├── sql/

│   ├── schema.sql

│   ├── queries.sql

│   └── insights.sql

│

├── powerbi/

│   └── Dashboard.pbix

│

├── visuals/

│

├── models/

│

├── reports/

│

├── README.md

│

└── requirements.txt





\------------------------------------------------------------------------------------------------------------------------------------------

### Apps (Main Dataset)

* ##### App Information

###### Column	     Example Value					Meaning

app\_id		com.droid4you.application.wallet		Unique identifier/package name of the app.

title		Wallet: 					Budget Expense Tracker	App name shown on Play Store.

description	**Wallet is the all-in-one...			Full app description written by the developer. HTML tags like  are included.**

summary		All-in-one personal finance app...		Short description/tagline of the app.



##### 

* ##### Installation \& Popularity

###### Column	     Example Value					Meaning

installs	10,000,000+					Human-readable install range shown on Play Store.

min\_installs	10000000					Minimum estimated installs.

max\_installs	12778093					Maximum estimated installs.

score		4.60277						Average user rating out of 5.

ratings		376251						Number of users who gave a rating.

reviews		7477						Number of written reviews.

histogram	\[20635,6451,10626,26249,312256]			Rating distribution: number of 1-star to 5-star ratings.





|For this app:|
|-|
|1★ ratings = 20,635|
|2★ ratings = 6,451|
|3★ ratings = 10,626|
|4★ ratings = 26,249|
|5★ ratings = 312,256|





* ##### Pricing Information

###### Column		Example Value				Meaning

price			0.0				   App price.

free			True				   The app is free to download.

currency		USD				   Currency used for pricing.

sale			False				   Currently not discounted.

sale\_time		NaN				   No sale period available.

original\_price		NaN				   No previous price because it is free.



* ##### Developer Information

###### Column		Example Value				Meaning

developer		BudgetBakers			    Company/person who created the app.

developer\_id		8553499851937523437		    Unique developer identifier.

developer\_email		support@budgetbakers.com	    Contact email.

developer\_website	http://www.budgetbakers.com	    Developer website.

developer\_address	NaN				    Developer address (not provided).

privacy\_policy		http://budgetbakers.com/privacy	    Privacy policy URL.





* ##### Category Information

###### Column		Example Value				Meaning

genre		    	 Finance			    	Main category of the app.

genre\_id		 FINANCE			   	Category identifier.

categories		\[{'id':'FINANCE','name':'Finance'}]	Detailed category information.





* ##### Media Information

###### &#x20;Column		Example Value				Meaning

&#x20; icon		      Google image URL				App icon image link.

header\_image	      Google image URL				Banner image link.

screenshots	      List of image URLs			Screenshots showing the app UI.

video			NaN					No promotional video available.

video\_image		NaN					No video thumbnail available.



These columns are usually not needed for analysis.

##### 



* ##### Safety \& Monetization

###### Column				Example Value				Meaning

content\_rating				Everyone				Age suitability rating.

content\_rating\_description		NaN					Additional rating explanation.

ad\_supported				False					Developer does not mark it as ad-supported.

contains\_ads				False					No advertisements inside the app.

in\_app\_purchases			True					Users can buy something inside the app.



* ##### Technical Details

###### Column				Example Value				Meaning

size					NaN					App download size (missing here).

android\_version				NaN					Minimum Android API requirement.

android\_version\_text			NaN					Human-readable Android requirement.

developer\_internal\_id			NaN					Internal developer identifier.

required\_android\_version		NaN					Required Android version.

interactive\_elements			NaN					Interactive features information.



* ##### Update Information

###### Column				Example Value				Meaning

updated					1776860000				Unix timestamp of last update.

version					9.2.15					Current app version.

recent\_changes				NaN					Latest update notes.

scraped\_at				2026-05-05 20:38:25+05:30		When this data was collected.







* ##### Columns useful for analysis
* ##### **Keep**
1. title
2. genre
3. installs
4. min\_installs
5. max\_installs
6. score
7. ratings
8. reviews
9. price
10. free
11. currency
12. contains\_ads
13. in\_app\_purchases
14. size
15. content\_rating
16. developer
17. updated
18. version





* ##### **Drop**
1. description
2. icon
3. header\_image
4. screenshots
5. video
6. video\_image
7. developer\_email
8. developer\_website
9. developer\_address
10. privacy\_policy



\------------------------------------------------------------------------------------------------------------------------------------------



* # Country Dataset



##### Country Dataset Overview



This dataset contains app-level information separated by country. It helps analyze how an app performs in different countries.



* ##### App Information

###### &#x20;  Column		Example Value			Meaning

&#x09;id			0				Unique row identifier in the dataset. It is not the app identifier.

&#x09;app\_id			com.picsart.studio		Unique package name/identifier of the app on Google Play Store.

&#x09;country	us		Country code 			representing where the app data was collected (US = United States).



* ##### Installation \& Popularity

###### &#x20;  Column		Example Value			Meaning

&#x09;installs		1,000,000,000+			Human-readable install range displayed on Play Store for this country.

&#x09;min\_installs		1.000000e+09			Minimum estimated installs. Here it represents 1 billion installs.

&#x09;score			4.032339			Average user rating of the app in that country (out of 5).

&#x09;ratings			12,207,068			Total number of users who rated the app in that country.

&#x09;reviews			445,242				Total number of written reviews received in that country.



* For this app:
1. Average rating = 4.03 / 5
2. Total ratings = 12 million+
3. Written reviews = 445 thousand+





* ##### Pricing Information

###### Column			Example Value			Meaning

&#x20; price				0.0				Price of the app in the selected country.

&#x20; free				True				Indicates that the app is free to download.



###### Since:

###### price = 0.0

###### free = True

Hence, The app is available without payment.



* ##### Date Information

###### Column			Example Value				Meaning

scrape\_date			2026-05-05					Date when the country-specific data was collected.

scraped\_at			2026-05-05 20:40:18.799359+05:30		Exact timestamp when the scraping process happened.





1. ##### Example Interpretation



###### For this row:

PicsArt (com.picsart.studio) in the United States (us) has more than 1 billion installs. It has an average rating of 4.03 from over 12 million users, with around 445 thousand written reviews. The app is free and the data was collected on May 5, 2026.



* ##### Columns useful for analysis
* ###### Keep:
1. app\_id
2. country
3. installs
4. min\_installs
5. score
6. ratings
7. reviews
8. price
9. free
* ###### Mostly metadata:
1. id
2. scrape\_date
3. scraped\_at





\------------------------------------------------------------------------------------------------------------------------------------------



* # Discovery Dataset



##### Discovery Dataset Overview



This dataset contains information about how apps were discovered on the Google Play Store. It tracks the source, category, keywords, ranking, and signals that helped identify an app.



* ##### App Information

###### &#x20;  Column		Example Value			Meaning

&#x20;    id				1				Unique row identifier in the dataset. It is not the app identifier.

&#x20;    app\_id		    com.zhiliaoapp.musically		Unique package name/identifier of the app on Google Play Store.

&#x20;    source		    chart\_page				The method/source through which the app was discovered. Here, it was found from a Play Store 								chart page.





* ##### Discovery Location Information

###### &#x20;   Column		Example Value			Meaning

&#x20;    country			us				Country where the discovery information was collected (US = United States).

&#x20;    category			SOCIAL				Google Play Store category of the app.

&#x20;    keyword			NaN				Search keyword used to find the app. Missing because this app was discovered through charts, 								not search.

##### 

* ##### Collection \& Ranking Information

###### &#x20;   Column		Example Value			Meaning

&#x20;   collection		     topselling\_free			Type of chart/list where the app was discovered.

&#x20;   chart\_rank			1.0				Position of the app in the chart. Rank 1 means it was the top-ranked app in that 									category/list.



* ###### For this app:
1. Collection = Top Selling Free Apps
2. Rank = #1





* ##### Discovery Signal Information

###### Column			Example Value					Meaning

signal\_key		  com.zhiliaoapp.musically|chart\_page|us|SOCIAL...	    Combined unique identifier created from multiple discovery attributes.

discovered\_at	2		026-05-05					    Date when this app was discovered/collected.

Example Interpretation





* ###### For this row:



TikTok (com.zhiliaoapp.musically) was discovered in the United States through a Google Play Store chart page. It appeared in the Social category under the "top selling free" collection and ranked number 1. The discovery record was collected on May 5, 2026.

##### 

* ##### Columns useful for analysis
* ###### Keep:
1. app\_id
2. source
3. country
4. category
5. keyword
6. collection
7. chart\_rank
8. discovered\_at
* ###### Mostly technical:
1. id
2. signal\_key









