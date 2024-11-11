SELECT * FROM ocd.ocd_patient_dataset;
-- 1.List all details of patients.
SELECT * 
FROM ocd_patient_dataset ;

-- 2.Count the number of patients with each marital status.
SELECT `Marital Status`, COUNT(*) AS NumberOfPatients
FROM ocd_patient_dataset
GROUP BY `Marital Status`;

-- 3.Find the total duration of symptoms in months for all patients.
SELECT SUM(`Duration of Symptoms (months)`) AS TotalDuration
FROM ocd_patient_dataset;

-- 4.Calculate the average Y-BOCS score for obsessions across all patients.
SELECT AVG(`Y-BOCS Score (Obsessions)`) AS AverageObsessionsScore
FROM ocd_patient_dataset;

-- 5.Find the maximum and minimum Y-BOCS score for compulsions.
SELECT MAX(`Y-BOCS Score (Compulsions)`) AS MaxCompulsionsScore,
       MIN(`Y-BOCS Score (Compulsions)`) AS MinCompulsionsScore
FROM ocd_patient_dataset;

-- 6.Group patients by gender and find the average age for each gender.
SELECT Gender, AVG(Age) AS AverageAge
FROM ocd_patient_dataset
GROUP BY Gender;

-- 7.Find the obsession types where the average Y-BOCS score for obsessions is greater than 15.
SELECT `Obsession Type`, AVG(`Y-BOCS Score (Obsessions)`) AS AverageObsessionsScore
FROM ocd_patient_dataset
GROUP BY `Obsession Type`
HAVING AVG(`Y-BOCS Score (Obsessions)`) > 15;

-- 8.List patients ordered by their age in descending order
SELECT *
FROM ocd_patient_dataset
ORDER BY age DESC;

-- 9.Find patients diagnosed with OCD after January 1, 2018.
SELECT * 
FROM ocd_patient_dataset
WHERE `OCD Diagnosis Date` > '2018-01-01';

--  10.Find patients whose obsession type includes "Hoarding".
SELECT * 
FROM ocd_patient_dataset
WHERE `Obsession Type` LIKE '%Hoarding%';

-- 11. List all unique education levels of patients.
SELECT DISTINCT `Education Level`
FROM ocd_patient_dataset;

-- 12.List patients who have not been prescribed any medication.
SELECT * 
FROM ocd_patient_dataset
WHERE Medications IS NULL OR Medications = 'None';

-- 13.Find patients whose Y-BOCS score for compulsions is greater than the average score of all patients.
SELECT * 
FROM ocd_patient_dataset
WHERE `Y-BOCS Score (Compulsions)` > (SELECT AVG(`Y-BOCS Score (Compulsions)`) FROM ocd_patient_dataset);

-- 14.Find the average age of patients in the dataset.
WITH AverageAge AS (
    SELECT AVG(Age) AS AvgAge
    FROM ocd_patient_dataset
)
SELECT AvgAge
FROM AverageAge;

-- 15. 













