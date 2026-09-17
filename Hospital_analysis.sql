-- Create Tables
DROP TABLE IF EXISTS hospital;
CREATE TABLE hospital (
    
    Hospital_name VARCHAR(100),
    Location VARCHAR(100),
    Department VARCHAR(50),
    Doctors_Count INT,
    Patient_Count INT,
    Admission_Date DATE,
	Discharge_Date DATE,
	Medical_Expenses NUMERIC(10,2)
);
SELECT * FROM hospital;
--Total Number of Patients
SELECT SUM(patient_count) AS total_patient
FROM hospital;
--Average Number of Doctors per Hospital
SELECT AVG(doctors_count) AS avg_doctors_count
FROM hospital;
--Top 3 Departments with the Highest Number of Patients
SELECT department, SUM(patient_count) AS total_patient_per_department
FROM hospital
GROUP BY department
ORDER BY total_patient_per_department DESC LIMIT 3;
--Hospital with the Maximum Medical Expenses
SELECT hospital_name, SUM(medical_expenses) AS total_expenses
FROM hospital
GROUP BY hospital_name
ORDER BY total_expenseS DESC LIMIT 1;
--Daily Average Medical Expenses
SELECT
    hospital_name,
    medical_expenses / (discharge_date - admission_date) AS daily_expenses
FROM hospital;
--Longest Hospital Stay
SELECT hospital_name,location,department, discharge_date - admission_datE AS stay_total
FROM hospital
ORDER BY stay_total DESC LIMIT 1;
--Total Patients Treated Per City
SELECT location,SUM(patient_count) AS pat_per_city
FROM hospital
GROUP BY location;
--Average Length of Stay Per Department
SELECT department, AVG(discharge_date - admission_date) AS avg_stays
FROM hospital
GROUP BY department;
--Identify the Department with the Lowest Number of Patients
SELECT department, SUM(patient_count) AS lowest_patient
FROM hospital
GROUP BY department
ORDER BY lowest_patient LIMIT 1
--Monthly Medical Expenses Report
SELECT
    DATE_TRUNC('month', admission_date) AS month,
    SUM(medical_expenses) AS total_medical_expenses
FROM hospital
GROUP BY month
ORDER BY month;

