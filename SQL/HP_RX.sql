--111995
SELECT DISTINCT
	--LEFT(CLM.MemberID,CHARINDEX('*',CLM.MemberID)-1) [memnbr]
	EL2.[Medicare ID] [memnbr]
	, CLM.ClaimAuthNumber [claim_id]
	, CLM.NPI [provnbr]
	, CLM.FillDate [pres_fill_dt]
	, CLM.NDC [ndc]
	, CLM.DaysSupply [days_suppl]
	, CLM.ClaimStatus [claim_status]
	, CLM.DecimalQuantity [metric_qty]
	, CLM.Quantity [disp_qty]
	, PrescriberID [prov_npi]--
	, NPI [pharm_npi]--
	, CLM.ClaimSource [source]
	, '' [src_ind]
FROM IHP_DW_DB.dbo.IHP_ENVISION_CLM CLM
	LEFT JOIN 
		(SELECT DISTINCT EL.[Member ID], EL.[Medicare ID] ,EL.[File Date] 
		FROM IHP_DW_DB.dbo.EList_IHP EL
		WHERE EL.[File Date] = (SELECT MAX([File Date]) FROM IHP_DW_DB.dbo.EList_IHP WHERE EL.[Member ID] = [Member ID])) EL2
	ON EL2.[Member ID] = LEFT(CLM.MemberID,CHARINDEX('*',CLM.MemberID)-1)



--SELECT ClaimAuthNumber, COUNT(*)
--FROM IHP_DW_DB.dbo.IHP_ENVISION_CLM
--GROUP BY ClaimAuthNumber
--HAVING COUNT(*) > 1


--SELECT *
--FROM IHP_DW_DB.dbo.IHP_ENVISION_CLM

