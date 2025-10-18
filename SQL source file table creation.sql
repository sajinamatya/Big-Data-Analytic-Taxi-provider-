-- Use the BigDataDWH database
USE BigDataDWH;
GO

/*============================================================
  SCHEMA CREATION
  ------------------------------------------------------------
  We are organizing the database into separate schemas for:
  - staging: temporary raw data before ETL
  - dim: dimension tables (descriptive data)
  - fact: fact tables (measurable data)
  - etl: logs and metadata related to ETL processes
============================================================*/
CREATE SCHEMA staging;
GO
CREATE SCHEMA dim;
GO
CREATE SCHEMA fact;
GO
CREATE SCHEMA etl;
GO


/*============================================================
  DIMENSION TABLES
  ------------------------------------------------------------
  Dimension tables contain descriptive attributes that help
  categorize and filter fact data.
============================================================*/

-- Location Dimension
CREATE TABLE dim.location_dim_table (
    locationKey INT IDENTITY(1,1) PRIMARY KEY,  -- Surrogate key
    city VARCHAR(100) NOT NULL,                 -- City name
    [state] VARCHAR(50) NOT NULL,               -- State name
    zipCode VARCHAR(20) NOT NULL                -- ZIP code
);
GO

-- Block Dimension
CREATE TABLE dim.block_dim_table (
    blockKey INT IDENTITY(1,1) PRIMARY KEY,     -- Surrogate key
    latitude DECIMAL(10,6),                     -- Latitude coordinate
    longitude DECIMAL(10,6),                    -- Longitude coordinate
    blockName VARCHAR(100)                      -- Block name or area
);
GO

-- Airport Dimension
CREATE TABLE dim.airport_dim_table (
    airportKey INT IDENTITY(1,1) PRIMARY KEY,   -- Surrogate key
    isAirport VARCHAR(3)                        -- Indicates if it's an airport (e.g., 'Yes'/'No')
);
GO

-- Route Dimension
CREATE TABLE dim.route_dim_table (
    routeKey INT IDENTITY(1,1) PRIMARY KEY,     -- Surrogate key
    routeOriginCity VARCHAR(50),                -- Starting city of route
    routeDestCity VARCHAR(50),                  -- Destination city of route
    popularityIndex INT                         -- Popularity metric for the route
);
GO

-- Payment Dimension
CREATE TABLE dim.payment_dim_table (
    paymentKey INT IDENTITY(1,1) PRIMARY KEY,   -- Surrogate key
    paymentType VARCHAR(50),                    -- Payment type code (e.g., 'CRD', 'CASH')
    paymentTypeName VARCHAR(50)                 -- Descriptive payment type (e.g., 'Credit Card')
);
GO

-- Ride Type Dimension
CREATE TABLE dim.ride_dim_table (
    rideTypeKey INT IDENTITY(1,1) PRIMARY KEY,  -- Surrogate key
    rideOriginCity VARCHAR(50),                 -- Ride starting city
    rideDestCity VARCHAR(50),                   -- Ride destination city
    rideCategory VARCHAR(50),                   -- Category (e.g., 'Standard', 'Luxury')
    rideType VARCHAR(50)                        -- Specific ride type (e.g., 'UberX', 'UberXL')
);
GO

-- Time Dimension
CREATE TABLE dim.time_dim_table (
    timeKey INT IDENTITY(1,1) PRIMARY KEY,      -- Surrogate key
    [timestamp] DATETIME,                       -- Exact timestamp
    [date] DATE,                                -- Date component
    [time] TIME,                                -- Time component
    dayOfWeek VARCHAR(10),                      -- e.g., 'Monday'
    [month] VARCHAR(10),                        -- e.g., 'January'
    holiday VARCHAR(3),                         -- 'Yes'/'No' flag for holiday
    [quarter] INT,                              -- Quarter of the year (1-4)
    [year] INT,                                 -- Year
    [hour] INT,                                 -- Hour of the day (0-23)
    season VARCHAR(10)                          -- e.g., 'Winter', 'Summer'
);
GO


/*============================================================
  FACT TABLE
  ------------------------------------------------------------
  The central table that stores measurable business data
  (e.g., trip revenue, distance, duration) linked to all
  relevant dimension tables through foreign keys.
============================================================*/

CREATE TABLE fact.fact_table (
    trip_id INT IDENTITY(1,1) PRIMARY KEY,          -- Unique trip ID

    -- Foreign keys linking to dimension tables
    pickUpTimeKey INT,                              -- FK → dim.time_dim_table
    dropOffTimeKey INT,                             -- FK → dim.time_dim_table
    originLocationKey INT,                          -- FK → dim.location_dim_table
    destLocationKey INT,                            -- FK → dim.location_dim_table
    originBlockKey INT,                             -- FK → dim.block_dim_table
    destBlockKey INT,                               -- FK → dim.block_dim_table
    airportKey INT,                                 -- FK → dim.airport_dim_table
    rideKey INT,                                    -- FK → dim.ride_dim_table
    paymentKey INT,                                 -- FK → dim.payment_dim_table
    routeKey INT,                                   -- FK → dim.route_dim_table

    -- Fact measures (quantitative values)
    baseFareAmount DECIMAL(10,2),                   -- Base trip fare
    tollAmount DECIMAL(10,2),                       -- Toll fee
    extraFareAmount DECIMAL(10,2),                  -- Extra fare (e.g., waiting charge)
    surchargeAmount DECIMAL(5,2),                   -- Surcharge (e.g., peak hour)
    gratuityAmount DECIMAL(5,2),                    -- Tip amount
    mileage DECIMAL(10,2),                          -- Trip distance in miles
    duration INT,                                   -- Trip duration in minutes
    gratuityPercentage DECIMAL(29,13),              -- Tip percentage of fare
    profitPerMile DECIMAL(26,13),                   -- Profit ratio per mile
    tripSatisfactionScore DECIMAL(23,13),           -- Customer satisfaction rating
    surchargePercentage DECIMAL(29,13),             -- Surcharge percentage

    -- Foreign Key Constraints
    FOREIGN KEY (pickUpTimeKey) REFERENCES dim.time_dim_table(timeKey),
    FOREIGN KEY (dropOffTimeKey) REFERENCES dim.time_dim_table(timeKey),
    FOREIGN KEY (originLocationKey) REFERENCES dim.location_dim_table(locationKey),
    FOREIGN KEY (destLocationKey) REFERENCES dim.location_dim_table(locationKey),
    FOREIGN KEY (originBlockKey) REFERENCES dim.block_dim_table(blockKey),
    FOREIGN KEY (destBlockKey) REFERENCES dim.block_dim_table(blockKey),
    FOREIGN KEY (airportKey) REFERENCES dim.airport_dim_table(airportKey),
    FOREIGN KEY (rideKey) REFERENCES dim.ride_dim_table(rideTypeKey),
    FOREIGN KEY (paymentKey) REFERENCES dim.payment_dim_table(paymentKey),
    FOREIGN KEY (routeKey) REFERENCES dim.route_dim_table(routeKey)
);
GO


/*============================================================
  ETL ERROR LOG TABLE
  ------------------------------------------------------------
  This table stores error details captured during ETL processes.
============================================================*/

CREATE TABLE etl.error_log (
    ErrorID INT IDENTITY(1,1) PRIMARY KEY,          -- Unique error ID
    PackageName VARCHAR(100),                       -- ETL package name
    TaskName VARCHAR(100),                          -- Specific task that failed
    SourceColumn VARCHAR(100),                      -- Column where error occurred
    ErrorDescription VARCHAR(500),                  -- Description of the error
    ErrorCode VARCHAR(MAX),                         -- System error code or details
    ErrorTime DATETIME DEFAULT GETDATE()            -- Timestamp of the error
);
GO
