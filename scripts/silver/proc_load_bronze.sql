USE bronze;

DELIMITER //

CREATE PROCEDURE load_bronze()
BEGIN

	DECLARE start_time  DATETIME;
    DECLARE end_time DATETIME;
		
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SELECT 'An error occurred while loading bronze layer' AS Error_Message;
    END;

	-- start ETL timer 
    SET start_time = NOW();
    -- Load the first table
    SELECT * FROM crm_cust_info;

    -- Load the second table
    SELECT * FROM crm_prd_info;

    -- Load the third table
    SELECT * FROM crm_sales_details;

    -- Load the fourth table
    SELECT * FROM erp_cust_az12;

    -- Load the fifth table
    SELECT * FROM erp_loc_a101;

    -- Load the sixth table
    SELECT * FROM erp_px_cat_g1v2;
    
    -- end ETL time
    SET end_time = NOW();
     SELECT
        start_time AS Start_Time,
        end_time AS End_Time,
        TIMESTAMPDIFF(SECOND, start_time, end_time) AS Duration_Seconds;

    

END //

DELIMITER ;

SHOW PROCEDURE STATUS
WHERE Db = 'bronze';

CALL LOAD_bronze

