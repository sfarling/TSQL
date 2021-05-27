
Use NuviaToCustomer
Select Count (*) AS Pending 
from Ccat where MmisUpdateStatus = 'Pending' 

Select Count (*) AS Error
from Ccat where MmisUpdateStatus = 'Error'

Select Count (*) AS Complete
from Ccat where MmisUpdateStatus = 'Complete'
---------------------------------------------
Select *
from Ccat where MmisUpdateStatus = 'Pending'
----------------------------------------------
update Ccat set MmisUpdateStatus  = 'Pending', MmisUpdateNote = '' 
where 
--ID > 1938
ID > 963
and 
MmisUpdateStatus = 'ScriptError' 

update Ccat set MmisUpdateStatus  = 'Pending' where MmisUpdateStatus = 'Error' and DbUpdateTime > Getdate() - 60

update Ccat set MmisUpdateStatus  = 'Error' where MmisUpdateStatus = 'Pending'
----------------------------------------------
update Ccat set MmisUpdateStatus  = 'Complete' where DbUpdateTime < Getdate() - 10
----------------------------------------------

update Ccat set MmisUpdateStatus  = 'Pending' where ID = 20434


Select * from Ccat where  ID = 20434
--------------
Select * from Ccat where PROVIDER_ITEM_NUM = '0043278' 
Select * from Ccat where PROVIDER_ITEM_NUM = '0008220' 
----
Select count (*) from ccat where NUV_APRV_CONT_PRICE <> ''
Select * from ccat where NUV_APRV_CONT_PRICE <> ''

Select * from ccat where NUV_APRV_CONT_PRICE = ''

Select GHX_RECORD_ID, NUV_APRV_CONT_PRICE from Ccat where GHX_RECORD_ID = '66900848' 
----
Select NUV_APRV_CONT_PRICE from Ccat where VENDOR_PART_NUM = '1003381-13'
Select * from Ccat where VENDOR_PART_NUM = '1003381-13'
Select count (*) NUV_APRV_CONT_PRICE from Ccat where NUV_APRV_CONT_PRICE = ''
----------------------------------------------
Select * from Ccat where ID = 32209
Select * from Ccat where ID = 30805
----------------------------------------------
Select * from Ccat where MmisUpdateStatus = 'Error'
Select * from Ccat where MmisUpdateStatus = 'Pemding'
----------------------------------------------
Select * from Ccat where DbUpdateTime > '2020-10-16 18:45:08.680' and MmisUpdateStatus = 'Complete'
and NUV_APRV_CONT_PRICE <> ''
order by MmisUpdateStatus desc
