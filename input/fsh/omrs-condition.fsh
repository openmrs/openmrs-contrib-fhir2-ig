Profile:      OMRSCondition
Parent:       Condition
Id:           omrs-Condition
Title:        "OpenMRS condition"
Description:  "A FHIR Condition as understood by OpenMRS"
* id 1..1 
* code 0..1
* subject 1..1
* subject only Reference(OMRSPatient)
* recorder 0..1 
* recordedDate 0..1
* clinicalStatus 0..1
* verificationStatus 0..1
* onset[x] 0..1

/** OMRS Condition Resource Example **/

Instance: ConditionExample
InstanceOf: OMRSCondition 
Usage: #example
Title: "Condition Resource Example"
Description: "Example OMRS Condition"
* id = "a6867095-e2b1-4a68-9aaa-0d161a37ce9c"
* code.coding = #116128AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
* code.coding.system = "https://openconceptlab.org/orgs/CIEL/sources/CIEL"
* code.coding.code = #116128
* subject = Reference("Patient/da7f524f-27ce-4bb2-86d6-6d1d05312bd5")
* subject.type = "Patient"
* subject.identifier.use = #official
* subject.identifier.value = #101-6
* subject.display =  "Horatio Hornblower (OpenMRS ID:101-6)"
* recordedDate = "2019-06-18T06:37:26+03:00"

/** Condition FHIR -- Openmrs Mapping*/
Mapping: ConditionMapping
Source: OMRSCondition
Target: "http://hl7.org/fhir/3.0/StructureDefinition/Condition"
Id: condition-mapping
Title: "FHIR HL7 vs OMRS FHIR2"
Description: "Condition is an FHIR resource used to record detailed information about the condition, problem, diagnosis, or other events, situation, issue, or clinical concept that has risen to the level of concern. FHIR conditions are mapped to OpenMrs Condition Objects."
* -> "OMRS Condition" "This profile maps to Condition in OMRS FHIR2"
* id -> "condition.uuid"
* clinicalStatus -> "Condition.status"
* code -> "condition.code"
* subject -> "condition.patient"
* onsetDateTime -> "condition.onsetDate"
* recorder -> "condition.creator"
* recordedDate -> "condition.dateCreated"

/** condition search parameters*/

Instance: condition-patient
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through condition endpoint by patient uuid"
* name = "conditionPatientSearchParameter"
* status = #active
* description = "Searches for condition by a given patient Uuid eg) /ws/fhir2/{release}/Condition?patient={uuid}"
* code = #patient
* base[0] = #condition
* target = #OMRSCondition
* type = #reference

Instance: condition-patient-identifier
InstanceOf: SearchParameter
Usage: #definition
Title: "Search condition endpoint by patient identifier id"
* name = "conditionPatientIdentifierSearchParameter"
* status = #active
* description = "Searches for Condition by the patient identifier eg) /ws/fhir2/{release}/Condition?patient.identifier={identifier}"
* code = #patient.identifier
* base[0] = #Condition
* target = #OMRSCondition
* type = #token

Instance: condition-patient.given
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through condtion endpoint by the patient's given name"
* name = "conditionPatientGivenNameSearchParameter"
* status = #active
* description = "Searches for condition based on the patient's given name(s) eg) /ws/fhir2/{release}/Condition?patient.given={givenName}"
* code = #patient.given
* base[0] = #Condition
* target = #OMRSCondition
* type = #string

Instance: condition-patient.family
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through condition endpoint by the patient's family name"
* name = "conditionPatientFamilyNameSearchParameter"
* status = #active
* description = "Searches for condition based on the patient's family name eg) /ws/fhir2/{release}/Condition?patient.family={familyName}"
* code = #patient.family
* base[0] = #Condition
* target = #OMRSCondition
* type = #string

Instance: condition-patient.name
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through condition endpoint by the patient's full or partial name"
* name = "conditionPatientNameSearchParameter"
* status = #active
* description = "Searches for condition based on the  patient's full or partial name eg) /ws/fhir2/{release}/Condition?patient.name={name}"
* code = #patient.name
* base[0] = #Condition
* target = #OMRSCondition
* type = #string

Instance: condition-subject
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through condition endpoint by subject uuid"
* name = "conditionSubjectSearchParameter"
* status = #active
* description = "Searches for condition by a given subject eg) /ws/fhir2/{release}/condition?subject:Patient={patientUuid}"
* code = #subject
* base[0] = #Condition
* target = #OMRSCondition
* type = #reference

Instance: condition-subject-identifier
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through condition endpoint by subject identifier"
* name = "conditionSubjectIdentifierSearchParameter"
* status = #active
* description = "Searches for condition by the patient identifier eg) /ws/fhir2/{release}/Condition?subject:Patient.identifier={identifier}"
* code = #subject.identifier
* base[0] = #Condition
* target = #OMRSCondition
* type = #token

Instance: condition-subject-given
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through condition endpoint by subject given"
* name = "conditionSubjectGivenSearchParameter"
* status = #active
* description = "Searches for condition based on the patient's given name(s) eg) /ws/fhir2/{release}/Condition?subject:Patient.given={givenName}"
* code = #subject.given
* base[0] = #Condition
* target = #OMRSCondition
* type = #string

Instance: condition-subject-family
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through condtion endpoint by subject family"
* name = "conditionSubjectfamilySearchParameter"
* status = #active
* description = "	Searches for condition based on the patient's family name eg) /ws/fhir2/{release}/Condition?subject:Patient.family={familyName}"
* code = #subject.family
* base[0] = #Condition
* target = #OMRSCondition
* type = #string

Instance: condition-subject-name
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through condition endpoint by subject name"
* name = "conditionSubjectNameSearchParameter"
* status = #active
* description = "Searches for condition based on the patient's full or partial name eg) /ws/fhir2/{release}/Condition?subject:Patient.name={name}"
* code = #subject.name
* base[0] = #Condition
* target = #OMRSCondition
* type = #string

Instance: condition-code
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through condition endpoint by concept code"
* name = "conditionCodeSearchParameter"
* status = #active
* description = "Searches for condition based on the condition concept code eg) /ws/fhir2/{release}/Condition?code={code}"
* code = #code
* base[0] = #Condition
* target = #OMRSCondition
* type = #token

Instance: condition-clinical-status
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through condition endpoint by Condition clinical status"
* name = "conditionClinicalStatusSearchParameter"
* status = #active
* description = "Searches for condition based on the condition clinical status concept eg) /ws/fhir2/{release}/Condition?clinical-status={codeable concept}"
* code = #clinical-status
* base[0] = #Condition
* target = #OMRSCondition
* type = #token

Instance: condition-onset-date
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through condition endpoint by Condition clinical onset date"
* name = "conditionOnsetdateSearchParameter"
* status = #active
* description = "Searches for condition based on the condition onset date concept eg) /ws/fhir2/{release}/Condition?onset-date={date}"
* code = #onset-date
* base[0] = #Condition
* target = #OMRSCondition
* type = #date

Instance: condition-onset-age
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through condition endpoint by Condition clinical onset age"
* name = "conditionOnsetAgeSearchParameter"
* status = #active
* description = "Searches for condition based on the condition onset age eg) /ws/fhir2/{release}/Condition?onset-age={date}"
* code = #onset-age
* base[0] = #Condition
* target = #OMRSCondition
* type = #quantity

Instance: condition-recorded-date
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through condition endpoint by date when the record was created"
* name = "conditionRecordedDateSearchParameter"
* status = #active
* description = "Searches for condition based on the condition creation date eg) /ws/fhir2/{release}/Condition?recorded-date={date}"
* code = #recorded-date
* base[0] = #Condition
* target = #OMRSCondition
* type = #date

Instance: condition-id
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through condition endpoint by service Uuid"
* name = "conditionIdSearchParameter"
* status = #active
* description = "Searches for condition based on service Uuid eg) /ws/fhir2/{release}/Condition?_id={uuid}"
* code = #_id
* base[0] = #Condition
* target = #OMRSCondition
* type = #token

Instance: condition-lastUpdated
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through condition endpoint by service lastUpdated field"
* name = "conditionLastUpdatedSearchParameter"
* status = #active
* description = "Searches for condition based on service lastUpdated field eg) /openmrs/ws/fhir2/{release}/Condition?_lastUpdated={date}"
* code = #_lastUpdated
* base[0] = #Condition
* target = #OMRSCondition
* type = #date

