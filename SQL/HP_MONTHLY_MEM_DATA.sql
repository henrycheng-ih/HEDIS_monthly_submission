/******* NOTE *******/
--Change the [REP_POP_ID] column to the year of STARTDATE

SET NOCOUNT ON

DECLARE @STARTDATE as DATE
DECLARE @ENDDATE as DATE
SET @STARTDATE = '01/01/2020'
--SET @ENDDATE = '08/10/2020'
SET @ENDDATE = '12/31/2021'

SELECT DISTINCT
	CONVERT(varchar(10),CONVERT(DATE,MMR.[Run Date]),112) [dtmrun]
	,MMR.[Payment Date] [dtmpayment]
	,MMR.[Beneficiary ID] [chvmemnbr]
	--,tb1.MemberID [chvmemnbr]
	,COALESCE(MMR.[Hospice],'N') [chvhospice]
	,COALESCE(MMR.[LTI Flag],'N') [chvlti]
	,CAST(MMR.[LIS Premium Subsidy] as float) [dbllis_premium]
	,MMR.[Original Reason for Entitlement Code (OREC)] [dblorec]
	--,100 [dblrep_pop_id]
	/***** 2020 *****/
	,CASE 
		WHEN MMR.[Plan Benefit Package ID] IN ('007','009','007-MM','009-MM') THEN '1010'
		WHEN [Contract Number] = 'H5496' AND MMR.[Plan Benefit Package ID] IN ('005','005-MM') THEN '1020'
		WHEN MMR.[Plan Benefit Package ID] IN ('003','003-MM') THEN '2010'
		WHEN [Contract Number] = 'H2793' AND MMR.[Plan Benefit Package ID] IN ('005','005-MM') THEN '2020'
		WHEN MMR.[Plan Benefit Package ID] IN ('004','004-MM') THEN '2030'
		END [dblrep_pop_id]
	/***** 2019 *****/
	--,CASE 
	--	WHEN MMR.[Plan Benefit Package ID] IN ('007','009','007-MM','009-MM') THEN '1010'
	--	WHEN [Contract Number] = 'H5496' AND MMR.[Plan Benefit Package ID] IN ('005','005-MM') THEN '1020'
	--	WHEN MMR.[Plan Benefit Package ID] IN ('003','003-MM') THEN '2010'
	--	WHEN [Contract Number] = 'H2793' AND MMR.[Plan Benefit Package ID] IN ('005','005-MM','004','004-MM') THEN '2020'
	--	ELSE '1010'
	--	END [dblrep_pop_id]
	,'' [dblsrc_ind]
FROM [IHH_DW_DB].[dbo].[IHP_MMR] MMR
--LEFT JOIN (SELECT DISTINCT el.MemberID, el.[MedicareID] FROM IMP_DW.dbo.[vw_EList_ByMBI_mostRecent] el WHERE el.Source LIKE 'Imperial%') tb1 ON tb1.MedicareID = mmr.[Beneficiary ID]
WHERE
	CONVERT(DATE,[Payment Date]+'01') BETWEEN @STARTDATE AND @ENDDATE
	--AND tb1.MemberID IS NOT NULL