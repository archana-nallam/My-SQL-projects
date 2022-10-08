SELECT *
  FROM allergies
============================================

SELECT conditions.start,
       conditions.stop,
       conditions.description AS condition
  FROM conditions
============================================

SELECT DISTINCT allergies.description
  FROM allergies
============================================

SELECT *
  FROM immunizations
 LIMIT 100
============================================

SELECT *
  FROM allergies
 WHERE allergies.description = "Allergy to mould"

============================================
SELECT *
  FROM all_prevalences
 WHERE all_prevalences.occurrences > 100

