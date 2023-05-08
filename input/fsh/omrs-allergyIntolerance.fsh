Profile:  OpenMRSAllergyIntolerance
Parent:   AllergyIntolerance
Id:       omrs-AllergyIntolerance
Title:    "OpenMRS AllergyIntolerance"
Description: "A FHIR Allergy as understood by OpenMRS"
* id 1..1
* code 0..1
* reaction 0..1
* reaction.severity 1..1
* type  0..1
* clinicalStatus 0..1
* verificationStatus 0..1
* patient 1..1
* recorder 0..1
* type 0..1
* criticality 0..1
* recordedDate 0..1
* category 0..0
* encounter 0..0
* onset[x] 0..0
* asserter 0..0
* lastOccurrence 0..0
* note 0..*

/** OMRS AllergyIntolerance Resource Example **/

Instance: AllergyIntoleranceExample
InstanceOf: OpenMRSAllergyIntolerance
Usage: #example
Title: "OpenMRS Allergy Intolerance Example"
Description: "Example OpenMRS Allergy Intolerance resource"
* id = "5b829d01-34bb-47d1-b1bb-9303c3a9ebc"
* patient = Reference(example-openmrs-Patient)
* patient.type = "Patient"
* recorder = Reference(PractitionerExample)
* recorder.type = "Practitioner"
* recorder.display = "Super User"
* reaction.severity = #mild
* reaction.substance.coding.code = #162298
* reaction.substance.coding.system = "https://openconceptlab.org/orgs/CIEL/sources/CIEL"
* reaction.manifestation = LOINC#22748-8
* clinicalStatus.coding.system = "http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical"
* clinicalStatus.coding.code =  #active
* clinicalStatus.coding.display = #active
//* identifier.id = "dce9740a-1691-11df-97a5-7038c432aabf"
//* identifier.use = #usual
* identifier.system = "http://fhir.openmrs.org/code-system/allergyID"
* identifier.value = #dce9740a-1691-11df-97a5-7038c432aabf

/** Allergy intolerance omrs fhir mapping*/

Mapping: AllergyIntoleranceMapping
Source: OpenMRSAllergyIntolerance
Target: "AllergyIntolerance"
Id: allergyintolerance-mapping
Title: "FHIR HL7 vs OMRS FHIR2"
Description: "Allergy or Intolerance; a propensity, or a potential risk to an individual, to have an adverse reaction on future exposure to the specified substance, or class of substance."
* -> "OMRS Allergy intolerance" "This profile maps to allergy intolerance in OMRS FHIR2"
* id -> "allergy.uuid"
* category -> "allergy.Category"
* identifier -> "allery.identifier"
* code -> "allergy.Code"
* reaction -> "allergy.concept"
* note -> "allergy.comment"
* recorder -> "allergy.creator"
* recordedDate -> "allergy.createdDate"
* criticality -> "allergy.severity"
* verificationStatus -> "allergy.status"
* clinicalStatus -> "allergy.status"
* type -> "allergy.AllergyIntoleranceType"
* patient -> "allergy.patient"

/** AllergyIntolerance search parameters*/

Instance: AllergyIntolerance-subject
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through AllergyIntolerance endpoint by subject uuid"
* name = "AllergyIntoleranceSubjectSearchParameter"
* status = #active
* description = "Searches for AllergyIntolerance by a given subject eg) /ws/fhir2/{release}/AllergyIntolerance?subject:Patient={patientUuid}"
* code = #subject
* base[0] = #AllergyIntolerance
* target = #AllergyIntolerance
* type = #reference

Instance: AllergyIntolerance-subject-identifier
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through AllergyIntolerance endpoint by subject identifier"
* name = "AllergyIntoleranceSubjectIdentifierSearchParameter"
* status = #active
* description = "Searches for AllergyIntolerance by the patient identifier eg) /ws/fhir2/{release}/AllergyIntolerance?subject:Patient.identifier={identifier}"
* code = #subject.identifier
* base[0] = #AllergyIntolerance
* target = #AllergyIntolerance
* type = #token

Instance: AllergyIntolerance-subject-given
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through AllergyIntolerance endpoint by subject given"
* name = "AllergyIntoleranceSubjectGivenSearchParameter"
* status = #active
* description = "Searches for AllergyIntolerance based on the patient's given name(s) eg) /ws/fhir2/{release}/AllergyIntolerance?subject:Patient.given={givenName}"
* code = #subject.given
* base[0] = #AllergyIntolerance
* target = #AllergyIntolerance
* type = #string

Instance: AllergyIntolerance-subject-family
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through AllergyIntolerance endpoint by subject family"
* name = "AllergyIntoleranceSubjectfamilySearchParameter"
* status = #active
* description = "	Searches for AllergyIntolerance based on the patient's family name eg) /ws/fhir2/{release}/AllergyIntolerance?subject:Patient.family={familyName}"
* code = #subject.family
* base[0] = #AllergyIntolerance
* target = #AllergyIntolerance
* type = #string

Instance: AllergyIntolerance-subject-name
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through AllergyIntolerance endpoint by subject name"
* name = "AllergyIntoleranceSubjectNameSearchParameter"
* status = #active
* description = "Searches for AllergyIntolerance based on the patient's full or partial name eg) /ws/fhir2/{release}/AllergyIntolerance?subject:Patient.name={name}"
* code = #subject.name
* base[0] = #AllergyIntolerance
* target = #AllergyIntolerance
* type = #string

Instance: AllergyIntolerance-patient
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through AllergyIntolerance endpoint by a given patient"
* name = "AllergyIntolerancePatientSearchParameter"
* status = #active
* description = "Searches for AllergyIntolerance by a given patient eg) /ws/fhir2/{release}/AllergyIntolerance?patient={patientUuid}"
* code = #patient
* base[0] = #AllergyIntolerance
* target = #AllergyIntolerance
* type = #reference

Instance: AllergyIntolerance-patient-identifier
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through AllergyIntolerance endpoint by a given patient"
* name = "AllergyIntolerancePatientIdentifierSearchParameter"
* status = #active
* description = "Searches for AllergyIntolerance by a given patient eg) /ws/fhir2/{release}/AllergyIntolerance?patient.identifier={identifier}"
* code = #patient.identifier
* base[0] = #AllergyIntolerance
* target = #AllergyIntolerance
* type = #token

Instance: AllergyIntolerance-patient.given
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through AllergyIntolerance endpoint by the patient's given name"
* name = "AllergyIntolerancePatientGivenNameSearchParameter"
* status = #active
* description = "Searches for AllergyIntolerance based on the patient's given name(s) eg) /ws/fhir2/{release}/AllergyIntolerance?patient.given={givenName}"
* code = #patient.given
* base[0] = #AllergyIntolerance
* target = #AllergyIntolerance
* type = #string

Instance: AllergyIntolerance-patient-family
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through AllergyIntolerance endpoint by the patient's family name"
* name = "AllergyIntolerancePatientFamilyNameSearchParameter"
* status = #active
* description = "Searches for AllergyIntolerance based on the patient's family name eg) /ws/fhir2/{release}/AllergyIntolerance?patient.family={familyName}"
* code = #patient.family
* base[0] = #AllergyIntolerance
* target = #AllergyIntolerance
* type = #string

Instance: AllergyIntolerance-patient-name
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through AllergyIntolerance endpoint by the patient's full or partial name"
* name = "AllergyIntolerancePatientNameSearchParameter"
* status = #active
* description = "Searches for AllergyIntolerance based on the patient's full or partial name eg) /ws/fhir2/{release}/AllergyIntolerance?patient-name={name}"
* code = #patient-name
* base[0] = #AllergyIntolerance
* target = #AllergyIntolerance
* type = #string

Instance: AllergyIntolerance-category
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through AllergyIntolerance endpoint by the category"
* name = "AllergyIntoleranceCategorySearchParameter"
* status = #active
* description = "Searches for AllergyIntolerance based on the category eg) /ws/fhir2/{release}/AllergyIntolerance?category={category}"
* code = #category
* base[0] = #AllergyIntolerance
* target = #AllergyIntolerance
* type = #token

Instance: AllergyIntolerance-severity
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through AllergyIntolerance endpoint by the severity"
* name = "AllergyIntoleranceSeveritySearchParameter"
* status = #active
* description = "Searches for AllergyIntolerance based on the severity eg) /ws/fhir2/{release}/AllergyIntolerance?category={codeable concept}"
* code = #severity
* base[0] = #AllergyIntolerance
* target = #AllergyIntolerance
* type = #token

Instance: AllergyIntolerance-manifestation
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through AllergyIntolerance endpoint by the manifestation"
* name = "AllergyIntolerancemanifestationSearchParameter"
* status = #active
* description = "Searches for AllergyIntolerance based on the manifestation eg) /ws/fhir2/{release}/AllergyIntolerance?manifestation={codeable concept}"
* code = #manifestation
* base[0] = #AllergyIntolerance
* target = #AllergyIntolerance
* type = #token

Instance: AllergyIntolerance-clinical-status
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through AllergyIntolerance endpoint by the clinical-status"
* name = "AllergyIntoleranceClinicalStatusSearchParameter"
* status = #active
* description = "Searches for AllergyIntolerance based on the clinical-status eg) /ws/fhir2/{release}/AllergyIntolerance?clinical-status={codeable concept}"
* code = #clinical-status
* base[0] = #AllergyIntolerance
* target = #AllergyIntolerance
* type = #token

Instance: AllergyIntolerance-id
InstanceOf: SearchParameter
Usage: #definition
Title: "Search in AllergyIntolerance endpoint basing on AllergyIntolerance uuid  attribute"
* name = "AllergyIntoleranceIdSearchParameter"
* status = #active
* description = "Searches based on the AllergyIntolerance uuid field for the AllergyIntolerance record eg) /ws/fhir2/{release}}/AllergyIntolerance?_id={uuid}"
* code = #_id
* base[0] = #AllergyIntolerance
* target = #AllergyIntolerance
* type = #token

Instance: AllergyIntolerance-lastUpdated
InstanceOf: SearchParameter
Usage: #definition
Title: "Search in AllergyIntolerance endpoint basing on AllergyIntolerance lastUpdated  attribute"
* name = "AllergyIntoleranceLastUpdatedSearchParameter"
* status = #active
* description = "Searches based on the AllergyIntolerance lastUpdated field for the AllergyIntolerance record eg) /ws/fhir2/{release}/AllergyIntolerance?_lastUpdated={date}"
* code = #_lastUpdated
* base[0] = #AllergyIntolerance
* target = #AllergyIntolerance
* type = #date
