# Big-Data-Analytic-Taxi-provider-
leverages ETL processes and data warehousing to manage and analyze large-scale taxi trip datasets. Analytic Taxi trip data helps identify patterns for operational and business decisions. This project addresses the complexities of handling large-scale taxi trip data by combining data warehousing, big data processing, and predictive analytics, aiming to boost operational efficiency and generate strategic benefits for stakeholders.

# Power BI Dashboard 
<img width="1122" height="634" alt="image" src="https://github.com/user-attachments/assets/cca71f1d-2e69-4166-aa5d-675cd0287679" />
<img width="1122" height="626" alt="image" src="https://github.com/user-attachments/assets/1e2e993b-a067-4e67-ae64-14d0667b74ef" />
<img width="1125" height="629" alt="image" src="https://github.com/user-attachments/assets/8c448312-a9f6-4a13-9296-aae1188085fe" />


# Data Overview 
Taxi services produce massive amounts of data every day, such as geospatial locations, fare information, payment methods, and more. Yet, in its raw form, this data holds limited value without proper storage, processing, and analysis. Our project addresses this by applying these techniques to the Taxi Trip Dataset—a real-world collection containing 2,548,358 records.

# Tools and Technology
### Microsoft SQL Server Management Studio (SSMS)
An integrated environment for managing SQL Server databases, writing queries, and administering data.
### Microsoft SQL Server Integration Services (SSIS) for data integration
A platform for data integration and ETL (Extract, Transform, Load) operations.
Provides advanced data analysis, OLAP, and business intelligence solutions using DAX query, cube operation .
### SQL Server Analysis Services (SSAS) for data analysis
Provides advanced data analysis, OLAP, and business intelligence solutions using DAX query, cube operation .
### PySpark- Distributed data storage and processing technologies
A distributed data processing framework used for handling large-scale datasets efficiently.
### Machine learning algorithms
Applied to build predictive models and uncover hidden patterns in data.
### Power BI for data visualization
A powerful tool for creating interactive dashboards and visual reports for better decision-making regarding the Taxi trip data .

# Business use case 
A transportation company named TaxiProvider runs a digital platform enabling riders to schedule taxi services for their travel needs. The organization spans multiple urban areas and works with freelance taxi operators to handle ride bookings. Looking to scale their business operations, the company plans to analyze their collected data for actionable insights. This requires building a comprehensive data warehouse solution to support decision-making across their finance, operations, and marketing teams.
Finance Department

### Payment department :

#### - What are the most commonly selected payment options by customers?
#### - Is there a progressive shift toward electronic payments over time?
Revenue Performance:
#### - Which taxi operators contribute the most to overall earnings?
#### - How do profit margins differ among various service partners?
#### Tip Analysis:
#### - What are the typical gratuity amounts passengers provide monthly or quarterly?
#### - Do tip amounts correlate with particular operators or ride categories?
#### Financial Monitoring:
#### - What are the aggregate earnings for monthly and quarterly periods?
#### - How do income patterns correspond with seasonal variations?

### Marketing Department

#### Geographic Market Analysis:
#### - Which metropolitan area experiences the greatest booking volume?
#### - How does customer demand shift across various cities temporally?
#### Destination Trends:
#### - What locations attract the most passengers seasonally or quarterly?
#### - Are there developing destination preferences that could guide advertising strategies?
#### Travel Pattern Analysis:
#### - What are the most frequently traveled route combinations?
#### - How might these movement patterns shape specialized promotional campaigns, including holiday or weekend deals?

### Operations Department

#### High-Demand Periods:
#### - What time intervals show maximum taxi requests?
#### - Are there particular days or timeframes with significant demand spikes?
#### Performance Metrics:
#### - Track distance traveled and duration patterns to evaluate fuel usage trends.
#### Service Preferences:
#### - Which ride categories do customers favor most?
#### - How do service preferences differ by geographic area?
#### Seasonal Booking Patterns:
#### - Which months show peak reservation activity?
#### - How do environmental and seasonal elements affect monthly booking volumes?
Strategic Location Analysis:
#### - What are the most active pickup and destination points?
#### - How can this data support optimal taxi deployment or promotional planning?


# Data Warehouse Architecture Diagram
<img width="966" height="476" alt="image" src="https://github.com/user-attachments/assets/e0bceebf-7d9f-417d-8049-4e241dc3d62b" />

# Datawarehouse Schema (SSAS) 
<img width="837" height="683" alt="image" src="https://github.com/user-attachments/assets/45e6dad6-defe-46de-b28b-9b91626c24d4" />

# Star Schema Diagram 
### Fact and dimensional table
<img width="1018" height="1030" alt="image" src="https://github.com/user-attachments/assets/3c2acd0f-7183-4ddc-b295-5cad7c77f437" />


# Calculated Table:
###  Used for extracting the required query by creating summaries, aggregations, or transformations using DAX.
<img width="862" height="600" alt="image" src="https://github.com/user-attachments/assets/c5c1a793-c0b1-4d8c-ba5c-c1b724e1a598" />


# Example of calculated table DAX query for certain aggregation 
<img width="1001" height="452" alt="image" src="https://github.com/user-attachments/assets/29dbffff-3481-49a3-976a-172ee99d9551" />

