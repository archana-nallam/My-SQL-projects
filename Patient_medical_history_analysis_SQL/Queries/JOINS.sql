SELECT patients.patient,
       patients.marital,
       patients.race,
       patients.ethnicity,
       patients.gender,
       medications.description AS medication,
       medications.reasondescription AS diagnosis
  FROM patients, medications
 WHERE patients.patient = medications.patient

===============================================

SELECT patients.patient,
       patients.marital,
       patients.race,
       patients.ethnicity,
       patients.gender,
       medications.description AS medication,
       medications.reasondescription AS diagnosis
  FROM patients
       JOIN medications
       USING (patient)

=================================================

SELECT patients.patient,
       patients.marital,
       patients.race,
       patients.ethnicity,
       patients.gender,
       medications.description AS medication,
       medications.reasondescription AS diagnosis
  FROM patients
       JOIN medications
       ON medications.patient = patients.patient

=================================================
SELECT patients.patient,
       patients.race,
       patients.ethnicity,
       patients.gender,
       procedures.description AS procedure,
       procedures.reasondescription AS diagnosis
  FROM patients
       LEFT OUTER JOIN procedures
       ON patients.patient = procedures.patient
 WHERE patients.race = "asian"
       AND patients.gender = "F"
=================================================

SELECT patients.patient,
       patients.race,
       patients.ethnicity,
       patients.gender,
       procedures.description AS procedure,
       procedures.reasondescription AS diagnosis
  FROM patients
       LEFT OUTER JOIN procedures
       ON patients.patient = procedures.patient
 WHERE patients.race = "asian"
       AND patients.gender = "F"

=================================================

SELECT observations.patient,
       observations.description,
       CAST(observations.value AS DECIMAL),
       observations.units
  FROM observations
 WHERE observations.description = "Body Height"