SELECT observations_cleaned.patient,
       AVG(observations_cleaned.value) AS `Avg BMI`,
       CASE
         WHEN observations_cleaned.value < 18.5
         THEN "Underweight"
         WHEN observations_cleaned.value >= 18.5 AND observations_cleaned.value < 25
         THEN "Healthy"
         WHEN observations_cleaned.value >= 25 AND observations_cleaned.value < 30
         THEN "Overweight"
         WHEN observations_cleaned.value >= 30
         THEN "Obese"
       END AS `BMI category`
  FROM observations_cleaned
 WHERE observations_cleaned.description = "Body Mass Index"
 GROUP BY observations_cleaned.patient, `BMI category`

=============================================================

SELECT allergies.patient,
       allergies.description
  FROM allergies
 WHERE allergies.description IN ("Allergy to mould", "Allergy to grass pollen", "Allergy to tree pollen", "House dust mite allergy")

=============================================================

SELECT patients.patient,
       birthdate,
       deathdate,
       DATE_DIFF(birthdate, deathdate, "year") AS `age at death`
  FROM patients
 WHERE patients.deathdate IS NOT NULL
 ORDER BY `age at death` DESC