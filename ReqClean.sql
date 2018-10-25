use catalyst


Delete
from RequisitionLine 
where CreatedOn <= '2016-2-01' 


Delete
from Requisition
where CreatedOn <= '2016-2-01' 

select top 100000 *
from Status
order by POID asc

select COUNT (*) from Status

delete from Status where Processed = 1