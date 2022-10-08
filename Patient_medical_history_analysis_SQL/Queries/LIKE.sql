SELECT medications.patient,
       medications.description,
       medications.reasondescription
  FROM medications
 WHERE medications.description LIKE "Acetaminophen%"

======================================================

SELECT medications.patient,
       medications.description,
       medications.reasondescription
  FROM medications
 WHERE medications.description LIKE "Acetaminophen%"
       AND medications.description NOT LIKE "%codone%"
 ORDER BY medications.description DESC

======================================================

SELECT observations.patient,
       observations.description,
       observations.value
  FROM observations
 WHERE observations.description = "Quality adjusted life years"
       AND observations.value BETWEEN 1 AND 5

======================================================

SELECT *
  FROM immunizations
 LIMIT 100
OFFSET 100