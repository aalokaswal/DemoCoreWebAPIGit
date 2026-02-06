Copy Paste in  ANISTATS1 SP look for below code and just copy paste. 
------------------------------------------------------------------------------
SET @sql_stmt = N'
;WITH StatsCTE AS (
    SELECT
        PERCENTILE_CONT(' + CAST(@pper AS VARCHAR(10)) + ') WITHIN GROUP (ORDER BY ' + QUOTENAME(@paniname) + ') OVER (PARTITION BY SITE_NAME) AS pctl_val,
        MAX(' + QUOTENAME(@paniname) + ') OVER (PARTITION BY SITE_NAME) AS max_val,
        AVG(' + QUOTENAME(@paniname) + ') OVER (PARTITION BY SITE_NAME) AS avg_val,
        STDEV(' + QUOTENAME(@paniname) + ') OVER (PARTITION BY SITE_NAME) AS stddev_val,
        ROW_NUMBER() OVER (PARTITION BY SITE_NAME ORDER BY (SELECT NULL)) AS rn
    FROM ' + @usetable + '
    WHERE SITE_NAME = @psite_name
      AND ' + QUOTENAME(@paniname) + ' IS NOT NULL  -- Add this line
)
SELECT TOP 1 @pperval_out = pctl_val,
             @pmaxval_out = max_val,
             @xavg_out = avg_val,
             @xstddev_out = stddev_val
FROM StatsCTE
WHERE rn = 1
';


----------------------------------------------------------------------------
Then Run This query:- 

exec [BEFS_ADMIN].[BEFSUP_LIMS1] 
  '2026-02-11 00:00:00',
   '2021-12-16 00:00:00',
   '2021-12-17 00:00:00';

It wll take take time .. it will save data in SCUPRPT table with corret message
----------------------------------------------------------------------------
Run this query you will data from DATEOF='2026-02-11 00:00:00'

 select * from SCUPRPT order by DATEOF desc
