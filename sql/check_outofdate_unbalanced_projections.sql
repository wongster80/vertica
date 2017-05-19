SELECT projection_name, anchor_table_name, is_prejoin, 
is_up_to_date 
FROM projections 
WHERE is_up_to_date = false;
