SELECT * FROM hospital.patient;
SELECT * FROM hospital.`hospital(1)`;
SELECT * FROM hospital.patient;
alter table hospital.patient
RENAME column ï»¿patientid TO Patient_id;

-- 1.Find the average admission deposit for each hospital along with the number of patients in each hospital. Also, inclFude the hospital code and department. sort the results by the total number of patients in descending order."
SELECT 
    COUNT(p.patient_id) AS Number_of_Patients,
    AVG(p.Admission_Deposit) AS Average_Admission_Deposit
FROM patient p
INNER JOIN `hospital(1)` h ON p.City_Code_Patient = h.City_Code_Hospital
GROUP BY h.Hospital_code, h.Department
ORDER BY Number_of_Patients DESC;

-- 2.To get the number of patients in each hospital.
SELECT h.Hospital_code, COUNT(p.patient_id) AS Number_of_Patients
FROM `hospital(1)` h
LEFT JOIN patient p ON h.City_Code_Hospital = p.City_Code_Patient
GROUP BY h.Hospital_code;

-- 3.How many patient records are there in the dataset?
SELECT COUNT(*) AS Total_Patients
FROM patient;

-- 4.What is the average admission deposit for each age group?
SELECT Age, AVG(Admission_Deposit) AS Average_Deposit
FROM patient
GROUP BY Age;

-- 5.What are the maximum and minimum admission deposits for each type of admission?
SELECT `Type of Admission`,
       MAX(Admission_Deposit) AS Max_Deposit,
       MIN(Admission_Deposit) AS Min_Deposit
FROM patient
GROUP BY `Type of Admission`;

-- 6.What is the total number of visitors recorded for each patient?
SELECT patient_id, SUM(`Visitors with Patient`) AS Total_Visitors
FROM patient
GROUP BY patient_id;

-- 7.Who are the patients with the highest admission deposit?
SELECT patient_id, Admission_Deposit
FROM patient
ORDER BY Admission_Deposit DESC
LIMIT 1;

-- 8.What is the average admission deposit for patients aged 71-80?
SELECT AVG(Admission_Deposit) AS Average_Deposit
FROM patient
WHERE Age = '71-80';

-- 9.How many patient records are there with missing City_Code_Patient?
SELECT COUNT(*) AS Missing_City_Code
FROM patient
WHERE City_Code_Patient IS NULL;

-- 10.Concatenate Type of Admission and Severity of Illness into a single column named Admission_Info.
SELECT patient_id,
       CONCAT(`Type of Admission`, ' - ', `Severity of Illness`) AS Admission_Info
FROM patient;

-- 11.What is the total admission deposit for each combination of Type of Admission and Age?
SELECT `Type of Admission`,
       Age,
       SUM(Admission_Deposit) AS Total_Deposit
FROM patient
GROUP BY `Type of Admission`, Age;

-- 12.How many distinct types of admission are there?
SELECT COUNT(DISTINCT `Type of Admission`) AS Distinct_Admission_Types
FROM patient;

-- 13.Which age group has the highest average admission deposit?
SELECT Age,
       AVG(Admission_Deposit) AS Average_Deposit
FROM patient
GROUP BY Age
ORDER BY Average_Deposit DESC
LIMIT 1;


















