-- ==============================
-- Start CDC Capture Job Template
-- ==============================
USE [WorldCup2022]
GO

EXEC [sys].[sp_cdc_start_job]
	 @job_type = N'capture'
GO 

-- Add job cleanup
EXEC [sys].[sp_cdc_add_job] 
	 @job_type = N 'capture'  
    ,@start_job = 1  
    ,@maxtrans = 10000   
    ,@maxscans = 10  
    ,@continuous = 1   
    ,@pollinginterval = 86399   
    --,@retention ] = retention 
    ,@threshold = 10080   

-- Add job cleanup
EXEC [sys].[sp_cdc_add_job] 
	 @job_type = N 'cleanup'  
    ,@start_job = 1  
    ,@maxtrans = 10000   
    ,@maxscans = 10  
    ,@continuous = 1   
    ,@pollinginterval = 86399   
    ,@retention ] = 2880 
    ,@threshold = 10080 

	--max_trans is valid only for capture jobs.
	--max_scan is valid only for capture jobs.
	--continuous is valid only for capture jobs.

	--retention is valid only for cleanup jobs.