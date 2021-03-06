/*********************************************
Author:	Henry Cheng
Date:	10/22/21

This is a modified version of July file that Darin and Patrick have worked on with Lifan (TMG).
Previous versions are in S:\~ Data Management ~\SQL\HEDIS\TMG\Archive
*********************************************/

IF OBJECT_ID('tempdb..#temp_claim') IS NOT NULL
DROP TABLE #temp_claim;

WITH SPEC_TB AS (
SELECT 'Allergy Immunology' SPECNAME, '207K00000X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Anesthesiology' SPECNAME, '207L00000X' TAXONOMY, 'ANESTHESIOLOGIST' DESCR, 'ANES' SHORT, '7' SPEC_ID UNION ALL
SELECT 'Cardiology, Pediatrics' SPECNAME, '2080P0202X' TAXONOMY, 'CARDIOLOGY' DESCR, 'CARD' SHORT, '17' SPEC_ID UNION ALL
SELECT 'Cardiothoracic Surgery' SPECNAME, '208G00000X' TAXONOMY, 'SURGEON' DESCR, 'SURG' SHORT, '14' SPEC_ID UNION ALL
SELECT 'Cardiovascular Disease' SPECNAME, '207RC0000X' TAXONOMY, 'CARDIOLOGY' DESCR, 'CARD' SHORT, '17' SPEC_ID UNION ALL
SELECT 'Clinical Genetics' SPECNAME, '207SG0201X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Clinical Laboratory' SPECNAME, '291U00000X' TAXONOMY, 'HOSPITAL' DESCR, 'HOSP' SHORT, '12' SPEC_ID UNION ALL
SELECT 'Dermatology' SPECNAME, '207N00000X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Diagnostic Radiology' SPECNAME, '2085R0202X' TAXONOMY, 'HOSPITAL' DESCR, 'HOSP' SHORT, '12' SPEC_ID UNION ALL
SELECT 'Emergency Medicine' SPECNAME, '207P00000X' TAXONOMY, 'HOSPITAL' DESCR, 'HOSP' SHORT, '12' SPEC_ID UNION ALL
SELECT 'Endocrinology' SPECNAME, '207RE0101X' TAXONOMY, 'ENDOCHRONOLOGY' DESCR, 'ENDO' SHORT, '19' SPEC_ID UNION ALL
SELECT 'Family Practice' SPECNAME, '207Q00000X' TAXONOMY, 'PCP' DESCR, 'PCP' SHORT, '1' SPEC_ID UNION ALL
SELECT 'Gastroenterology' SPECNAME, '207RG0100X' TAXONOMY, 'GASTROENTOLOGY' DESCR, 'GASTRO' SHORT, '18' SPEC_ID UNION ALL
SELECT 'General Practice' SPECNAME, '208D00000X' TAXONOMY, 'PCP' DESCR, 'PCP' SHORT, '1' SPEC_ID UNION ALL
SELECT 'General Surgery' SPECNAME, '208600000X' TAXONOMY, 'SURGEON' DESCR, 'SURG' SHORT, '14' SPEC_ID UNION ALL
SELECT 'Geriatric Medicine' SPECNAME, '207RG0300X' TAXONOMY, 'PCP' DESCR, 'PCP' SHORT, '1' SPEC_ID UNION ALL
SELECT 'Hematology' SPECNAME, '207RH0000X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Hematology/Oncology' SPECNAME, '207RH0003X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Hospital (General Acute Care)' SPECNAME, '282N00000X' TAXONOMY, 'HOSPITAL' DESCR, 'HOSP' SHORT, '12' SPEC_ID UNION ALL
SELECT 'Hospital (Long Term Care)' SPECNAME, '282E00000X' TAXONOMY, 'HOSPITAL' DESCR, 'HOSP' SHORT, '12' SPEC_ID UNION ALL
SELECT 'Internal Medicine' SPECNAME, '207R00000X' TAXONOMY, 'PCP' DESCR, 'PCP' SHORT, '1' SPEC_ID UNION ALL
SELECT 'Interventional Cardiology' SPECNAME, '207RI0011X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Interventional Radiology' SPECNAME, '2085R0204X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Marriage & Family Therapist' SPECNAME, '106H00000X' TAXONOMY, 'MH PROVIDER' DESCR, 'MHPROV' SHORT, '3' SPEC_ID UNION ALL
SELECT 'Maternal Fetal Medicine' SPECNAME, '207VM0101X' TAXONOMY, 'OBGYN' DESCR, 'OBGYN' SHORT, '2' SPEC_ID UNION ALL
SELECT 'Medical Oncology' SPECNAME, '207RX0202X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Midwife (Nursing)' SPECNAME, '367A00000X' TAXONOMY, 'OBGYN' DESCR, 'OBGYN' SHORT, '2' SPEC_ID UNION ALL
SELECT 'Neonatal-Perinatal Medicine' SPECNAME, '2080N0001X' TAXONOMY, 'OBGYN' DESCR, 'OBGYN' SHORT, '2' SPEC_ID UNION ALL
SELECT 'Nephrology' SPECNAME, '207RN0300X' TAXONOMY, 'NEPHROLOGIST' DESCR, 'NEPH' SHORT, '6' SPEC_ID UNION ALL
SELECT 'Neurology' SPECNAME, '2084N0400X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Neurosurgery' SPECNAME, '207T00000X' TAXONOMY, 'SURGEON' DESCR, 'SURG' SHORT, '14' SPEC_ID UNION ALL
SELECT 'Nuclear Medicine' SPECNAME, '207U00000X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Nuclear Radiology' SPECNAME, '2085N0904X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Nurse Practitioner' SPECNAME, '363L00000X' TAXONOMY, 'NURSE PRACTITIONER' DESCR, 'NPR' SHORT, '8' SPEC_ID UNION ALL
SELECT 'Obstetrics Gynecology' SPECNAME, '207V00000X' TAXONOMY, 'OBGYN' DESCR, 'OBGYN' SHORT, '2' SPEC_ID UNION ALL
SELECT 'Ophthalmology' SPECNAME, '207W00000X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Optometry' SPECNAME, '152W00000X' TAXONOMY, 'EYE CARE' DESCR, 'EYECPROV' SHORT, '4' SPEC_ID UNION ALL
SELECT 'Oral & Maxillofacial Surgery' SPECNAME, '204E00000X' TAXONOMY, 'DENTIST' DESCR, 'DENTIST' SHORT, '5' SPEC_ID UNION ALL
SELECT 'Orthopedic Surgery' SPECNAME, '207X00000X' TAXONOMY, 'SURGEON' DESCR, 'SURG' SHORT, '14' SPEC_ID UNION ALL
SELECT 'Otolaryngology' SPECNAME, '207Y00000X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Pain Management' SPECNAME, '208VP0000X' TAXONOMY, 'ANESTHESIOLOGIST' DESCR, 'ANES' SHORT, '7' SPEC_ID UNION ALL
SELECT 'Pathology' SPECNAME, '207ZP0102X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Pathology' SPECNAME, '207ZP0102X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Pediatric Allergy & Immunology' SPECNAME, '2080P0201X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Pediatric Critical Care Medicine' SPECNAME, '2080P0203X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Pediatric Dermatology' SPECNAME, '207NP0225X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Pediatric Emergency Medicine' SPECNAME, '2080P0204X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Pediatric Endocrinology' SPECNAME, '2080P0205X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Pediatric Gastroenterology' SPECNAME, '2080P0206X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Pediatric Hematology-Oncology' SPECNAME, '2080P0207X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Pediatric Infectious Diseases' SPECNAME, '2080P0208X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Pediatric Medicine' SPECNAME, '208000000X' TAXONOMY, 'PCP' DESCR, 'PCP' SHORT, '1' SPEC_ID UNION ALL
SELECT 'Pediatric Nephrology' SPECNAME, '2080P0210X' TAXONOMY, 'NEPHROLOGIST' DESCR, 'NEPH' SHORT, '6' SPEC_ID UNION ALL
SELECT 'Pediatric Neurology' SPECNAME, '2084N0402X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Pediatric Pulmonology' SPECNAME, '2080P0214X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Pediatric Radiology' SPECNAME, '2085P0229X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Pediatric Surgery' SPECNAME, '2086S0120X' TAXONOMY, 'SURGEON' DESCR, 'SURG' SHORT, '14' SPEC_ID UNION ALL
SELECT 'Pediatric Urology' SPECNAME, '2088P0231X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Pediatrics' SPECNAME, '208000000X' TAXONOMY, 'PCP' DESCR, 'PCP' SHORT, '1' SPEC_ID UNION ALL
SELECT 'Pharmacy' SPECNAME, '333600000X' TAXONOMY, 'CLINICAL PHARMACIST' DESCR, 'CLINIPHARM' SHORT, '11' SPEC_ID UNION ALL
SELECT 'Physical Medicine and Rehabilitation' SPECNAME, '208100000X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Physical Therapy' SPECNAME, '225100000X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Physician Assistant' SPECNAME, '363A00000X' TAXONOMY, 'PHYSICIAN ASSISTANT' DESCR, 'PAS' SHORT, '9' SPEC_ID UNION ALL
SELECT 'Plastic and Reconstructive Surgery' SPECNAME, '2086S0122X' TAXONOMY, 'SURGEON' DESCR, 'SURG' SHORT, '14' SPEC_ID UNION ALL
SELECT 'Podiatry' SPECNAME, '213E00000X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Psychiatry' SPECNAME, '2084P0800X' TAXONOMY, 'MH PROVIDER' DESCR, 'MHPROV' SHORT, '3' SPEC_ID UNION ALL
SELECT 'Psychology' SPECNAME, '103T00000X' TAXONOMY, 'MH PROVIDER' DESCR, 'MHPROV' SHORT, '3' SPEC_ID UNION ALL
SELECT 'Pulmonary Disease' SPECNAME, '207RP1001X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Radiation Oncology' SPECNAME, '2085R0001X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Registered Dietician/Nutrition' SPECNAME, '133V00000X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Retina Vitreous' SPECNAME, 'N/A' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Rheumatology' SPECNAME, '207RR0500X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Skilled Nursing Facility' SPECNAME, '314000000X' TAXONOMY, 'SNF' DESCR, 'SNF' SHORT, '13' SPEC_ID UNION ALL
SELECT 'Sleep Medicine' SPECNAME, '207RS0012X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Social Worker (Clinical)' SPECNAME, '1041C0700X' TAXONOMY, 'MH PROVIDER' DESCR, 'MHPROV' SHORT, '3' SPEC_ID UNION ALL
SELECT 'Speech Pathology' SPECNAME, '235Z00000X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Sports Medicine (Ortho)' SPECNAME, '207XX0005X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Surgery' SPECNAME, '208600000X' TAXONOMY, 'SURGEON' DESCR, 'SURG' SHORT, '14' SPEC_ID UNION ALL
SELECT 'Urgent Care' SPECNAME, '261QU0200X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Uro-Gynecology' SPECNAME, '207VF0040' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Urology' SPECNAME, '208800000X' TAXONOMY, 'UNSPECIFIED' DESCR, 'UNS' SHORT, '99' SPEC_ID UNION ALL
SELECT 'Vascular Surgery' SPECNAME, '2086S0129X' TAXONOMY, 'SURGEON' DESCR, 'SURG' SHORT, '14' SPEC_ID
)

SELECT DISTINCT
	dw.MedicareID memnbr
	,cm.ClaimID claimid
	,ROW_NUMBER() OVER (PARTITION BY cm.ClaimID ORDER BY ci.ProcCode) "linenbr"	--check
	,LTRIM(RTRIM(convert(char,ci.SvcFromDate,101))) fromdt	--check
	,LTRIM(RTRIM(convert(char,ci.SvcToDate,101))) thrudt	--check
	,pv.NationalPVID provnbr
	,COALESCE((Select DISTINCT SPEC_ID from IHHProdReplica.dbo.specialties SPEC INNER JOIN SPEC_TB ON SPEC_TB.TAXONOMY = SPEC.TaxonomyCode where specialtyid = pa.specialtyid),99) provspec
	,COALESCE(ci.ProcCode,'') cpt
	,'' cptmod1
	,'' cptmod2
	,'' hcpcs
	,'' [cpt_ii]
	,'' [cpt_iimod]
	,RIGHT('0000'+CONVERT(VARCHAR(4),COALESCE(ci.RevCode,'')),4) rev	--check
	,'' drg
	,'' billtype
	,COALESCE(fc.FacilityType,'') factype
	,cm.SvcPlace pos
	,'' tos
	,'' dsc
	,'' occ_code
	,'10' icd_format
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cm.ICD9Code1,'') AS char),'.',''))) diag1
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cm.ICD9Code2,'') AS char),'.',''))) diag2
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cm.ICD9Code3,'') AS char),'.',''))) diag3
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cm.ICD9Code4,'') AS char),'.',''))) diag4
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cm.ICD9Code5,'') AS char),'.',''))) diag5
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cm.ICD9CodeM6,'') AS char),'.',''))) diag6
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cm.ICD9CodeM7,'') AS char),'.',''))) diag7
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cm.ICD9CodeM8,'') AS char),'.',''))) diag8
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cm.ICD9CodeM9,'') AS char),'.',''))) diag9
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cm.ICD9CodeM10,'') AS char),'.',''))) diag10
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cm.ICD9CodeM11,'') AS char),'.',''))) diag11
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cm.ICD9CodeM12,'') AS char),'.',''))) diag12
	,'' diag13
	,'' diag14
	,'' diag15
	,'' diag16
	,'' diag17
	,'' diag18
	,'' diag19
	,'' diag20
	,'' surgproc1
	,'' surgproc2
	,'' surgproc3
	,'' surgproc4
	,'' surgproc5
	,'' surgproc6
	,CASE 
		WHEN Ci.Status = 'A' THEN 'P' 
		WHEN ci.status = 'd' THEN 'D' 
		ELSE ci.Status 
	END claim_status	--check
	,DATEDIFF(DAY,ci.SvcFromDate,ci.SvcToDate + 1) covered_days		--check
	,CAST(ci.Quantity AS int) units		--check
	,'P' [source]
	,'' src_ind
INTO #temp_claim
FROM IHHProdReplica.dbo.CLAIMS cm
	LEFT JOIN IHHProdReplica.dbo.ClaimItems ci ON cm.ClaimID = ci.ClaimID
	LEFT JOIN IHHProdReplica.dbo.Providers pv ON cm.DocID = pv.ProviderID
	LEFT JOIN IHHProdReplica.dbo.ProviderAssignments pa ON cm.PANID = pa.PANID
	LEFT JOIN IHHProdReplica.dbo.Facilities fc ON cm.FacilityID = fc.FacilityID
	INNER JOIN IHHProdReplica.dbo.MemberCoverages mc ON cm.MemCoverageID = mc.CoverageID
	LEFT JOIN IMP_DW.dbo.vw_EList_mostRecent dw ON mc.HPOtherID = dw.MemberID
WHERE
	cm.IPAID = '79'
	AND cm.InOut = 'O'

UNION ALL

SELECT DISTINCT
	dw.MedicareID memnbr
	,cm.ClaimID claimid
	,ROW_NUMBER() OVER (PARTITION BY cm.ClaimID ORDER BY ci.ProcCode) "linenbr"		--check
	,LTRIM(RTRIM(convert(char,ci.SvcFromDate,101))) fromdt
	,LTRIM(RTRIM(convert(char,ci.SvcToDate,101))) thrudt
	,pv.NationalPVID provnbr
	,COALESCE((Select DISTINCT SPEC_ID from IHHProdReplica.dbo.specialties SPEC INNER JOIN SPEC_TB ON SPEC_TB.TAXONOMY = SPEC.TaxonomyCode where specialtyid = pa.specialtyid),99) provspec
	,COALESCE(ci.ProcCode,'') cpt,'' cptmod1
	,'' cptmod2
	,'' hcpcs
	,'' [cpt_ii]
	,'' [cpt_iimod]
	,RIGHT('0000'+CONVERT(VARCHAR(4),COALESCE(ci.RevCode,'')),4) rev	--check
	,cp.DRG drg		--check
	,cp.TypeOfBill billtype		--check
	,COALESCE(fc.FacilityType,'') factype
	,cm.SvcPlace pos
	,'' tos
	,'' dsc
	,'' occ_code
	,'10' icd_format
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cm.ICD9Code1,'') AS char),'.',''))) diag1
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cm.ICD9Code2,'') AS char),'.',''))) diag2
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cm.ICD9Code3,'') AS char),'.',''))) diag3
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cm.ICD9Code4,'') AS char),'.',''))) diag4
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cm.ICD9Code5,'') AS char),'.',''))) diag5
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cp.ICD9Code6,'') AS char),'.',''))) diag6
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cp.ICD9Code7,'') AS char),'.',''))) diag7
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cp.ICD9Code8,'') AS char),'.',''))) diag8
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cp.ICD9Code9,'') AS char),'.',''))) diag9
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cp.ICD9Code10,'') AS char),'.',''))) diag10
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cp.ICD9Code11,'') AS char),'.',''))) diag11
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cp.ICD9Code12,'') AS char),'.',''))) diag12
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cp.ICD9Code13,'') AS char),'.',''))) diag13
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cp.ICD9Code14,'') AS char),'.',''))) diag14
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cp.ICD9Code15,'') AS char),'.',''))) diag15
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cp.ICD9Code16,'') AS char),'.',''))) diag16
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cp.ICD9Code17,'') AS char),'.',''))) diag17
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cp.ICD9Code18,'') AS char),'.',''))) diag18
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cp.ICD9Code19,'') AS char),'.',''))) diag19
	,LTRIM(RTRIM(REPLACE(CAST(COALESCE(cp.ICD9Code20,'') AS char),'.',''))) diag20
	,COALESCE(cp.CPT1,'') surgproc1
	,COALESCE(cp.CPT2,'') surgproc2
	,COALESCE(cp.CPT3,'') surgproc3
	,COALESCE(cp.CPT4,'') surgproc4
	,COALESCE(cp.CPT5,'') surgproc5
	,'' surgproc6
	,CASE 
		WHEN Ci.Status = 'A' THEN 'P' 
		WHEN ci.status = 'd' THEN 'D' 
		ELSE ci.Status 
	END claim_status	--check
	,DATEDIFF(DAY,ci.SvcFromDate,ci.SvcToDate + 1) covered_days		--check
	,CAST(ci.Quantity AS int) units		--check
	,'P' [source]
	,'' src_ind
FROM IHHProdReplica.dbo.Claims cm
	LEFT JOIN IHHProdReplica.dbo.ClaimItems ci ON cm.ClaimID = ci.ClaimID
	LEFT JOIN IHHProdReplica.dbo.ClaimInPatients cp ON cm.ClaimID = cp.ClaimID
	LEFT JOIN IHHProdReplica.dbo.Facilities fc ON cm.FacilityID = fc.FacilityID
	INNER JOIN IHHProdReplica.dbo.MemberCoverages mc on cm.MemCoverageID = mc.CoverageID
	LEFT JOIN IHHProdReplica.dbo.Providers pv ON cm.AttendDocID = pv.ProviderID
	LEFT JOIN IHHProdReplica.dbo.ProviderAssignments pa ON cm.AttendDocPAID = pa.PANID
	LEFT JOIN IMP_DW.dbo.vw_EList_mostRecent dw ON mc.HPOtherID = dw.MemberID
WHERE
	cm.IPAID = '79'
	AND cm.InOut = 'I'

SELECT *
FROM #temp_claim
ORDER BY --memnbr, 
claimid, linenbr