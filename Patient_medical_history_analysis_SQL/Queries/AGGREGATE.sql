SELECT allergies.description,
       COUNT(*)
  FROM allergies
 WHERE allergies.description = "Allergy to fish"
=================================================================

SELECT observations_cleaned.patient,
       AVG(observations_cleaned.value),
       observations_cleaned.units
  FROM observations_cleaned
 WHERE observations_cleaned.description = "Body Weight"
=================================================================

SELECT observations_cleaned.description,
       MAX(observations_cleaned.value),
       observations_cleaned.units
  FROM observations_cleaned
 WHERE observations_cleaned.description = "Body Height"
=================================================================

SELECT allergies.patient,
       COUNT(allergies.description)
  FROM allergies
 GROUP BY allergies.patient
 ORDER BY COUNT(allergies.description) DESC
=================================================================

SELECT observations_cleaned.patient,
       AVG(observations_cleaned.value) AS `Avg BMI`,
       COUNT(observations_cleaned.value) AS `Number of Readings`,
       MAX(observations_cleaned.value)
       FILTER(WHERE observations_cleaned.value > 30) AS `Max Obese BMI`
  FROM observations_cleaned
 WHERE observations_cleaned.description = "Body Mass Index"
 GROUP BY observations_cleaned.patient
=================================================================

SELECT observations_cleaned.patient,
       AVG(observations_cleaned.value) AS `Avg BMI`,
       COUNT(observations_cleaned.value) AS `Number of Readings`,
       MAX(observations_cleaned.value)
       FILTER(WHERE observations_cleaned.value > 30) AS `Max Obese BMI`
  FROM observations_cleaned
 WHERE observations_cleaned.description = "Body Mass Index"
 GROUP BY observations_cleaned.patient
HAVING AVG(observations_cleaned.value) > 30
 ORDER BY MAX(observations_cleaned.value) DESC
=================================================================

