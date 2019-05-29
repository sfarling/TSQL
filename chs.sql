use Int_Catalyst
---
Select COUNT (*) from Requisition where ProcessingStateId <> 3
--
use Catalyst

--------------
--Catalog req
SELECT DISTINCT r.POID, DATEDIFF(MINUTE,rl.CreatedOn, GETDATE()) AS minutes, rl.ProcessingStateId, rl.RetryCounter, rl.BWSServer, r.BorgName, r.PONum, rl.ParCOID
from RequisitionLine rl 
Inner Join Requisition r on r.POID = rl.poid 
WHERE
	(rl.IsSPR = '0') 
	AND (rl.IsBillOnly = '0')
	AND (rl.IsRoundtrip = '0')
	AND (r.ProcessingStateId <> '3') 
	AND (rl.ProcessingStateId <> '3') 

Order by minutes desc

--Non Catalog req (General Req)
SELECT DISTINCT r.POID, DATEDIFF(MINUTE,rl.CreatedOn, GETDATE()) AS minutes, rl.ProcessingStateId, rl.RetryCounter, rl.BWSServer, r.BorgName,  r.PONum, rl.ParCOID
from RequisitionLine rl 
Inner Join Requisition r on r.POID = rl.poid 
WHERE 
	(
	r.ProcessingStateId <> '3') AND (rl.ProcessingStateId <> '3') 
	AND (rl.IsSPR = '1') 
	AND (rl.MMIS_ReqNumber = '')
	AND (rl.IsBillOnly = '0')
	OR
	(rl.IsBillOnly = '1')
	AND (r.ProcessingStateId <> '3') 
	AND (rl.ProcessingStateId <> '3')
	OR
	--Roundtrip
	(r.ProcessingStateId <> '3') AND (rl.ProcessingStateId <> '3') 
	AND (rl.IsRoundtrip = '1') 
	and (rl.IsSPR = '0') AND (rl.MMIS_ReqNumber = '')
Order by minutes desc
-----



DECLARE	@return_value int

EXEC	@return_value = [dbo].[ReTryErroredRequisitions]

SELECT	'Return Value' = @return_value

GO
--------------------
select r.*, rl.* 
from RequisitionLine rl
inner join Requisition r on r.POID = rl.POID
--where rl.ProcessingStateId <> 3
where r.PONum = '42-106242'
order by rl.POID desc 
--------------------
select DISTINCT COUNT (*) from dbo.Requisition where  ProcessingStateId = 0
select COUNT (*) from dbo.RequisitionLine where  ProcessingStateId = 0
-----
select * from dbo.RequisitionLine rl
	inner join server s on s.ParCOID = rl.ParCOID
	where rl.ProcessingStateId <> 3
----


select * from server

--
select * from Status where POID = '3150231'
select * from Status where ShortDescription <> 'OKAY' 



Select * from Status where POID = 2711562
select * from dbo.Requisition where ProcessingStateId <> 3
select * from dbo.Requisition where POID = '254204'
-- 1325201 1325213
select * from dbo.Requisition where POID = '2172935'
select * from dbo.Requisition where POID = '2711562'

select * from dbo.RequisitionLine where POID = '2852915'
select * from dbo.RequisitionLine where POID = '2239256'
select * from dbo.RequisitionLine where POID = '1802491'
select * from dbo.RequisitionLine where POID = '2380153'

select * from dbo.RequisitionLine where ParCOID = 0040
select * from dbo.RequisitionLine where MMIS_ReqNumber = ''
select * from server
-----
select * from Status where POID = 2323257
-----
update Status  set Processed = 0 where POID in (Select s.POID from Status s Inner Join Requisition r  on s.POID = r.POID and r.PONum = '31-46659')
------------------
Select * from RequisitionLine rl
Inner join Requisition r on rl.POID = r.POID and r.PONum = '122-11455'

-------------------------------------------------------
--------------
select * from dbo.Requisition where PONum = '122-11455' --610072
select * from dbo.Requisition where PONum = '122-11460' --610082
select * from dbo.Requisition where PONum = '42-87755-s' --610080


select * from dbo.Requisition where ProcessingStateId <> 3

select * from dbo.Requisition where PONum = '105-70229' 
--re-do 1300955 1300961
update dbo.Requisition
set ProcessingStateId = '0' where POID = '3150231' and ProcessingStateId <> '3'
and POID Not In(Select s.POID from Status s Inner Join Requisition r  on s.POID = r.POID)

update dbo.RequisitionLine
set ProcessingStateId = '0', BWSServer = '', MMIS_ReqNumber = '' where POID = '3150231' and ProcessingStateId <> '3'
and POID Not In(Select s.POID from Status s Inner Join Requisition r  on s.POID = r.POID)
-----------------
update dbo.RequisitionLine
set ProcessingStateId = '0', BWSServer = '', MMIS_ReqNumber = '' where POID = '2932424' and MMIS_ReqStatusId = 'UNKNOWN'
and POID Not In(Select s.POID from Status s Inner Join Requisition r  on s.POID = r.POID)
----------------
update dbo.RequisitionLine
set ProcessingStateId = '0', BWSServer = '' where MMIS_ReqStatusId = 'UNKNOWN'and InsertDateTime > DATEADD(DD, -2, GETDATE())
-------------
update dbo.RequisitionLine
set ProcessingStateId = '0', BWSServer = '', MMIS_ReqNumber = '' where POID = '2852915' and LineNum < '34'
--------------

select * from RequisitionLine where StatusCatalystID =  -1 and InsertDateTime > DATEADD(DD, -1, GETDATE())
-------

update dbo.RequisitionLine
set ProcessingStateId = '3'where POID = '3146240' 
update dbo.Requisition
set ProcessingStateId = '3' where POID = '3146240' 
-----------------

update dbo.RequisitionLine
set ProcessingStateId = '0', BWSServer = '', MMIS_ReqNumber = '' where POID = '1319800' and LineNum <> '2'
-----------------
select distinct poid, CreatedOn, BWSServer from RequisitionLine where StatusShortDesc = 'S009 error' order by POID desc
----
update dbo.Requisition 
set ProcessingStateId = '0' where ProcessingStateId = '-1'

update dbo.RequisitionLine
set ProcessingStateId = '0', BWSServer = '' where ProcessingStateId = '-1'
-----------------
---CAUTION!!!
update dbo.Requisition
set ProcessingStateId = '0'where ProcessingStateId <> 3 

update dbo.RequisitionLine
set ProcessingStateId = '0', BWSServer = '' where ProcessingStateId <> 3 
-----------------
select * from RequisitionLine where MMIS_ReqNumber = '42964'
--------

select Distinct r.PONum, r.POID, rl.MMIS_ReqNumber, rl.CreateDate from dbo.Requisition r
	Inner Join RequisitionLine rl on r.POID = rl.POID 
	where ParCOID = '143' and r.CreateDate > GETDATE()-2
	
select top 20 * from dbo.RequisitionLine where ParCOID = '143' and CreateDate > GETDATE()-1


select * from dbo.Requisition where ponum = '108-5461'

select * from dbo.RequisitionLine where StatusCatalystID = '14' order by POID

update RequisitionLine set ParCOID = '1012' where ParCOID = '0167'
-----------

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
--------------------------------------

----
select r.PONum, s.PONum AS PO, r.MMIS_ReqTypeId, s.ReqLineNumber, r.BorgName,
r.medibuy_DocTypeID from Requisition r
Inner Join status s  on s.POID = r.POID 
where r.BorgName = 'Flowers Hospital - 040'

select * from dbo.Requisition where ProcessingStateId <> 3
Delete from server where ParCOID = 147
--
select * from server order by ParCOID asc

select * from server where FacilityName like '%chest%'
select * from server where ParCOID like '%165%'
select * from server where ServerId = 'S00014'
--
INSERT INTO [Catalyst].[dbo].[Server]
           ([ParCOID]
           ,[ServerId]
           ,[LiveLibrary]
           ,[TrainLibrary]
           ,[FacilityName])
     VALUES
           ('1008'
           ,'S00014'
           ,'HOSPF1008'
           ,'HOSPF1008'
           ,'Lake Area'
           )
           
--------172
update Server set ServerId = 'S00060' where ParCOID = '0032'  --was S60001
update Server set LiveLibrary = 'HOSPF1030' where ParCOID = '0187'
--go live = HOSPF088
update Server set ParCOID = '1030' where ParCOID = '0187'
update Server set FacilityName = 'Mary Black Gaffney - 032' where ParCOID = '0032'
update Server set TrainLibrary = 'TRAIN932' where ParCOID = '937'
update Server set HmsVersion = '12' where ParCOID = '093'
select * from server where HmsVersion = 12
select * from server where FacilityName like '%jen%'
select * from server where FacilityName like '%pot%'
select * from server where FacilityName like '%brandy%'
select * from server where FacilityName like '%chest%'
select * from server where FacilityName like '%jen%'
update Server set HmsVersion = '12' where ParCOID = '171'
----
select * from server where ParCOID = 088
-------
delete from server where ParCOID = '0032'
------
------
select * from server where HmsVersion = NULL

---
---
update dbo.Requisition
set ProcessingStateId = '3'where POID = '2374320'

update dbo.RequisitionLine
set ProcessingStateId = '3' where POID = '2374320'

--
update dbo.Requisition
set Justification = 'TEST'where POID = '179'

--
update dbo.Requisition
set Justification = '12 Months of Service at 160.00/per month'where POID = '9331'

--
--
select COUNT (*)As Reqs, rl.ParCOID from dbo.Requisition r
inner join RequisitionLine rl on r.POID = rl.POID
--inner join Server s on rl.ParCOID = s.ParCOID
group by rl.ParCOID

--
select COUNT (*) from Requisition
--

Select r.BorgName from Requisition r
WHERE r.POID IN 
select DISTINCT req.poid, req.BorgName, rl.ParCOID from Requisition req
inner join RequisitionLine rl on req.POID = rl.POID

-----
----

Drop Table #tmp
Drop Table #tmp2
SELECT DISTINCT r.poid, r.BorgName, rl.ParCOID INTO #tmp from Requisition r
inner join RequisitionLine rl on r.POID = rl.POID


select COUNT (ParCOID) As Req_Count, ParCOID INTO #tmp2 from #tmp t
group by ParCOID

Select Req_Count, s.FacilityName from #tmp2 t2
inner join Server s on s.ParCOID = t2.ParCOID



-------------
select Distinct rl.ParCOID, from RequisitionLine rl
inner join Server s on s.ParCOID = rl.ParCOID

select rl.ParCOID, r.BorgName from RequisitionLine rl
inner join Requisition r on r.POID = rl.poid
where rl.ParCOID = '024'


update Server set FacilityName = 'Lea Regional Medical Center 024' where ParCOID = '024'

select * from server




---
SELECT DISTINCT rl.ParCOID from Requisition r
inner join RequisitionLine rl on r.POID = rl.POID
Group by rl.ParCOID
--
SELECT DISTINCT BorgName, MIN(CreateDate) from Requisition r
Group by BorgName




---
select count (*), ParCOID from dbo.RequisitionLine where RequisitionLine.IsSPR = 'true'
group by RequisitionLine.ParCOID

----
update dbo.RequisitionLine set parcoid =  '0167' where POID = 2939934

---
select rl.CostCenterID, rl.PartDesc, rl.ParItem, r.PONum, r.BorgName from dbo.RequisitionLine rl
inner join Requisition r on r.POID = rl.POID 
where ParCOID = 074  and ParItem = '101611' --and rl.LastEdited > '10/1/2010'
or ParCOID = 074  and ParItem = '101680'


----
select count (*) from dbo.RequisitionLine where LastEdited >= '2010-11-01 07:00' and LastEdited <= '2010-11-01 09:00'
select count (*) from dbo.RequisitionLine where LastEdited >= '2010-10-25 07:00' and LastEdited <= '2010-10-25 09:00'
select count (*) from dbo.RequisitionLine where LastEdited >= '2010-10-18 07:00' and LastEdited <= '2010-10-18 09:00'
select count (*) from dbo.RequisitionLine where LastEdited >= '2010-10-11 07:00' and LastEdited <= '2010-10-11 09:00'
----
select PONum from dbo.Requisition where LastEdited >= '2010-10-1' and LastEdited < '2010-11-01'

SELECT DATEDIFF(MINUTE,LastEdited, GETDATE()) from Requisition where ProcessingStateId <> 3
-----
select DISTINCT POID from RequisitionLine
WHERE ParCOID
Not In
(select ParCOID from server)
and ProcessingStateId <> 3
order by POID desc
---
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
           (2949578,
           1,
           12,
           'Req#',
           1,
           'Invalid Item',
           'Invalid Item',
           0
           )
GO

---



select * from RequisitionLine where ParItem = '7020'

-----
use CHSCCIL
Select * from CCIL
where VendorId = '144' or VendorId = '146' 
and 
IsRead='1'
---------------------------
use CHSCCIL
Delete from CCIL
where VendorId = '146'
---------------------------
use CHSCCIL
Select COUNT (*) from CCIL
where VendorId = '146'
--

select * from ccil
where VendorId = '066'
and BuyerPartNumber = '1735'
---------------------------
select COUNT (*) from CCIL where IsRead = 0
----
USE [Catalyst]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[ReTryErroredRequisitions]
		@Retries = 2

GO


---
select * from status where POID = 677807



select * from requisitionline where IsBillOnly = 'true' 
----------

	update RequisitionLine set ProcessingStateId = 0, BWSServer = '',RetryCounter=RetryCounter+1 
	where ProcessingStateId ='-1' 
	and RetryCounter < 2
	and POID Not In(Select s.POID from Status s Inner Join Requisition r  on s.POID = r.POID)
	
	update Requisition set ProcessingStateId = 0,RetryCounter=RetryCounter+1 where ProcessingStateId = '-1' 
	and RetryCounter < 2
	and POID Not In(Select s.POID from Status s Inner Join RequisitionLine r  on s.POID = r.POID)
	
	---
	Select r.PONum, rl. RetryCounter, rl.MMIS_ReqNumber, rl.StatusLongDesc, rl.StatusShortDesc, rl.LineNum, rl.BuyerPartNum, rl.MfrPartNum, rl.BorgName, rl.ParItem from RequisitionLine rl
	Inner Join Requisition r on rl.POID = r.POID
	where r.PONum = '100-1471959' 
	and 
	rl.LineNum = '1'
	--

	select * from RequisitionLine rl
	inner join Requisition r on r.POID = rl.POID
	where r.PONum = '42-82826' 



select * from RequisitionLine where ParCOID = '0187'

update dbo.Requisition
set ProcessingStateId = '0' 
where POID in (Select rl.POID from RequisitionLine rl Inner Join Requisition r  on rl.POID = r.POID and r.PONum = '51-30846')


update dbo.RequisitionLine
set ProcessingStateId = '0', BWSServer = '', MMIS_ReqNumber = '' 
where POID in (Select rl.POID from RequisitionLine rl Inner Join Requisition r  on rl.POID = r.POID and r.PONum = '51-30846')

