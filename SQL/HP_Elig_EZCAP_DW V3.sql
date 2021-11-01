/******* NOTE *******/
--Change the [REP_POP_ID] column to the year of ENDDATE
--Change the WHERE statement to the year of ENDDATE

SET NOCOUNT ON

DECLARE @STARTDATE as DATE
SET @STARTDATE = '01/01/2022'		--This date should ENDDATE +1

SELECT * FROm
(
SELECT DISTINCT
	el.PATID [memnbr]
	/***** 2020 & 2019 START ****/
	,CASE 
		WHEN mh.OPT IN ('007','009','007-MM','009-MM','012','012-MM') THEN '14129'
		WHEN mh.OPT IN ('005','005-MM') THEN '14378'
		WHEN mh.OPT IN ('011','011-MM') THEN '99999'
		END [REP_POP_ID]
	,'' [PO_NBR]
	,'' [mcd_cat]
	,LEFT(mh.OPT,3) [SNPTYPE]
	,CONVERT(varchar(8),mh.OPFROMDT,112) [elig_start]
	,ISNULL(CONVERT(varchar(8),mh.OPTHRUDT,112),'20991231') [elig_end]
	,'P' [delig_ind]
	,'N' [hospice_ben]
	,'Y' [medical_ben]
	,'Y' [rx_ben]
	,'Y' [dental_ben]
	,'Y' [mh_inp_ben]
	,'Y' [mh_dn_ben]
	,'Y' [mh_outer_ben]
	,'Y' [cd_inp_ben]
	,'Y' [cd_dn_ben]
	,'Y' [cd_outer_ben]
FROM IMPERIAL.[dbo].MEMB_COMPANY_V el
INNER JOIN IMPERIAL.dbo.MEMB_HPHISTS_V mh ON mh.MEMB_KEYID = el.MEMB_KEYID
WHERE
	 mh.OPFROMDT < @STARTDATE
	 AND NOT (el.PATID IS NULL OR RTRIM(el.PATID) = '')
UNION ALL
SELECT DISTINCT
	el.PATID [memnbr]
	/***** 2020 START ****/
	,CASE 
		WHEN mh.OPT IN ('003','003-MM','007','007-MM') THEN '14993'
		WHEN mh.OPT IN ('005','005-MM') THEN '14994'
		WHEN mh.OPT IN ('004','004-MM') THEN '14995'
		ELSE ''
	 END [REP_POP_ID]
	,'' [PO_NBR]
	,'' [mcd_cat]
	,LEFT(mh.OPT,3) [SNPTYPE]
	,CONVERT(varchar(8),mh.OPFROMDT,112) [elig_start]
	,ISNULL(CONVERT(varchar(8),mh.OPTHRUDT,112),'20991231') [elig_end]
	,'P' [delig_ind]
	,'N' [hospice_ben]
	,'Y' [medical_ben]
	,'Y' [rx_ben]
	,'Y' [dental_ben]
	,'Y' [mh_inp_ben]
	,'Y' [mh_dn_ben]
	,'Y' [mh_outer_ben]
	,'Y' [cd_inp_ben]
	,'Y' [cd_dn_ben]
	,'Y' [cd_outer_ben]
FROM H2793.[dbo].MEMB_COMPANY_V el
INNER JOIN H2793.dbo.MEMB_HPHISTS_V mh ON mh.MEMB_KEYID = el.MEMB_KEYID
WHERE
	 mh.OPFROMDT < @STARTDATE
	 AND NOT (el.PATID IS NULL OR RTRIM(el.PATID) = '')
) t1
WHERE
	NOT [elig_start] = [elig_end]
