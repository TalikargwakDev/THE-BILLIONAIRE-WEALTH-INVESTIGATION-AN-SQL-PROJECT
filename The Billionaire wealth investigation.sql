-- 1 Retrieving the 20 richest billionaires.
	SELECT rank, name, networth_billion, country,industry
    FROM Top200RichestPersonintheWorld
    ORDER by networth_billion desc
    LIMIT 20;
    
    
   -- 2. Identification of the five youngest billionaires.
   		SELECT rank, name, age, networth_billion, country, industry
        FROM Top200RichestPersonintheWorld
        order by age ASC
        LIMIT 5;
        
        
        
        -- 3 Calculation of the average age and average net worth.
        SELECT AVG(age) AS AVERAGE_AGE, AVG(networth_billion) AS AVERAGE_NETWORTH
        FROM Top200RichestPersonintheWorld;
        
        
        
        
        -- 4 Identification of the five most represented countries.
        SELECT country, count(*) AS total
        FROM Top200RichestPersonintheWorld
        GROUP BY country
        order by total DESC
        limit 5;
        
        
        
        -- 5 Calculation of the combined net worth of billionaires from each country.
        SELECT country, SUM(networth_billion) AS TOTAL_NETWORTH
        FROM Top200RichestPersonintheWorld
        GROUP BY country
        ORDER BY TOTAL_NETWORTH DESC;
        
        
 		-- 6 Identification of the five industries with the highest number of billionaires.
        SELECT industry, count(*) as total
        from Top200RichestPersonintheWorld
        group by industry
        order by total DESC
        LIMIT 5;
        
        
        
      -- 7 Finding countries with at least five billionaires.
      SELECT country, count (*) as total 
      from Top200RichestPersonintheWorld
      GROUP by country
       HAVING COUNT (*) >= 5
      order by total desc;
      
      
      
      -- 8. Calculation of the total wealth of billionaires younger than 50.
      select SUM(networth_billion) AS Total_Wealth_Aged_Under_50
      FROM Top200RichestPersonintheWorld
      WHERE age < 50;
      
      
      
      -- 9. Identify billionaires whose net worth exceeds the overall average net worth.
		SELECT RANK, name, networth_billion, country
        FROM Top200RichestPersonintheWorld
        WHERE networth_billion > (SELECT AVG(networth_billion) FROM Top200RichestPersonintheWorld)
        ORDER BY networth_billion DESC ;
        
        
-- 10.Identify the industry with the highest average net worth.
		SELECT industry, AVG(networth_billion) AS AVERAGE_NETWORTH
        FROM Top200RichestPersonintheWorld
        GROUP BY industry
        ORDER BY AVERAGE_NETWORTH DESC
        LIMIT 1;
        
        
        
   
   -- 11 Analizing Wealth concentration by country (percentage share)
    --  that is what percentage of wealth is held by the wealthiest countries.
    SELECT country, SUM(networth_billion) AS COUNTRY_WEALTH,
    ROUND(100 * SUM(networth_billion) / (SELECT SUM(networth_billion) FROM Top200RichestPersonintheWorld), 2)
    AS WEALTH_PERCENTAGE
    FROM Top200RichestPersonintheWorld
    GROUP BY country
    ORDER BY COUNTRY_WEALTH DESC;
    
    
    -- 12 Comparing genarational wealth (Age Brackets) 
    -- that is how does total net worth and average networth differ across age generations (under 40, 40-59, 60-79 and 80+)
    SELECT case WHEN age < 40 then 'Under 40'
    			WHEN age BETWEEN 41 and 59 then '40-59'
                when age BETWEEN 60 and 79 THEN '60-79'
                else '80+'
                end as AGE_BRACKET,
                COUNT(*) AS BILLIONAIRE_COUNT,
                SUM(networth_billion) AS TOTAL_WEALTH,
                ROUND(AVG(networth_billion), 2) AS AVG_WEALTH
    FROM Top200RichestPersonintheWorld
    GROUP BY AGE_BRACKET
    ORDER BY TOTAL_WEALTH DESC;
    
    
    
    
-- 13 Richest Billionaire in each industry
	SELECT industry, name,
    MAX(networth_billion) AS networth 
    FROM Top200RichestPersonintheWorld
    GROUP BY industry
    ORDER BY networth DESC;
    
    
    
    
    
-- 14 identification of young disruptors Billionaires under the age of 50 and ranked in top 50
   SELECT rank, name, age, networth_billion, industry, country
   FROM Top200RichestPersonintheWorld
   WHERE age < 50 and rank <= 50;
   
   
   
   
-- 15   identification of industry wealth disparity
-- that is gap between highest billionaire and lowest billionaire in each industry 
   SELECT industry, 
   		MAX(networth_billion) AS max_networth,
        MIN(networth_billion) as min_networth,
        ROUND(MAX(networth_billion)-MIN(networth_billion), 1) as Wealth_Gap
   FROM Top200RichestPersonintheWorld
   GROUP by industry
   ORDER BY Wealth_Gap desc;
    
    
    
    
    
    
    
    
    
    
    

    
    
    
        