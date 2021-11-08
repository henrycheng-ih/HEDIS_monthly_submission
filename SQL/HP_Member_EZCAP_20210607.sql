SET NOCOUNT ON

DECLARE @STARTDATE as DATE
SET @STARTDATE = '12/31/2020'

SELECT DISTINCT
	el.[PATID] [memnbr]
	,el.LASTNM [memlname]
	,el.FIRSTNM [memfname]
	,ISNULL(el.MI,'') [memmname]
	,LTRIM(RTRIM(CONVERT(varchar(8),el.birth,112))) [memdob]
	,el.SEX [memgender]
	,el.PATID [subscribernbr]
	,LEFT(mh.OPT,3) [mcr_pbp]
	,el.PATID [HICN]
	,'' MRN
	,el.STREET [memaddr1]
	,ISNULL(el.STREET2,'') [memaddr2]
	,'' [memaddr3]
	,el.CITY [memcity]
	,el.STATE [memstate]
	,el.ZIP [memzip]
	,ISNULL(el.PHONE,'') [memphone1]
	,'' race
	,'' race_source
	,'' ethnicity
	,'' ethnicity_source
	,MC.MLANGUAGE spoken_language_s
	,MC.MLANGUAGE written_language_s
	,'' other_language_s
	,'' spoken_language
	,'' written_language
	,'' other_language
	,'' guardian_lname
	,'' guardian_fname
	,'' guardian_mname
	,'' mcr_snp_type
	,'' plan_employee
FROM IMPERIAL.[dbo].MEMB_COMPANY_V3 el
INNER JOIN IMPERIAL.dbo.MEMB_HPHISTS_V mh ON mh.MEMB_KEYID = el.MEMB_KEYID
INNER JOIN IMPERIAL.dbo.MEMB_COMPANY_V MC ON EL.MEMB_KEYID = MC.MEMB_KEYID
WHERE
	 mh.OPFROMDT <= @STARTDATE AND (mh.OPTHRUDT IS NULL OR mh.OPTHRUDT <= '12/31/2020')
	 AND NOT (mh.OPFROMDT = isnull(mh.OPTHRUDT, '20991231'))
	 AND el.LASTNM != 'MCF'

UNION ALL

SELECT DISTINCT
	el.[PATID] [memnbr]
	,el.LASTNM [memlname]
	,el.FIRSTNM [memfname]
	,ISNULL(el.MI,'') [memmname]
	,LTRIM(RTRIM(CONVERT(char,el.birth,112))) [memdob]
	,el.SEX [memgender]
	,el.PATID [subscribernbr]
	,LEFT(mh.OPT,3) [mcr_pbp]
	,el.PATID [HICN]
	,'' MRN
	,el.STREET [memaddr1]
	,ISNULL(el.STREET2,'') [memaddr2]
	,'' [memaddr3]
	,el.CITY [memcity]
	,el.STATE [memstate]
	,el.ZIP [memzip]
	,ISNULL(el.PHONE,'') [memphone1]
	,'' race
	,'' race_source
	,'' ethnicity
	,'' ethnicity_source
	,MC.MLANGUAGE spoken_language_s
	,MC.MLANGUAGE written_language_s
	,'' other_language_s
	,'' spoken_language
	,'' written_language
	,'' other_language
	,'' guardian_lname
	,'' guardian_fname
	,'' guardian_mname
	,'' mcr_snp_type
	,'' plan_employee
FROM H2793.[dbo].MEMB_COMPANY_V3 el
INNER JOIN H2793.dbo.MEMB_HPHISTS_V mh ON mh.MEMB_KEYID = el.MEMB_KEYID
INNER JOIN H2793.dbo.MEMB_COMPANY_V MC ON EL.MEMB_KEYID = MC.MEMB_KEYID
WHERE
	 mh.OPFROMDT <= @STARTDATE AND (mh.OPTHRUDT IS NULL OR mh.OPTHRUDT <= '12/31/2020')
	 AND NOT (mh.OPFROMDT = isnull(mh.OPTHRUDT, '20991231'))
	 AND el.LASTNM != 'MCF'
