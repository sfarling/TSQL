use catalyst
Drop Table #tmp
Drop Table #tmp2

SELECT DISTINCT r.poid, r.BorgName, rl.ParCOID INTO #tmp from Requisition r
inner join RequisitionLine rl on r.POID = rl.POID
where r.CreatedOn >= '2015-10-01' and r.CreatedOn < '2015-11-01'


select COUNT (ParCOID) As Req_Count, ParCOID INTO #tmp2 from #tmp t
group by ParCOID

Select Distinct s.ParCOID, s.FacilityName, Req_Count from #tmp2 t2
inner join Server s on s.ParCOID = t2.ParCOID
