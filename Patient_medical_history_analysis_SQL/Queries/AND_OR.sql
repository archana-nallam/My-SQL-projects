SELECT *
  FROM conditions
 WHERE conditions.description = "Diabetes"
 OR conditions.description = "Prediabetes"

================================================

SELECT DISTINCT procedures.description
  FROM procedures
 WHERE procedures.reasondescription = "Normal pregnancy"
       AND NOT procedures.description = "Standard pregnancy test"

================================================
SELECT observations.patient,
       observations.description,
       observations.value * 2.2 AS `Weight in lbs`
  FROM observations
 WHERE observations.description = "Body Weight"
================================================

SELECT observations.patient,
       observations.description,
       observations.value/2.5 AS `Height in Inches`
  FROM observations
 WHERE observations.description = "Body Height"
       AND observations.value/2.5 > 65
================================================
SELECT medications.patient,
       medications.description,
       medications.reasondescription
  FROM medications
 WHERE medications.reasondescription IS NOT NULL