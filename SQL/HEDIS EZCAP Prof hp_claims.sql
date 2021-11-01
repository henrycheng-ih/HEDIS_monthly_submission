/*********************************************
Author:	Henry Cheng
Date:	10/22/21

This is a modified version of July file that Darin and Patrick have worked on with Lifan (TMG).
Previous versions are in S:\~ Data Management ~\SQL\HEDIS\TMG\Archive
*********************************************/


DECLARE @STARTDATE as DATE
DECLARE @ENDDATE as DATE
SET @STARTDATE = '01/01/2017'
SET @ENDDATE = '12/31/2020'

IF OBJECT_ID('tempdb..#SPEC_TB') IS NOT NULL
DROP TABLE #SPEC_TB

(
SELECT 'ACUPUNCTURE' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID INTO #SPEC_TB UNION ALL
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
SELECT 'PRIMARY CARE � NURSE PRACTITIONERS' SPECNAME, 'NURSE PRACTITIONER' TMG_DESCR, '8' SPEC_ID UNION ALL
SELECT 'PRIMARY CARE � PHYSICIAN ASSISTANTS' SPECNAME, 'PHYSICIAN ASSISTANT' TMG_DESCR, '9' SPEC_ID UNION ALL
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
SELECT 'WOUND CARE' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'ALLERGY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'ALLERGY & IMMUNOLOGY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'AMBULANCE' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'ANESTHESIOLOGIST ASSISTANT' SPECNAME, 'ANESTHESIOLOGIST' TMG_DESCR, '7' SPEC_ID UNION ALL
SELECT 'CARDIOVASCULAR DISEASES' SPECNAME, 'CARDIOLOGY' TMG_DESCR, '17' SPEC_ID UNION ALL
SELECT 'CARDIOVASCULAR SURGERY' SPECNAME, 'CARDIOLOGY, SURGEON' TMG_DESCR, '17, 14' SPEC_ID UNION ALL
SELECT 'CHIROPRACTIC' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'DENTIST' SPECNAME, 'DENTIST' TMG_DESCR, '5' SPEC_ID UNION ALL
SELECT 'DIALYSIS CENTER' SPECNAME, 'NEPHROLOGIST' TMG_DESCR, '6' SPEC_ID UNION ALL
SELECT 'FEDERALLY QUALIFIED HEALTH CENTER' SPECNAME, 'PCP, PRESCRIBING PROVIDER' TMG_DESCR, '1, 10' SPEC_ID UNION ALL
SELECT 'HEMATOLOGY/ONCOLOGY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'HOME HEALTH AGENCY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'HOSPICE AND PALLIATIVE MEDICINE' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'MICROGRAPHIC SURGERY' SPECNAME, 'SURGEON' TMG_DESCR, '14' SPEC_ID UNION ALL
SELECT 'MULTI-SPECIALTY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'OCCUPATIONAL MEDICINE' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'OTHER SPECIALTY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'PEDIATRIC ENDOCRINOLOGY' SPECNAME, 'ENDOCRINOLOGY' TMG_DESCR, '19' SPEC_ID UNION ALL
SELECT 'PEDIATRIC NEUROSURGERY' SPECNAME, 'SURGEON' TMG_DESCR, '14' SPEC_ID UNION ALL
SELECT 'PLASTIC AND RECONSTRUCTIVE SUR' SPECNAME, 'SURGEON' TMG_DESCR, '14' SPEC_ID UNION ALL
SELECT 'PODIATRIC SURGERY' SPECNAME, 'SURGEON' TMG_DESCR, '14' SPEC_ID UNION ALL
SELECT 'PROSTHETIC/ORTHOTIC SUPPLIER' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'PULMONARY DISEASES' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'RADIATION ONCOLOGY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'RADIATION THERAPY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'RADIOLOGY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'RETINA VITREOUS' SPECNAME, 'EYE CARE' TMG_DESCR, '4' SPEC_ID UNION ALL
SELECT 'SKILLED NURSING FACILITY' SPECNAME, 'SNF' TMG_DESCR, '13' SPEC_ID UNION ALL
SELECT 'SPEECH LANGUAGE PATHOLOGY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID UNION ALL
SELECT 'THORACIC SURGERY' SPECNAME, 'SURGEON' TMG_DESCR, '14' SPEC_ID UNION ALL
SELECT 'VASCULAR/INTERVENTIONAL RADIOLOGY' SPECNAME, 'OTHER' TMG_DESCR, '99' SPEC_ID
)


--SELECT *
--FROM #SPEC_TB

SELECT DISTINCT 
	mc.PATID memnbr	--check
	,cm.claimno claimid
	,cd.TBLROWID linenbr
	,LTRIM(RTRIM(convert(char,cd.FROMDATESVC,101))) fromdt
	,LTRIM(RTRIM(convert(char,cd.TODATESVC,101))) thrudt
	,cm.provid provnbr
	,CASE	
		WHEN tb.SPEC_ID LIKE '%,%' THEN LEFT(tb.SPEC_ID,CHARINDEX(',',tb.SPEC_ID)-1)
		ELSE tb.SPEC_ID
	 END provspec
	,LTRIM(RTRIM(COALESCE(cd.PROCCODE,''))) cpt	--check
	,'' cptmod1
	,'' cptmod2
	,'' hcpcs
	,'' cpt_ii
	,'' cpt_iimod
	,LTRIM(RTRIM(COALESCE(cd.HSERVICECD,''))) rev--check
	,COALESCE(cm.DRGCODE,'') drg--check
	,COALESCE(cm.BILLTYPE,'') billtype--check
	,coalesce(cm.FACILITY,'') factype
	,cm.PLACESVC pos
	,'' tos
	,'' dsc
	,COALESCE(cm.OCCURCODE1,'') occ_code--check
	,'10' icd_format
	,COALESCE((Select top 1 diag from H2793.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '1'),'') diag1
	,COALESCE((Select top 1 diag from H2793.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '2'),'') diag2
	,COALESCE((Select top 1 diag from H2793.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '3'),'') diag3
	,COALESCE((Select top 1 diag from H2793.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '4'),'') diag4
	,COALESCE((Select top 1 diag from H2793.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '5'),'') diag5
	,COALESCE((Select top 1 diag from H2793.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '6'),'') diag6
	,COALESCE((Select top 1 diag from H2793.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '7'),'') diag7
	,COALESCE((Select top 1 diag from H2793.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '8') ,'')diag8
	,COALESCE((Select top 1 diag from H2793.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '9'),'') diag9
	,COALESCE((Select top 1 diag from H2793.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '10'),'') diag10
	,COALESCE((Select top 1 diag from H2793.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '11'),'') diag11
	,COALESCE((Select top 1 diag from H2793.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '12'),'') diag12
	,COALESCE((Select top 1 diag from H2793.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '13'),'') diag13
	,COALESCE((Select top 1 diag from H2793.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '14'),'') diag14
	,COALESCE((Select top 1 diag from H2793.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '15') ,'')diag15
	,COALESCE((Select top 1 diag from H2793.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '16') ,'')diag16
	,COALESCE((Select top 1 diag from H2793.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '17') ,'')diag17
	,COALESCE((Select top 1 diag from H2793.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '18') ,'')diag18
	,COALESCE((Select top 1 diag from H2793.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '19'),'') diag19
	,COALESCE((Select top 1 diag from H2793.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '20'),'') diag20
	,LTRIM(RTRIM(COALESCE(cm.PROC1,''))) surgproc1
	,LTRIM(RTRIM(COALESCE(cm.PROC2,''))) surgproc2
	,LTRIM(RTRIM(COALESCE(cm.PROC3,''))) surgproc3
	,LTRIM(RTRIM(COALESCE(cm.PROC4,''))) surgproc4
	,LTRIM(RTRIM(COALESCE(cm.PROC5,''))) surgproc5
	,LTRIM(RTRIM(COALESCE(cm.PROC6,''))) surgproc6
	,CASE 
		WHEN cm.STATUS = '9' THEN 'P'--check
		WHEN cm.STATUS = '4' THEN 'D'
		ELSE 'D' 
	END claim_status
	,DATEDIFF(DAY,cd.FROMDATESVC,cd.TODATESVC + 1) covered_days		--check
	,CAST(cd.QTY AS INT) units--check
	,'P' source
	,'' src_ind
FROM H2793.dbo.CLAIM_MASTERS_V cm 
	LEFT JOIN H2793.dbo.CLAIM_DETAILS_V cd on cm.CLAIMNO = cd.CLAIMNO
	LEFT JOIN H2793.dbo.MEMB_COMPANY_V mc on cm.MEMBID = mc.MEMBID
	LEFT JOIN H2793.dbo.PROV_SPECINFO_V ps on cm.PROV_KEYID = ps.PROV_KEYID
	left join #SPEC_TB tb on tb.SPECNAME = ps.SPECDESCR
WHERE 
	--cm.hpcode LIKE ('IHM%')	--FOR IHHMG & IMPERIAL
	cm.HPCODE LIKE ('IT%')		--FOR H2793

/*
ORDER BY
	cm.CLAIMNO,
	cd.TBLROWID
*/

UNION all

SELECT DISTINCT 
	mc.PATID memnbr	--check
	,cm.claimno claimid
	,cd.TBLROWID linenbr
	,LTRIM(RTRIM(convert(char,cd.FROMDATESVC,101))) fromdt
	,LTRIM(RTRIM(convert(char,cd.TODATESVC,101))) thrudt
	,cm.provid provnbr
	,CASE	
		WHEN tb.SPEC_ID LIKE '%,%' THEN LEFT(tb.SPEC_ID,CHARINDEX(',',tb.SPEC_ID)-1)
		ELSE tb.SPEC_ID
	 END provspec
	,LTRIM(RTRIM(COALESCE(cd.PROCCODE,''))) cpt	--check
	,'' cptmod1
	,'' cptmod2
	,'' hcpcs
	,'' cpt_ii
	,'' cpt_iimod
	,LTRIM(RTRIM(COALESCE(cd.HSERVICECD,''))) rev--check
	,COALESCE(cm.DRGCODE,'') drg--check
	,COALESCE(cm.BILLTYPE,'') billtype--check
	,coalesce(cm.FACILITY,'') factype
	,cm.PLACESVC pos
	,'' tos
	,'' dsc
	,COALESCE(cm.OCCURCODE1,'') occ_code--check
	,'10' icd_format
	,COALESCE((Select top 1 diag from IMPERIAL.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '1'),'') diag1
	,COALESCE((Select top 1 diag from IMPERIAL.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '2'),'') diag2
	,COALESCE((Select top 1 diag from IMPERIAL.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '3'),'') diag3
	,COALESCE((Select top 1 diag from IMPERIAL.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '4'),'') diag4
	,COALESCE((Select top 1 diag from IMPERIAL.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '5'),'') diag5
	,COALESCE((Select top 1 diag from IMPERIAL.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '6'),'') diag6
	,COALESCE((Select top 1 diag from IMPERIAL.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '7'),'') diag7
	,COALESCE((Select top 1 diag from IMPERIAL.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '8') ,'')diag8
	,COALESCE((Select top 1 diag from IMPERIAL.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '9'),'') diag9
	,COALESCE((Select top 1 diag from IMPERIAL.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '10'),'') diag10
	,COALESCE((Select top 1 diag from IMPERIAL.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '11'),'') diag11
	,COALESCE((Select top 1 diag from IMPERIAL.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '12'),'') diag12
	,COALESCE((Select top 1 diag from IMPERIAL.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '13'),'') diag13
	,COALESCE((Select top 1 diag from IMPERIAL.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '14'),'') diag14
	,COALESCE((Select top 1 diag from IMPERIAL.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '15') ,'')diag15
	,COALESCE((Select top 1 diag from IMPERIAL.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '16') ,'')diag16
	,COALESCE((Select top 1 diag from IMPERIAL.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '17') ,'')diag17
	,COALESCE((Select top 1 diag from IMPERIAL.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '18') ,'')diag18
	,COALESCE((Select top 1 diag from IMPERIAL.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '19'),'') diag19
	,COALESCE((Select top 1 diag from IMPERIAL.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '20'),'') diag20
	,LTRIM(RTRIM(COALESCE(cm.PROC1,''))) surgproc1
	,LTRIM(RTRIM(COALESCE(cm.PROC2,''))) surgproc2
	,LTRIM(RTRIM(COALESCE(cm.PROC3,''))) surgproc3
	,LTRIM(RTRIM(COALESCE(cm.PROC4,''))) surgproc4
	,LTRIM(RTRIM(COALESCE(cm.PROC5,''))) surgproc5
	,LTRIM(RTRIM(COALESCE(cm.PROC6,''))) surgproc6
	,CASE 
		WHEN cm.STATUS = '9' THEN 'P'--check
		WHEN cm.STATUS = '4' THEN 'D'
		ELSE 'D' 
	END claim_status
	,DATEDIFF(DAY,cd.FROMDATESVC,cd.TODATESVC + 1) covered_days		--check
	,CAST(cd.QTY AS INT) units--check
	,'P' source
	,'' src_ind
FROM IMPERIAL.dbo.CLAIM_MASTERS_V cm 
	LEFT JOIN IMPERIAL.dbo.CLAIM_DETAILS_V cd on cm.CLAIMNO = cd.CLAIMNO
	LEFT JOIN IMPERIAL.dbo.MEMB_COMPANY_V mc on cm.MEMBID = mc.MEMBID
	LEFT JOIN IMPERIAL.dbo.PROV_SPECINFO_V ps on cm.PROV_KEYID = ps.PROV_KEYID
	left join #SPEC_TB tb on tb.SPECNAME = ps.SPECDESCR
WHERE 
	cm.HPCODE LIKE ('IHM%')	--FOR IHHMG & IMPERIAL
	--cm.HPCODE LIKE ('IT%')		--FOR H2793

/*
ORDER BY
	cm.CLAIMNO,
	cd.TBLROWID
*/

UNION ALL

SELECT DISTINCT 
	mc.PATID memnbr	--check
	,cm.claimno claimid
	,cd.TBLROWID linenbr
	,LTRIM(RTRIM(convert(char,cd.FROMDATESVC,101))) fromdt
	,LTRIM(RTRIM(convert(char,cd.TODATESVC,101))) thrudt
	,cm.provid provnbr
	,CASE	
		WHEN tb.SPEC_ID LIKE '%,%' THEN LEFT(tb.SPEC_ID,CHARINDEX(',',tb.SPEC_ID)-1)
		ELSE tb.SPEC_ID
	 END provspec
	,LTRIM(RTRIM(COALESCE(cd.PROCCODE,''))) cpt	--check
	,'' cptmod1
	,'' cptmod2
	,'' hcpcs
	,'' cpt_ii
	,'' cpt_iimod
	,LTRIM(RTRIM(COALESCE(cd.HSERVICECD,''))) rev--check
	,COALESCE(cm.DRGCODE,'') drg--check
	,COALESCE(cm.BILLTYPE,'') billtype--check
	,coalesce(cm.FACILITY,'') factype
	,cm.PLACESVC pos
	,'' tos
	,'' dsc
	,COALESCE(cm.OCCURCODE1,'') occ_code--check
	,'10' icd_format
	,COALESCE((Select top 1 diag from IHHMG.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '1'),'') diag1
	,COALESCE((Select top 1 diag from IHHMG.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '2'),'') diag2
	,COALESCE((Select top 1 diag from IHHMG.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '3'),'') diag3
	,COALESCE((Select top 1 diag from IHHMG.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '4'),'') diag4
	,COALESCE((Select top 1 diag from IHHMG.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '5'),'') diag5
	,COALESCE((Select top 1 diag from IHHMG.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '6'),'') diag6
	,COALESCE((Select top 1 diag from IHHMG.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '7'),'') diag7
	,COALESCE((Select top 1 diag from IHHMG.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '8') ,'')diag8
	,COALESCE((Select top 1 diag from IHHMG.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '9'),'') diag9
	,COALESCE((Select top 1 diag from IHHMG.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '10'),'') diag10
	,COALESCE((Select top 1 diag from IHHMG.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '11'),'') diag11
	,COALESCE((Select top 1 diag from IHHMG.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '12'),'') diag12
	,COALESCE((Select top 1 diag from IHHMG.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '13'),'') diag13
	,COALESCE((Select top 1 diag from IHHMG.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '14'),'') diag14
	,COALESCE((Select top 1 diag from IHHMG.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '15') ,'')diag15
	,COALESCE((Select top 1 diag from IHHMG.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '16') ,'')diag16
	,COALESCE((Select top 1 diag from IHHMG.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '17') ,'')diag17
	,COALESCE((Select top 1 diag from IHHMG.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '18') ,'')diag18
	,COALESCE((Select top 1 diag from IHHMG.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '19'),'') diag19
	,COALESCE((Select top 1 diag from IHHMG.dbo.CLAIM_DIAGS_V where claimno = cm.claimno and TBLROWID = '20'),'') diag20
	,LTRIM(RTRIM(COALESCE(cm.PROC1,''))) surgproc1
	,LTRIM(RTRIM(COALESCE(cm.PROC2,''))) surgproc2
	,LTRIM(RTRIM(COALESCE(cm.PROC3,''))) surgproc3
	,LTRIM(RTRIM(COALESCE(cm.PROC4,''))) surgproc4
	,LTRIM(RTRIM(COALESCE(cm.PROC5,''))) surgproc5
	,LTRIM(RTRIM(COALESCE(cm.PROC6,''))) surgproc6
	,CASE 
		WHEN cm.STATUS = '9' THEN 'P'--check
		WHEN cm.STATUS = '4' THEN 'D'
		ELSE 'D' 
	END claim_status
	,DATEDIFF(DAY,cd.FROMDATESVC,cd.TODATESVC + 1) covered_days		--check
	,CAST(cd.QTY AS INT) units--check
	,'P' source
	,'' src_ind
FROM IHHMG.dbo.CLAIM_MASTERS_V cm 
	LEFT JOIN IHHMG.dbo.CLAIM_DETAILS_V cd on cm.CLAIMNO = cd.CLAIMNO
	LEFT JOIN IHHMG.dbo.MEMB_COMPANY_V mc on cm.MEMBID = mc.MEMBID
	LEFT JOIN IHHMG.dbo.PROV_SPECINFO_V ps on cm.PROV_KEYID = ps.PROV_KEYID
	left join #SPEC_TB tb on tb.SPECNAME = ps.SPECDESCR
WHERE 
	cm.HPCODE LIKE ('IHM%')	--FOR IHHMG & IMPERIAL
	--cm.HPCODE LIKE ('IT%')		--FOR H2793
ORDER BY
	cm.CLAIMNO,
	cd.TBLROWID
