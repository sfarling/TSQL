use Int_Catalyst
---
use ProcurementSuite

select count (*)AS unprocessed_reqs from dbo.RequisitionLines where ProcessingStateId <> 3
------------
--Req
use ProcurementSuite
SELECT  r.POID, DATEDIFF(MINUTE,r.DB_CreatedOn, GETDATE()) AS minutes, r.ProcessingStateId, r.Poid, r.BWSServer, r.RequisitionNumber, r.RetryCounter, r.BuyerPartNumber, r.LineNumber
from RequisitionLines r where r.ProcessingStateId <> 3
Order by minutes desc



---
select * from status where Processed = 0
select * from status where POID = '63842'
----
update status
	set Processed = 0, StatusId = 304
	where POID IN(select s.POID from status s
	inner join RequisitionLine rl on rl.POID= s.POID
	where s.StatusId= 12 and rl.JITFlag='S')
----


select top 100 r.ProcessingStateId, r.PONum, rl.BWSServer, rl.MMIS_ReqNumber, r.LastEdited
from RequisitionLine rl inner join Requisition r on r.poid = rl.poid
Where r.LastEdited > GETDATE() -1
order by rl.LastEdited desc
--------------------

Select * from Status where POID = 46126

select * from dbo.RequisitionLines where ProcessingStateId <> 3

select * from dbo.RequisitionLines where POID = '63842'
select * from RequisitionLines where RequisitionNumber = '213-5'
select * from RequisitionLines where RequisitionNumber = '1-149-s'

select * from RequisitionLineStatuses where POID = 51118
select * from Status where Processed = 0
select COUNT (*) from Status where Processed = 1
select top 1000 * from Status order by poid desc


--
select * from Status where POID =  63278
---


update dbo.RequisitionLines 
set ProcessingStateId = '0', BWSServer = '' where POID = '63842' and ProcessingStateId  = -1 
and POID Not In(Select s.POID from Status s where s.POID = '63842')


update dbo.RequisitionLines 
set ProcessingStateId = '0', BWSServer = '' where RequisitionNumber = '1-149-s' and ProcessingStateId = -1 
and POID Not In(Select s.POID from Status s where s.PONum = '1-149-s')
and LineNumber = 3



update dbo.RequisitionLines
set ProcessingStateId = '3' where POID = '63048' and ProcessingStateId <> '3' 

update dbo.RequisitionLines
set ProcessingStateId = '3'where RequisitionNumber = '1-149-s' and ProcessingStateId <> '3' 

--
update dbo.RequisitionLines
set MMIS_StockLocation = '11.8313' where RequisitionNumber = '1-149-s' and ProcessingStateId <> '3' 

update dbo.RequisitionLines
set ProcessingStateId = '3', BWSServer = '' where ProcessingStateId <> 3 
and poid in(42572, 42573)
-----------------

--------
update dbo.RequisitionLines
set BWSServer = '', ProcessingStateId = '0' where  ProcessingStateId = '-1'



select * from dbo.RequisitionLine where ProcessingStateId <> 3
and 
POID Not In(Select s.POID from Status s Inner Join RequisitionLine r  on s.POID = r.POID)
select * from dbo.Requisition where ProcessingStateId <> 3
and 
POID Not In(Select s.POID from Status s Inner Join Requisition r  on s.POID = r.POID)
-----------------------

update dbo.Requisition 
set ProcessingStateId = '0' where ProcessingStateId <> 3
and 
POID Not In(Select s.POID from Status s Inner Join Requisition r  on s.POID = r.POID)

update dbo.RequisitionLine
set ProcessingStateId = '0', BWSServer = '' where ProcessingStateId <> 3
and 
POID Not In(Select s.POID from Status s Inner Join RequisitionLine r  on s.POID = r.POID)
update RequisitionLine set PartDesc = 'Thank you note cards for volunteers' where POID=  19265

INSERT INTO [Catalyst].[dbo].[Status]
           ([POID]
           ,[ReqLineNumber]
           ,[StatusId]
           ,[PONum]
           ,[POLine]
           ,[ShortDescription]
           ,[LongDescription]
           ,[Processed])
     VALUES
           (63048
           ,1
           ,12
           ,'Invalid Account'
           ,'1'
           ,'Invalid Account'
           ,'Invalid Account'
           ,0)
GO
--------------------------------------

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
ID = 19306
and 
MmisUpdateStatus = 'Error' 

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
Select * from Ccat where DbUpdateTime > '2015-06-01' and MmisUpdateStatus = 'Complete'
and NUV_APRV_CONT_PRICE <> ''
order by MmisUpdateStatus desc



