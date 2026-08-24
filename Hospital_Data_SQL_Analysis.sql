-- Hospital Data Analysis | 30 Days SQL Micro Course
-- Database/Table: hospital_data

-- 1. Total Number of Patients
SELECT SUM(`Patients Count`) AS total_patients
FROM hospital_data;

-- 2. Average Number of Doctors per Hospital
SELECT `Hospital Name`,
       ROUND(AVG(`Doctors Count`), 2) AS average_doctors
FROM hospital_data
GROUP BY `Hospital Name`;

-- 3. Top 3 Departments with Highest Number of Patients
SELECT `Department`,
       SUM(`Patients Count`) AS total_patients
FROM hospital_data
GROUP BY `Department`
ORDER BY total_patients DESC
LIMIT 3;

-- 4. Hospital with Maximum Medical Expenses
SELECT `Hospital Name`, `Medical Expenses`
FROM hospital_data
ORDER BY `Medical Expenses` DESC
LIMIT 1;

-- 5. Daily Average Medical Expenses
SELECT `Hospital Name`,
       ROUND(AVG(`Medical Expenses` /
       DATEDIFF(
           STR_TO_DATE(`Discharge Date`, '%d-%m-%Y'),
           STR_TO_DATE(`Admission Date`, '%d-%m-%Y')
       )), 2) AS daily_average_expenses
FROM hospital_data
GROUP BY `Hospital Name`;

-- 6. Longest Hospital Stay
SELECT `Hospital Name`, `Department`,
       `Admission Date`, `Discharge Date`,
       DATEDIFF(
           STR_TO_DATE(`Discharge Date`, '%d-%m-%Y'),
           STR_TO_DATE(`Admission Date`, '%d-%m-%Y')
       ) AS stay_days
FROM hospital_data
ORDER BY stay_days DESC
LIMIT 1;

-- 7. Total Patients Treated Per City
SELECT `Location` AS city,
       SUM(`Patients Count`) AS total_patients
FROM hospital_data
GROUP BY `Location`
ORDER BY total_patients DESC;

-- 8. Average Length of Stay Per Department
SELECT `Department`,
       ROUND(AVG(DATEDIFF(
           STR_TO_DATE(`Discharge Date`, '%d-%m-%Y'),
           STR_TO_DATE(`Admission Date`, '%d-%m-%Y')
       )), 2) AS average_stay_days
FROM hospital_data
GROUP BY `Department`
ORDER BY average_stay_days DESC;

-- 9. Department with Lowest Number of Patients
SELECT `Department`,
       SUM(`Patients Count`) AS total_patients
FROM hospital_data
GROUP BY `Department`
ORDER BY total_patients ASC
LIMIT 1;

-- 10. Monthly Medical Expenses Report
SELECT DATE_FORMAT(
           STR_TO_DATE(`Admission Date`, '%d-%m-%Y'),
           '%Y-%m'
       ) AS month,
       ROUND(SUM(`Medical Expenses`), 2) AS total_medical_expenses
FROM hospital_data
GROUP BY month
ORDER BY month;
