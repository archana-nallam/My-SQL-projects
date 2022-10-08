SELECT *
  FROM observations
 WHERE observations.description = "Body Weight"
 ORDER BY observations.value

=====================================================

SELECT observations.date,
       observations.patient,
       observations.description,
       observations.value,
       observations.units
  FROM observations
 WHERE observations.description = "Body Height"
 ORDER BY observations.value DESC

====================================================

SELECT medications.patient,
       medications.description,
       medications.reasondescription
  FROM medications
 WHERE medications.reasondescription = "Stroke"
       AND medications.description = "Clopidogrel 75 MG Oral Tablet"
 ORDER BY medications.patient

