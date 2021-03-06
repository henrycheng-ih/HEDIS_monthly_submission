/*********************************************
Author:	Henry Cheng
Date:	10/25/21

This is a modified version of July file that Darin and Patrick have worked on with Lifan (TMG).
Previous versions are in S:\~ Data Management ~\SQL\HEDIS\TMG\Archive
*********************************************/

use IHHProdReplica;

WITH PA_TB AS (
select DISTINCT PANID from claims where IPAID = '79'
),
SPEC_TB AS (
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

select distinct
	pa.PANID provnbr
	,CASE WHEN prov.LastName = '' THEN UPPER(prov.OrgName) ELSE UPPER(prov.LastName) END provlast
	,UPPER(prov.FirstName) provfirst
	,prov.NationalPVID npi
	--,pa.PANID
	--,prov.StateLicNo licnum
	,'' licnum
	,'' tin
	,'' site_id
	,'' sitename
	,isnull(UPPER(pa.Address1), '') provaddr1
	,isnull(UPPER(pa.Address2), '') provaddr2
	,'' provaddr3
	,isnull(UPPER(pa.City), '') provcity
	,isnull(pa.State, '') provstate
	,isnull(replace(pa.PostalCode, '-', ''), '') provzip
	,isnull(replace(replace(replace(replace(pa.Phone, '(', ''), ')', ''), '-', ''), ' ', ''), '') provphone1
	,'' provphone2
	,isnull(replace(replace(replace(replace(pa.Fax, '(', ''), ')', ''), '-', ''), ' ', ''), '') provfax1
	,'' provfax2
	,CASE WHEN prov.IsFacility = '1' THEN 'FACILITY' ELSE 'PHYSICIAN' END prov_type
	,COALESCE((Select DISTINCT SPEC_ID from specialties SPEC INNER JOIN SPEC_TB ON SPEC_TB.TAXONOMY = SPEC.TaxonomyCode where specialtyid = pa.[SpecialtyID] ),'') provspec1
	,COALESCE((Select DISTINCT SPEC_ID from specialties SPEC INNER JOIN SPEC_TB ON SPEC_TB.TAXONOMY = SPEC.TaxonomyCode where specialtyid = pa.[SpecialtyID2] ),'') provspec2
	,COALESCE((Select DISTINCT SPEC_ID from specialties SPEC INNER JOIN SPEC_TB ON SPEC_TB.TAXONOMY = SPEC.TaxonomyCode where specialtyid = pa.[SpecialtyID3] ),'') provspec3
	,COALESCE((Select DISTINCT SPEC_ID from specialties SPEC INNER JOIN SPEC_TB ON SPEC_TB.TAXONOMY = SPEC.TaxonomyCode where specialtyid = pa.[SpecialtyID4] ),'') provspec4
	,'' provspec5
	,'' provspec6
	,'' provspec7
	,'' provspec8
	,'' provspec9
	,'' provspec10
	
from providers prov
left join ProviderAssignments pa on pa.ProviderID = prov.ProviderID
AND EXISTS(SELECT * FROM PA_TB WHERE PA_TB.PANID = pa.PANID)

where (select top 1 PANID from claims where PANID = pa.PANID AND IPAID = '79') is not null
and (pa.IsDeleted is null or pa.IsDeleted = 0)
and prov.IsDeleted = 0

order by npi