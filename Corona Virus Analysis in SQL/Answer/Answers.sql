-- USE student;

-- SELECT COUNT(*)
-- FROM `corona virus dataset`;

-- Step 1: Add a new column with DATE data type
-- ALTER TABLE `corona virus dataset`
-- ADD COLUMN `NewDate` DATE;

-- Step 2: Update the new column with converted dates
-- UPDATE `corona virus dataset`
-- SET `NewDate` = STR_TO_DATE(`Date`, '%d-%m-%Y');

-- Step 3: Drop the old Date column
-- ALTER TABLE `corona virus dataset`
-- DROP COLUMN `Date`;

-- Step 4: Rename the new column to 'Date'
-- ALTER TABLE `corona virus dataset`
-- `corona virus dataset`CHANGE COLUMN `NewDate` `Date` DATE;

-- Step 5: Place 'Date' in the right order
-- ALTER TABLE `corona virus dataset`
-- MODIFY `Date` DATE AFTER `Country/Region`;

/*SELECT *
FROM `corona virus dataset`
WHERE Province IS NULL
   OR `Country/Region` IS NULL
   OR Latitude IS NULL
   OR Longitude IS NULL
   OR Date IS NULL
   OR Confirmed IS NULL
   OR Deaths IS NULL
   OR Recovered IS NULL;*/
   
-- SELECT COUNT(DISTINCT MONTH(`Date`)) as `Number of Months`
-- FROM `corona virus dataset`;

/*SELECT 
    YEAR(`Date`) as `Year`,
    MONTH(`Date`) as `Month`,
    AVG(`Confirmed`) as `Average Confirmed`,
    AVG(`Deaths`) as `Average Deaths`,
    AVG(`Recovered`) as `Average Recovered`
FROM `corona virus dataset`
GROUP BY YEAR(`Date`), MONTH(`Date`);*/

/*DELIMITER $$
CREATE PROCEDURE MY_MODE(IN column_name CHAR(64), IN table_name CHAR(64), IN month INT, IN year INT, OUT mode_val INT)
BEGIN
  SET @s = CONCAT('SELECT ', column_name, ' INTO @m FROM `', table_name, 
                  '` WHERE MONTH(Date) = ', month, ' AND YEAR(Date) = ', year,
                  ' GROUP BY ', column_name, 
                  ' ORDER BY COUNT(*) DESC LIMIT 1');
  PREPARE stmt FROM @s;
  EXECUTE stmt;
  SET mode_val = @m;
  DEALLOCATE PREPARE stmt;
END$$
DELIMITER ;*/

-- CALL MY_MODE('Confirmed', '`corona virus dataset`', 1, 2020, @mode);
-- SELECT @mode;

-- CALL MY_MODE('Deaths', '`corona virus dataset`', 1, 2020, @mode);
-- SELECT @mode;

-- CALL MY_MODE('Recovered', '`corona virus dataset`', 1, 2020, @mode);
-- SELECT @mode;

-- SELECT YEAR(Date) as Year, MIN(Confirmed) as Min_Confirmed, MIN(Deaths) as Min_Deaths, MIN(Recovered) as Min_Recovered
-- FROM `corona virus dataset`
-- GROUP BY YEAR(Date);

-- SELECT YEAR(Date) as Year, MAX(Confirmed) as Max_Confirmed, MAX(Deaths) as Max_Deaths, MAX(Recovered) as Max_Recovered
-- FROM `corona virus dataset`
-- GROUP BY YEAR(Date);

-- SELECT YEAR(Date) as Year, MONTH(Date) as Month, SUM(Confirmed) as Total_Confirmed, SUM(Deaths) as Total_Deaths, SUM(Recovered) as Total_Recovered
-- FROM `corona virus dataset`
-- GROUP BY YEAR(Date), MONTH(Date);

/*SELECT 
    YEAR(Date) as Year, 
    MONTH(Date) as Month, 
    SUM(Confirmed) as Total_Confirmed, 
    AVG(Confirmed) as Average_Confirmed, 
    VAR_POP(Confirmed) as Variance_Confirmed, 
    STDDEV_POP(Confirmed) as STDEV_Confirmed
FROM `corona virus dataset`
GROUP BY YEAR(Date), MONTH(Date);*/

/*SELECT 
    YEAR(Date) as Year, 
    MONTH(Date) as Month, 
    SUM(Confirmed) as Total_Confirmed, 
    SUM(Deaths) as Total_Deaths, 
    AVG(Deaths) as Average_Deaths, 
    VAR_POP(Deaths) as Variance_Deaths, 
    STDDEV_POP(Deaths) as STDEV_Deaths
FROM `corona virus dataset`
GROUP BY YEAR(Date), MONTH(Date);*/

/*SELECT 
    YEAR(Date) as Year, 
    MONTH(Date) as Month, 
    SUM(Recovered) as Total_Recovered, 
    AVG(Recovered) as Average_Recovered, 
    VAR_POP(Recovered) as Variance_Recovered, 
    STDDEV_POP(Recovered) as STDEV_Recovered
FROM `corona virus dataset`
GROUP BY YEAR(Date), MONTH(Date);*/

/*SELECT `Country/Region`, MAX(Confirmed) as Highest_Confirmed
FROM `corona virus dataset`
GROUP BY `Country/Region`
ORDER BY Highest_Confirmed DESC
LIMIT 1;*/

/*SELECT `Country/Region`, MIN(Deaths) as Lowest_Deaths
FROM `corona virus dataset`
GROUP BY `Country/Region`
ORDER BY Lowest_Deaths DESC
LIMIT 1;*/

/*SELECT `Country/Region`, MAX(Recovered) as Highest_Recovered
FROM `corona virus dataset`
GROUP BY `Country/Region`
ORDER BY Highest_Recovered DESC
LIMIT 5;*/

-- SELECT *
-- FROM `corona virus dataset`
-- LIMIT 50;
