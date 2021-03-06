/*********************************************
FileName: 
This file must be ran under IHHMG, IMPERIAL, H2793
*********************************************/

DECLARE @STARTDATE as DATE
DECLARE @ENDDATE as DATE
SET @STARTDATE = '01/01/2018'
SET @ENDDATE = '12/31/2021'

IF OBJECT_ID('tempdb..#SPEC_TB') IS NOT NULL
DROP TABLE #SPEC_TB

(
SELECT 'ACUPUNCTURE' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID INTO #SPEC_TB  UNION ALL
SELECT 'Acute Care Hospital' SPECNAME, 'HOSPITAL' TMG_DESCR, '12' SPEC_ID UNION ALL
SELECT 'ADDICTION MEDICINE' SPECNAME, 'MH PROVIDER' TMG_DESCR, '3' SPEC_ID UNION ALL
SELECT 'ADVANCED HEART FAILURE AND TRANSPLANT CARDIOLOGY' SPECNAME, 'CARDIOLOGY' TMG_DESCR, '17' SPEC_ID UNION ALL
SELECT 'ALLERGY AND IMMUNOLOGY' SPECNAME, 'PRESCRIBING PROVIDER, OTHER' TMG_DESCR, '10, 99' SPEC_ID UNION ALL
SELECT 'AMBULATORY SURGICAL CENTER' SPECNAME, 'SURGEON' TMG_DESCR, '14' SPEC_ID UNION ALL
SELECT 'ANESTHESIOLOGY' SPECNAME, 'ANESTHESIOLOGIST' TMG_DESCR, '7' SPEC_ID UNION ALL
SELECT 'AUDIOLOGY' SPECNAME, 'PRESCRIBING PROVIDER, OTHER' TMG_DESCR, '10, 99' SPEC_ID UNION ALL
SELECT 'BARIATRIC SURGERY' SPECNAME, 'SURGEON' TMG_DESCR, '14' SPEC_ID UNION ALL
SELECT 'BEHAVIORAL HEALTH' SPECNAME, 'MH PROVIDER' TMG_DESCR, '3' SPEC_ID UNION ALL
SELECT 'BEHAVIORAL MEDICINE' SPECNAME, 'MH PROVIDER' TMG_DESCR, '3' SPEC_ID UNION ALL
SELECT 'California Urgent Care ' SPECNAME, 'PRESCRIBING PROVIDER, OTHER' TMG_DESCR, '10, 99' SPEC_ID UNION ALL
SELECT 'CARDIAC ELECTROPHYSIOLOGY' SPECNAME, 'CARDIOLOGY' TMG_DESCR, '17' SPEC_ID UNION ALL
SELECT 'CARDIOLOGY' SPECNAME, 'CARDIOLOGY, SURGEON' TMG_DESCR, '17, 14' SPEC_ID UNION ALL
SELECT 'CARDIOLOGY - INTERVENTIONAL' SPECNAME, 'CARDIOLOGY' TMG_DESCR, '17' SPEC_ID UNION ALL
SELECT 'CARDIOTHORACIC SURGERY' SPECNAME, 'CARDIOLOGY, SURGEON' TMG_DESCR, '17, 14' SPEC_ID UNION ALL
SELECT 'Cardiovascular Disease' SPECNAME, 'CARDIOLOGY' TMG_DESCR, '17' SPEC_ID UNION ALL
SELECT 'CHIROPRACTOR' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'CLINICAL & LAB DERMATOLOGICAL IMMUNOLOGY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'CLINICAL CARDIAC ELECTROPHYSIOLOGY' SPECNAME, 'CARDIOLOGY' TMG_DESCR, '17' SPEC_ID UNION ALL
SELECT 'CLINICAL GENETICS' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'CLINICAL MENTAL HEALTH COUNSELOR' SPECNAME, 'MH PROVIDER' TMG_DESCR, '3' SPEC_ID UNION ALL
SELECT 'CLINICAL MOLECULAR GENETICS' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'CLINICAL NEUROPSYCHOLOGY' SPECNAME, 'MH PROVIDER' TMG_DESCR, '3' SPEC_ID UNION ALL
SELECT 'CLINICAL PATHOLOGY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'COLON & RECTAL SURGERY' SPECNAME, 'GASTROENTOLOGY, SURGEON' TMG_DESCR, '18, 14' SPEC_ID UNION ALL
SELECT 'COLON AND RECTAL SURGERY' SPECNAME, 'GASTROENTOLOGY, SURGEON' TMG_DESCR, '18, 14' SPEC_ID UNION ALL
SELECT 'CRITICAL CARE MEDICINE' SPECNAME, 'PRESCRIBING PROVIDER, OTHER' TMG_DESCR, '10, 99' SPEC_ID UNION ALL
SELECT 'DERMATOLOGY' SPECNAME, 'PRESCRIBING PROVIDER, OTHER' TMG_DESCR, '10, 99' SPEC_ID UNION ALL
SELECT 'DERMATOPATHOLOGY' SPECNAME, 'PRESCRIBING PROVIDER, OTHER' TMG_DESCR, '10, 99' SPEC_ID UNION ALL
SELECT 'DIABETIC MANAGEMENT' SPECNAME, 'PRESCRIBING PROVIDER, OTHER' TMG_DESCR, '10, 99' SPEC_ID UNION ALL
SELECT 'DIAGNOSTIC RADIOLOGY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'DIETICIAN' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'DURABLE MEDICAL EQUIPMENT' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'ELECTRODIAGNOSTIC MEDICINE' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'ELECTROPHYSIOLOGY' SPECNAME, 'CARDIOLOGY' TMG_DESCR, '17' SPEC_ID UNION ALL
SELECT 'EMERGENCY MEDICAL SERVICES' SPECNAME, 'PRESCRIBING PROVIDER, OTHER' TMG_DESCR, '10, 99' SPEC_ID UNION ALL
SELECT 'EMERGENCY MEDICINE' SPECNAME, 'PRESCRIBING PROVIDER, OTHER' TMG_DESCR, '10, 99' SPEC_ID UNION ALL
SELECT 'ENDOCRINOLOGY' SPECNAME, 'ENDOCRINOLOGY' TMG_DESCR, '19' SPEC_ID UNION ALL
SELECT 'ENDOVASCULAR SURGERY ' SPECNAME, 'SURGEON' TMG_DESCR, '14' SPEC_ID UNION ALL
SELECT 'ENT/ENT/OTOLARYNGOLOGY' SPECNAME, 'PRESCRIBING PROVIDER, OTHER' TMG_DESCR, '10, 99' SPEC_ID UNION ALL
SELECT 'ENT/OTOLARYNGOLOGY' SPECNAME, 'PRESCRIBING PROVIDER, OTHER' TMG_DESCR, '10, 99' SPEC_ID UNION ALL
SELECT 'FAMILY MEDICINE' SPECNAME, 'PCP, PRESCRIBING PROVIDER' TMG_DESCR, '1, 10' SPEC_ID UNION ALL
SELECT 'FAMILY NURSE PRACTITIONER ' SPECNAME, 'NURSE PRACTITIONER' TMG_DESCR, '8' SPEC_ID UNION ALL
SELECT 'FAMILY PRACTICE' SPECNAME, 'PCP, PRESCRIBING PROVIDER' TMG_DESCR, '1, 10' SPEC_ID UNION ALL
SELECT 'FAMILY PSYCHIATRIC' SPECNAME, 'MH PROVIDER' TMG_DESCR, '3' SPEC_ID UNION ALL
SELECT 'FOOT AND ANKLE SURGERY' SPECNAME, 'SURGEON' TMG_DESCR, '14' SPEC_ID UNION ALL
SELECT 'GASTROENTEROLOGY' SPECNAME, 'GASTROENTOLOGY' TMG_DESCR, '18' SPEC_ID UNION ALL
SELECT 'GENERAL DENTISTRY' SPECNAME, 'DENTIST' TMG_DESCR, '5' SPEC_ID UNION ALL
SELECT 'GENERAL PRACTICE' SPECNAME, 'PCP, PRESCRIBING PROVIDER' TMG_DESCR, '1, 10' SPEC_ID UNION ALL
SELECT 'GENERAL SURG' SPECNAME, 'SURGEON' TMG_DESCR, '14' SPEC_ID UNION ALL
SELECT 'GENERAL SURGERY' SPECNAME, 'SURGEON' TMG_DESCR, '14' SPEC_ID UNION ALL
SELECT 'GENETIC' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'GENETICS' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'GERIATRIC MEDICINE' SPECNAME, 'PCP, PRESCRIBING PROVIDER' TMG_DESCR, '1, 10' SPEC_ID UNION ALL
SELECT 'GERIATRIC MEDICINE - INTERNAL MEDICINE' SPECNAME, 'PCP, PRESCRIBING PROVIDER' TMG_DESCR, '1, 10' SPEC_ID UNION ALL
SELECT 'GERIATRICS' SPECNAME, 'PCP, PRESCRIBING PROVIDER' TMG_DESCR, '1, 10' SPEC_ID UNION ALL
SELECT 'Gynecological Oncology' SPECNAME, 'OBGYN, PRESCRIBING PROVIDER' TMG_DESCR, '2, 10' SPEC_ID UNION ALL
SELECT 'GYNECOLOGY' SPECNAME, 'OBGYN' TMG_DESCR, '2' SPEC_ID UNION ALL
SELECT 'GYNECOLOGY- OB/GYN' SPECNAME, 'OBGYN' TMG_DESCR, '2' SPEC_ID UNION ALL
SELECT 'GYNECOLOGY, OB/GYN' SPECNAME, 'OBGYN' TMG_DESCR, '2' SPEC_ID UNION ALL
SELECT 'HAND SURGERY' SPECNAME, 'SURGEON' TMG_DESCR, '14' SPEC_ID UNION ALL
SELECT 'HEAD AND NECK SURGERY' SPECNAME, 'SURGEON' TMG_DESCR, '14' SPEC_ID UNION ALL
SELECT 'HEMATOLOGY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'HEMATOLOGY AND ONCOLOGY' SPECNAME, 'PRESCRIBING PROVIDER, OTHER' TMG_DESCR, '10, 99' SPEC_ID UNION ALL
SELECT 'HEPATOLOGY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'HIV' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'HIV SPECIALIST' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'HOME HEALTH' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'HOME INFUSION' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'HOSPICE' SPECNAME, 'PRESCRIBING PROVIDER, OTHER' TMG_DESCR, '10, 99' SPEC_ID UNION ALL
SELECT 'HOSPICE & PALLIATIVE MEDICINE' SPECNAME, 'PRESCRIBING PROVIDER, OTHER' TMG_DESCR, '10, 99' SPEC_ID UNION ALL
SELECT 'Hospice Palliatvie Care' SPECNAME, 'PRESCRIBING PROVIDER, OTHER' TMG_DESCR, '10, 99' SPEC_ID UNION ALL
SELECT 'HOSPITAL' SPECNAME, 'HOSPITAL' TMG_DESCR, '12' SPEC_ID UNION ALL
SELECT 'HOSPITALIST' SPECNAME, 'PRESCRIBING PROVIDER, OTHER' TMG_DESCR, '10, 99' SPEC_ID UNION ALL
SELECT 'HYPERBARIC MEDICINE' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'INFECTIOUS DISEASE' SPECNAME, 'PRESCRIBING PROVIDER, OTHER' TMG_DESCR, '10, 99' SPEC_ID UNION ALL
SELECT 'INFECTIOUS DISEASES' SPECNAME, 'PRESCRIBING PROVIDER, OTHER' TMG_DESCR, '10, 99' SPEC_ID UNION ALL
SELECT 'INPATIENT PSYCHIATRIC FACILITY SERVICES' SPECNAME, 'MH PROVIDER' TMG_DESCR, '3' SPEC_ID UNION ALL
SELECT 'INTERNAL MEDICINE' SPECNAME, 'PCP, PRESCRIBING PROVIDER' TMG_DESCR, '1, 10' SPEC_ID UNION ALL
SELECT 'INTERVENTIONAL CARDIOLOGY' SPECNAME, 'CARDIOLOGY' TMG_DESCR, '17' SPEC_ID UNION ALL
SELECT 'INTERVENTIONAL RADIOLOGY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'INTERVENTIONAL RADIOLOGY AND DIAGNOSTIC RADIOLOGY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'LABORATORY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'LICENSED CLINICAL SOCIAL WORKER' SPECNAME, 'MH PROVIDER' TMG_DESCR, '3' SPEC_ID UNION ALL
SELECT 'LICENSED PROFESSIONAL COUNSELOR' SPECNAME, 'MH PROVIDER' TMG_DESCR, '3' SPEC_ID UNION ALL
SELECT 'MARRIAGE FAMILY COUNSELOR' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'MATERNAL & FETAL MEDICINE' SPECNAME, 'OBGYN' TMG_DESCR, '2' SPEC_ID UNION ALL
SELECT 'MATERNAL-FETAL MEDICINE' SPECNAME, 'OBGYN' TMG_DESCR, '2' SPEC_ID UNION ALL
SELECT 'Mental Health' SPECNAME, 'MH PROVIDER' TMG_DESCR, '3' SPEC_ID UNION ALL
SELECT 'MENTAL HEALTH, COUNSELOR' SPECNAME, 'MH PROVIDER' TMG_DESCR, '3' SPEC_ID UNION ALL
SELECT 'NEPHROLOGY' SPECNAME, 'NEPHROLOGIST' TMG_DESCR, '6' SPEC_ID UNION ALL
SELECT 'Neurological Surgery' SPECNAME, 'SURGEON' TMG_DESCR, '14' SPEC_ID UNION ALL
SELECT 'NEUROLOGY' SPECNAME, 'PRESCRIBING PROVIDER, OTHER' TMG_DESCR, '10, 99' SPEC_ID UNION ALL
SELECT 'NEURO-OPHTHALMOLOGY' SPECNAME, 'EYECPROV' TMG_DESCR, '4' SPEC_ID UNION ALL
SELECT 'NEUROPATHOLOGY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'NEUROPSYCHIATRY' SPECNAME, 'MH PROVIDER' TMG_DESCR, '3' SPEC_ID UNION ALL
SELECT 'NEUROPSYCHOLOGY' SPECNAME, 'MH PROVIDER' TMG_DESCR, '3' SPEC_ID UNION ALL
SELECT 'NEURORADIOLOGY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'NEUROSURGERY' SPECNAME, 'SURGEON' TMG_DESCR, '14' SPEC_ID UNION ALL
SELECT 'NUCLEAR CARDIOLOGY' SPECNAME, 'CARDIOLOGY' TMG_DESCR, '17' SPEC_ID UNION ALL
SELECT 'NUCLEAR MEDICINE' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'NURSE PRACTITIONER' SPECNAME, 'NURSE PRACTITIONER' TMG_DESCR, '8' SPEC_ID UNION ALL
SELECT 'NURSE PRACTITIONER ' SPECNAME, 'NURSE PRACTITIONER' TMG_DESCR, '8' SPEC_ID UNION ALL
SELECT 'NURSE PRACTITIONER - OB/GYN' SPECNAME, 'OBGYN, NURSE PRACTITIONER' TMG_DESCR, '2, 8' SPEC_ID UNION ALL
SELECT 'OB/GYN Gynecology ' SPECNAME, 'OBGYN' TMG_DESCR, '2' SPEC_ID UNION ALL
SELECT 'Obstetrics & Gynecology' SPECNAME, 'OBGYN' TMG_DESCR, '2' SPEC_ID UNION ALL
SELECT 'OBSTETRICS & GYNECOLOGY ' SPECNAME, 'OBGYN' TMG_DESCR, '2' SPEC_ID UNION ALL
SELECT 'OBSTETRICS AND GYNECOLOGY' SPECNAME, 'OBGYN' TMG_DESCR, '2' SPEC_ID UNION ALL
SELECT 'OBSTETRICS GYNECOLOGY' SPECNAME, 'OBGYN' TMG_DESCR, '2' SPEC_ID UNION ALL
SELECT 'Obstretrics & Gynecology ' SPECNAME, 'OBGYN' TMG_DESCR, '2' SPEC_ID UNION ALL
SELECT 'OCCUPATIONAL THERAPY ' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'Oncology ' SPECNAME, 'PRESCRIBING PROVIDER, OTHER' TMG_DESCR, '10, 99' SPEC_ID UNION ALL
SELECT 'ONCOLOGY - MEDICAL,SURGICAL' SPECNAME, 'PRESCRIBING PROVIDER, OTHER' TMG_DESCR, '10, 99' SPEC_ID UNION ALL
SELECT 'ONCOLOGY - RADIATION/ONCOLOGY - RADIATION/RADIATION ONCOLOGY' SPECNAME, 'PRESCRIBING PROVIDER, OTHER' TMG_DESCR, '10, 99' SPEC_ID UNION ALL
SELECT 'ONCOLOGY - RADIATION/RADIATION ONCOLOGY' SPECNAME, 'PRESCRIBING PROVIDER, OTHER' TMG_DESCR, '10, 99' SPEC_ID UNION ALL
SELECT 'OPHTHALMOLOGY' SPECNAME, 'EYE CARE' TMG_DESCR, '4' SPEC_ID UNION ALL
SELECT 'OPTOMETRY' SPECNAME, 'EYE CARE' TMG_DESCR, '4' SPEC_ID UNION ALL
SELECT 'ORAL & MAXILLOFACIAL SURGERY' SPECNAME, 'SURGEON, DENTIST' TMG_DESCR, '14, 5' SPEC_ID UNION ALL
SELECT 'ORAL AND MAXILLOFACIAL SURGERY' SPECNAME, 'SURGEON, DENTIST' TMG_DESCR, '14, 5' SPEC_ID UNION ALL
SELECT 'ORAL SURGERY' SPECNAME, 'SURGEON, DENTIST' TMG_DESCR, '14, 5' SPEC_ID UNION ALL
SELECT 'ORGAN TRANSPLANT SURGERY' SPECNAME, 'SURGEON' TMG_DESCR, '14' SPEC_ID UNION ALL
SELECT 'ORTHOPAEDIC SURGERY' SPECNAME, 'SURGEON' TMG_DESCR, '14' SPEC_ID UNION ALL
SELECT 'ORTHOPEDIC SURG' SPECNAME, 'SURGEON' TMG_DESCR, '14' SPEC_ID UNION ALL
SELECT 'ORTHOPEDIC SURGERY' SPECNAME, 'SURGEON' TMG_DESCR, '14' SPEC_ID UNION ALL
SELECT 'ORTHOTICS AND PROSTHETICS' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'OTOLARYNGOLOGY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'OUTPATIENT DIALYSIS' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'OUTPATIENT INFUSION/CHEMOTHERAPY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'PAIN MANAGEMENT' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'Pain Medicine' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'Pain Medicine - Family Medicine' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'PALLIATIVE MEDICINE' SPECNAME, 'PRESCRIBING PROVIDER, OTHER' TMG_DESCR, '10, 99' SPEC_ID UNION ALL
SELECT 'PATHOLOGY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'PEDIATRICS' SPECNAME, 'PCP, PRESCRIBING PROVIDER' TMG_DESCR, '1, 10' SPEC_ID UNION ALL
SELECT 'PERINATOLOGY' SPECNAME, 'OBGYN' TMG_DESCR, '2' SPEC_ID UNION ALL
SELECT 'PHARMACY' SPECNAME, 'PRESCRIBING PROVIDER' TMG_DESCR, '10' SPEC_ID UNION ALL
SELECT 'PHYSIATRY, REHABILITATIVE MEDICINE' SPECNAME, 'MH PROVIDER' TMG_DESCR, '3' SPEC_ID UNION ALL
SELECT 'PHYSICAL MEDICINE & REHAB' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'Physical Medicine & Rehabilitation' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'PHYSICAL MEDICINE AND REHABILITATION' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'PHYSICAL THERAPY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'PHYSICIAL THERAPY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'PHYSICIAN ASSISTANT' SPECNAME, 'PHYSICIAN ASSISTANT' TMG_DESCR, '9' SPEC_ID UNION ALL
SELECT 'Physician Assistant - Certified' SPECNAME, 'PHYSICIAN ASSISTANT' TMG_DESCR, '9' SPEC_ID UNION ALL
SELECT 'PLASTIC SURGERY' SPECNAME, 'SURGEON' TMG_DESCR, '14' SPEC_ID UNION ALL
SELECT 'PODIATRY' SPECNAME, 'PRESCRIBING PROVIDER, OTHER' TMG_DESCR, '10, 99' SPEC_ID UNION ALL
SELECT 'PRIMARY CARE ? NURSE PRACTITIONERS' SPECNAME, 'NURSE PRACTITIONER' TMG_DESCR, '8' SPEC_ID UNION ALL
SELECT 'PRIMARY CARE ? PHYSICIAN ASSISTANTS' SPECNAME, 'PHYSICIAN ASSISTANT' TMG_DESCR, '9' SPEC_ID UNION ALL
SELECT 'PSYCHIATRIC HOSPITAL' SPECNAME, 'MH PROVIDER' TMG_DESCR, '3' SPEC_ID UNION ALL
SELECT 'PSYCHIATRY' SPECNAME, 'MH PROVIDER' TMG_DESCR, '3' SPEC_ID UNION ALL
SELECT 'Psychologist' SPECNAME, 'MH PROVIDER' TMG_DESCR, '3' SPEC_ID UNION ALL
SELECT 'PSYCHOLOGY' SPECNAME, 'MH PROVIDER' TMG_DESCR, '3' SPEC_ID UNION ALL
SELECT 'Pulmonary Disease' SPECNAME, 'PRESCRIBING PROVIDER, OTHER' TMG_DESCR, '10, 99' SPEC_ID UNION ALL
SELECT 'PULMONOLOGY' SPECNAME, 'PRESCRIBING PROVIDER, OTHER' TMG_DESCR, '10, 99' SPEC_ID UNION ALL
SELECT 'Pyschiatry ' SPECNAME, 'MH PROVIDER' TMG_DESCR, '3' SPEC_ID UNION ALL
SELECT 'RADIOLOGY - VASCULAR & INTERVENTIONAL' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'Radiology Vascular  & Inerventional Radiology' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'REGISTERED DIETICIAIN' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'REGISTERED DIETICIAN' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'REGISTERED DIETITIAN' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'REHABILITATION HOSPITAL' SPECNAME, 'HOSPITAL' TMG_DESCR, '12' SPEC_ID UNION ALL
SELECT 'RHEUMATOLOGY' SPECNAME, 'PRESCRIBING PROVIDER, OTHER' TMG_DESCR, '10, 99' SPEC_ID UNION ALL
SELECT 'SKILLED NURSING FACILITIES' SPECNAME, 'SNF' TMG_DESCR, '13' SPEC_ID UNION ALL
SELECT 'SLEEP MEDICINE' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'SOCIAL WORKER' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'SPEECH THERAPY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'SPORTS MEDICINE' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'SURGERY, FOOT & ANKLE-PODIATRY' SPECNAME, 'SURGEON' TMG_DESCR, '14' SPEC_ID UNION ALL
SELECT 'SURGICAL SERVICES OUTPATIENT OR ASC' SPECNAME, 'SURGEON' TMG_DESCR, '14' SPEC_ID UNION ALL
SELECT 'Thoracic and Cardiac Surgery ' SPECNAME, 'SURGEON' TMG_DESCR, '14' SPEC_ID UNION ALL
SELECT 'TOXICOLOGY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'TRANSPLANT HEPATOLOGY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'TRANSPLANT SURGERY' SPECNAME, 'SURGEON' TMG_DESCR, '14' SPEC_ID UNION ALL
SELECT 'TRAUMA SURGERY' SPECNAME, 'SURGEON' TMG_DESCR, '14' SPEC_ID UNION ALL
SELECT 'TRAUMATIC SURGERY' SPECNAME, 'SURGEON' TMG_DESCR, '14' SPEC_ID UNION ALL
SELECT 'URGENT CARE' SPECNAME, 'PRESCRIBING PROVIDER, OTHER' TMG_DESCR, '10, 99' SPEC_ID UNION ALL
SELECT 'UROGYN & PELVIC RECONSTRUCTIVE SURGERY' SPECNAME, 'SURGEON' TMG_DESCR, '14' SPEC_ID UNION ALL
SELECT 'UROLOGY' SPECNAME, 'PRESCRIBING PROVIDER, OTHER' TMG_DESCR, '10, 99' SPEC_ID UNION ALL
SELECT 'VASCULAR AND INTERVENTIONAL RADIOLOGY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'VASCULAR NEUROLOGY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'VASCULAR SURGERY' SPECNAME, 'CARDIOLOGY, SURGEON' TMG_DESCR, '17, 14' SPEC_ID UNION ALL
SELECT 'WOUND CARE' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID
)

SELECT DISTINCT
	prov.provid
	,prov.LASTNAME provlast
	,COALESCE(prov.FIRSTNAME,'') provfirst
	,prov.PROVID npi
	,'' licnum
	,'' tin
	,'' site_id
	,'' sitename
	,COALESCE(prov.STREET,'')  provaddr1
	,COALESCE(prov.street2,'') provaddr2
	,'' provaddr3
	,COALESCE(prov.CITY,'') provcity
	,COALESCE(prov.state,'') provstate
	,COALESCE(prov.ZIP,'') provzip
	,COALESCE(prov.PHONE,'') provphone1
	,'' provphone2
	,coalesce(prov.fax,'') provfax1
	,'' provfax2
	,provco.CLASSDESC prov_type	--check
	,CASE WHEN tb.SPEC_ID LIKE '%,%'
		THEN LEFT(tb.SPEC_ID,CHARINDEX(',',tb.SPEC_ID)-1)
		ELSE tb.SPEC_ID
	END provspec1	--check
	,CASE WHEN tb.SPEC_ID LIKE '%,%' 
		THEN LTRIM(RTRIM(RIGHT(tb.SPEC_ID,CHARINDEX(',',tb.SPEC_ID)-0)))
		ELSE ''
	END provspec2
	,'' provspec3
	,'' provspec4
	,'' provspec5
	,'' provspec6
	,'' provspec7
	,'' provspec8
	,'' provspec9
	,'' provspec10
FROM 
	IMPERIAL.dbo.REPORT_PROV_NAME_V prov
	LEFT JOIN IMPERIAL.dbo.PROV_ADDINFO_V provadd ON provadd.prov_keyid = prov.PROV_KEYID 
	LEFT JOIN IMPERIAL.dbo.PROV_SPECINFO_V spec ON spec.PROV_KEYID = prov.prov_keyid
	LEFT JOIN IMPERIAL.dbo.PROV_COMPANY_V provco ON provco.PROV_KEYID = prov.prov_keyid
	LEFT JOIN #SPEC_TB tb ON tb.SPECNAME = spec.SPECDESCR

UNION ALL

SELECT DISTINCT
	prov.provid
	,prov.LASTNAME provlast
	,COALESCE(prov.FIRSTNAME,'') provfirst
	,prov.PROVID npi
	,'' licnum
	,'' tin
	,'' site_id
	,'' sitename
	,COALESCE(prov.STREET,'')  provaddr1
	,COALESCE(prov.street2,'') provaddr2
	,'' provaddr3
	,COALESCE(prov.CITY,'') provcity
	,COALESCE(prov.state,'') provstate
	,COALESCE(prov.ZIP,'') provzip
	,COALESCE(prov.PHONE,'') provphone1
	,'' provphone2
	,coalesce(prov.fax,'') provfax1
	,'' provfax2
	,provco.CLASSDESC prov_type	--check
	,CASE WHEN tb.SPEC_ID LIKE '%,%'
		THEN LEFT(tb.SPEC_ID,CHARINDEX(',',tb.SPEC_ID)-1)
		ELSE tb.SPEC_ID
	END provspec1	--check
	,CASE WHEN tb.SPEC_ID LIKE '%,%' 
		THEN LTRIM(RTRIM(RIGHT(tb.SPEC_ID,CHARINDEX(',',tb.SPEC_ID)-0)))
		ELSE ''
	END provspec2
	,'' provspec3
	,'' provspec4
	,'' provspec5
	,'' provspec6
	,'' provspec7
	,'' provspec8
	,'' provspec9
	,'' provspec10
FROM 
	IHHMG.dbo.REPORT_PROV_NAME_V prov
	LEFT JOIN IHHMG.dbo.PROV_ADDINFO_V provadd ON provadd.prov_keyid = prov.PROV_KEYID 
	LEFT JOIN IHHMG.dbo.PROV_SPECINFO_V spec ON spec.PROV_KEYID = prov.prov_keyid
	LEFT JOIN IHHMG.dbo.PROV_COMPANY_V provco ON provco.PROV_KEYID = prov.prov_keyid
	LEFT JOIN #SPEC_TB tb ON tb.SPECNAME = spec.SPECDESCR

UNION ALL

SELECT DISTINCT
	prov.provid
	,prov.LASTNAME provlast
	,COALESCE(prov.FIRSTNAME,'') provfirst
	,prov.PROVID npi
	,'' licnum
	,'' tin
	,'' site_id
	,'' sitename
	,COALESCE(prov.STREET,'')  provaddr1
	,COALESCE(prov.street2,'') provaddr2
	,'' provaddr3
	,COALESCE(prov.CITY,'') provcity
	,COALESCE(prov.state,'') provstate
	,COALESCE(prov.ZIP,'') provzip
	,COALESCE(prov.PHONE,'') provphone1
	,'' provphone2
	,coalesce(prov.fax,'') provfax1
	,'' provfax2
	,provco.CLASSDESC prov_type	--check
	,CASE WHEN tb.SPEC_ID LIKE '%,%'
		THEN LEFT(tb.SPEC_ID,CHARINDEX(',',tb.SPEC_ID)-1)
		ELSE tb.SPEC_ID
	END provspec1	--check
	,CASE WHEN tb.SPEC_ID LIKE '%,%' 
		THEN LTRIM(RTRIM(RIGHT(tb.SPEC_ID,CHARINDEX(',',tb.SPEC_ID)-0)))
		ELSE ''
	END provspec2
	,'' provspec3
	,'' provspec4
	,'' provspec5
	,'' provspec6
	,'' provspec7
	,'' provspec8
	,'' provspec9
	,'' provspec10
FROM 
	H2793.dbo.REPORT_PROV_NAME_V prov
	LEFT JOIN H2793.dbo.PROV_ADDINFO_V provadd ON provadd.prov_keyid = prov.PROV_KEYID
	LEFT JOIN H2793.dbo.PROV_SPECINFO_V spec ON spec.PROV_KEYID = prov.prov_keyid
	LEFT JOIN H2793.dbo.PROV_COMPANY_V provco ON provco.PROV_KEYID = prov.prov_keyid
	LEFT JOIN #SPEC_TB tb ON tb.SPECNAME = spec.SPECDESCR
