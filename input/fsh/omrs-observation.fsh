Profile: OpenMRSObservation
Parent: Observation
Id: OpenMRS-observation
Title: "OpenMRS Observation"
Description: "Observation resource created in OpenMRS representing a result for an order submitted by an EMR System"
* code 1..1
* subject 0..1
* category 1..*
* status 1..1
* interpretation 0..1
* basedOn 0..*
* basedOn only Reference(OpenMRSServiceRequest)
* encounter 1..1
* value[x] 0..1
* referenceRange 0..*
* referenceRange.high 1..1
* referenceRange.low 1..1
* referenceRange.type 1..1
* referenceRange.modifierExtension 0..0
* referenceRange.appliesTo 0..0
* referenceRange.text 0..0
* referenceRange.age 0..0
* component 0..0
* issued 0..0
* effective[x] 0..0
* performer 0..0
* dataAbsentReason 0..0
* bodySite 0..0
* method 0..0
* specimen 0..0
* device 0..0
* component 0..0


/* OpenMRS Observation Resource  Example */

Instance: example-openmrs-Observation
InstanceOf: OpenMRSObservation
Usage: #example
Title: "Openmrs Observation"
Description: "Example OMRS Observation Resource"
* category.coding[+].system = "http://terminology.hl7.org/CodeSystem/observation-category"
* category.coding[=].code = #exam
* code.coding[+].code = #431314004
* code.coding[=].system = "http://snomed.info/sct"
* code.coding[=].display = "Arterial blood oxygen saturation (pulse oximeter)"
* code.text = "Arterial blood oxygen saturation (pulse oximeter)"
* status = #final
* subject = Reference(example-openmrs-Patient)
* encounter = Reference(EncounterExample)
* valueQuantity.value = 25.0
* valueQuantity.unit = "DEG C"
* interpretation.coding[0].code = #H
* interpretation.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation"
* interpretation.coding[0].display = "High"
* referenceRange.low[0].value = 0.0
* referenceRange.high[0].value = 100.0
* referenceRange.type.coding[0].system = "http://fhir.openmrs.org/ext/obs/reference-range"
* referenceRange.type.coding[0].code = #absolute


/** Mapping Fhir2 Observation from HL7*/

Mapping: omrs-observation-mapping
Source: OpenMRSObservation
Target: "http://hl7.org/fhir/{release}/StructureDefinition/observation"
Id: obs-mapping
Title: "FHIR HL7 vs OMRS FHIR2"
Description: "Observation is a FHIR resource that is used to support diagnosis, monitor progress, determine baselines and patterns and even capture demographic characteristics. As such, Observations have a wide range of uses and show up in a wide range of places. FHIR Observations are mapped to OpenMRS Obs objects."
* id -> "obs.uuid"
* code -> "Obs.concept"
* category -> "Obs.concept"
* status -> "Obs.status"
* interpretation -> "Obs.interpretation"
* issued -> "Obs.dateCreated"
* encounter -> "Obs.encounter"
* basedOn -> "Obs.order"
* subject -> "Obs.person"
* value[x] -> "Obs.value"


/** Observation search parameters*/

Instance: observation-date
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through observation endpoint by date "
* name = "observationDateSearchParameter"
* status = #active
* description = "Searches for observations by the observation date and time eg) /ws/fhir2/{release}/Observation?date={date}"
* code = #date
* base[0] = #Observation
* target = #Observation
* type = #date

Instance: observation-concept-code
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through observation endpoint by concept code "
* name = "observationCodeSearchParameter"
* status = #active
* description = "Searches for observations with particular codes (concepts) eg) /ws/fhir2/{release}/Observation?code={code}"
* code = #code
* base[0] = #Observation
* target = #Observation
* type = #token

Instance: observation-category
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through observation endpoint by category "
* name = "observationCategorySearchParameter"
* status = #active
* description = "Searches for observations by the observation category eg) /ws/fhir2/{release}/Observation?category={category}"
* code = #category
* base[0] = #Observation
* target = #Observation
* type = #token

Instance: observation-encounter
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through observation endpoint by encounter "
* name = "observationEncounterSearchParameter"
* status = #active
* description = "Searches for observations by the observation encounter eg) /ws/fhir2/{release}/Observation?encounter.type={type}"
* code = #encounter
* base[0] = #Observation
* target = #Observation
* type = #token

Instance: observation-subject
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through observation endpoint by subject uuid"
* name = "observationSubjectSearchParameter"
* status = #active
* description = "Searches for observations by a given subject eg) /ws/fhir2/{release}/Observation?subject:Patient={patientUuid}"
* code = #subject
* base[0] = #Observation
* target = #Observation
* type = #reference

Instance: observation-subject-identifier
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through observation endpoint by subject identifier"
* name = "observationSubjectIdentifierSearchParameter"
* status = #active
* description = "Searches for observations by the patient identifier eg) /ws/fhir2/{release}/Observation?subject:Patient.identifier={identifier}"
* code = #subject.identifier
* base[0] = #Observation
* target = #Observation
* type = #token

Instance: observation-subject-given
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through observation endpoint by subject given"
* name = "observationSubjectGivenSearchParameter"
* status = #active
* description = "Searches for observations based on the patient's given name(s) eg) /ws/fhir2/{release}/Observation?subject:Patient.given={givenName}"
* code = #subject.given
* base[0] = #Observation
* target = #Observation
* type = #string

Instance: observation-subject-family
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through observation endpoint by subject family"
* name = "observationSubjectfamilySearchParameter"
* status = #active
* description = "	Searches for observations based on the patient's family name eg) /ws/fhir2/{release}/Observation?subject:Patient.family={familyName}"
* code = #subject.family
* base[0] = #Observation
* target = #Observation
* type = #string

Instance: observation-subject-name
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through observation endpoint by subject name"
* name = "observationSubjectNameSearchParameter"
* status = #active
* description = "Searches for observations based on the patient's full or partial name eg) /ws/fhir2/{release}/Observation?subject:Patient.name={name}"
* code = #subject.name
* base[0] = #Observation
* target = #Observation
* type = #string

Instance: observation-patient
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through observation endpoint by a given patient"
* name = "observationPatientSearchParameter"
* status = #active
* description = "Searches for observations by a given patient eg) /ws/fhir2/{release}/Observation?patient={uuid}"
* code = #patient
* base[0] = #Observation
* target = #Observation
* type = #reference

Instance: observation-patient-identifier
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through observation endpoint by a given patient"
* name = "observationPatientIdentifierSearchParameter"
* status = #active
* description = "Searches for observations by a given patient eg) /ws/fhir2/{release}/Observation?patient.identifier={identifier}"
* code = #patient.identifier
* base[0] = #Observation
* target = #Observation
* type = #token

Instance: observation-patient.given
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through observation endpoint by the patient's given name"
* name = "observationPatientGivenNameSearchParameter"
* status = #active
* description = "Searches for observations based on the patient's given name(s) eg) /ws/fhir2/{release}/Observation?patient.given={givenName}"
* code = #patient.given
* base[0] = #Observation
* target = #Observation
* type = #string

Instance: observation-patient.family
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through observation endpoint by the patient's family name"
* name = "observationPatientFamilyNameSearchParameter"
* status = #active
* description = "Searches for observations based on the patient's family name eg) /ws/fhir2/{release}/Observation?patient.family={familyName}"
* code = #patient.family
* base[0] = #Observation
* target = #Observation
* type = #string

Instance: observation-patient.name
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through observation endpoint by the patient's full or partial name"
* name = "observationPatientNameSearchParameter"
* status = #active
* description = "Searches for observations based on the patient's full or partial name eg) /ws/fhir2/{release}/Observation?patient.name={name}"
* code = #patient.name
* base[0] = #Observation
* target = #Observation
* type = #string 

Instance: observation-has-member
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through an observation group in the Obervation EndPoint that contains a given observation"
* name = "observationHasSearchParameter"
* status = #active
* description = "Searches for an observation group that contains a given observation eg) /ws/fhir2/{release}/Observation?has-member"
* code = #has-member
* base[0] = #Observation
* target = #Observation
* type = #reference

Instance: observation-has-member-code
InstanceOf: SearchParameter
Usage: #definition
Title: "Searches for an observation group that contains an observation with the provided code"
* name = "observationHasCodeSearchParameter"
* status = #active
* description = "Searches for an observation group that contains an observation with the provided code eg) /ws/fhir2/{release}/Observation?has-member.code={code}"
* code = #has-member-code
* base[0] = #Observation
* target = #Observation
* type = #token

Instance: observation-value-concept
InstanceOf: SearchParameter
Usage: #definition
Title: "Searches for an observation whose value is a concept that matches the provided concept code"
* name = "observationValueConceptSearchParameter"
* status = #active
* description = "Searches for an observation whose value is a concept that matches the provided concept code eg) /ws/fhir2/{release}/Observation?value-concept={concept}"
* code = #value-concept
* base[0] = #Observation
* target = #Observation
* type = #token

Instance: observation-value-date
InstanceOf: SearchParameter
Usage: #definition
Title: "Searches for an observation whose value is a date by the specified date range."
* name = "observationValueConceptSearchParameter"
* status = #active
* description = "Searches for an observation whose value is a date by the specified date range. eg) /ws/fhir2/{release}/Observation?value-date={date}"
* code = #value-date
* base[0] = #Observation
* target = #Observation
* type = #date

Instance: observation-id
InstanceOf: SearchParameter
Usage: #definition
Title: "Searches based on the exact UUID of the person record"
* name = "observationIdSearchParameter"
* status = #active
* description = "Searches based on the exact UUID of the person record eg) /ws/fhir2/{release}/Observation?_id={uuid}"
* code = #_id
* base[0] = #Observation
* target = #Observation
* type = #token

Instance: observation-lastUpdated
InstanceOf: SearchParameter
Usage: #definition
Title: "Searches based on the the dateCreated field for the observation record"
* name = "observationLastUpdatedSearchParameter"
* status = #active
* description = "Searches based on the the dateCreated field for the observation record eg) /ws/fhir2/{release}/Observation?_lastUpdated={date-range}"
* code = #_lastUpdated
* base[0] = #Observation
* target = #Observation
* type = #date
