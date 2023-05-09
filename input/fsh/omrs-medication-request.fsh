//Alias: MedicPriorityVs = http://fhir.openmrs.org/fhir/request-priority
Alias: $systemUrl = http://fhir.openmrs.org
//Alias: MedicIntentVs = http://fhir.openmrs.org/fhir/CodeSystem/medicationrequest-intent

/** medication request resource profile*/

Profile: OMRSMedicationRequest
Parent: MedicationRequest
Id: omrs-medication-request
Title: "OpenMRS Medication Request"
Description: "A FHIR MedicationRequest as understood by OpenMRS"
* identifier 1..*
* status 1..1
* intent 1..1
//* intent from MedicationRequestIntentVs
* priority 1..1
//* priority from MedicationRequestPriorityVs
* medication[x] 1..1
* medicationCodeableConcept 1..1
* subject 1..1 
* subject only Reference(OMRSPatient)
* encounter 1..1
* encounter only Reference(OMRSEncounter)
* authoredOn 0..1
* requester 1..1
* requester only Reference(OMRSPractitioner)
* reasonCode 0..*
* basedOn 0..*
* basedOn only Reference(OMRSMedicationRequest)
* note 0..1
* dosageInstruction 0..*
* dispenseRequest 0..1
* dispenseRequest.numberOfRepeatsAllowed 1..1
* dispenseRequest.quantity 1..1
* priorPrescription 0..1
* priorPrescription only Reference(OMRSMedicationRequest)

/** Medication request Intent value set*/

// ValueSet: MedicationRequestIntentVs
// Id: medication-request-intent-vs
// Title: "Medication Request Intent Vs"
// Description: "Medication Request Intent ValueSet"
// * ^experimental = true
// * MedicIntentVs#proposal "Proposal"
// * MedicIntentVs#plan "Plan"
// * MedicIntentVs#order "Order"
// * MedicIntentVs#original-order "Original Order"
// * MedicIntentVs#reflex-order "Reflex Order"
// * MedicIntentVs#filler-order "Filler Order"
// * MedicIntentVs#instance-order "Instance Order"
// * MedicIntentVs#option "Option"



// ValueSet: MedicationRequestPriorityVs
// Id: medication-request-priority-vs
// Title: "Medication Request Priority ValueSet"
// Description: "Openmrs Medication Request Priority ValueSet"
// * ^experimental = true
// * MedicPriorityVs#routine "Routine"
// * MedicPriorityVs#urgent "Urgent"
// * MedicPriorityVs#asap "ASAP"
// * MedicPriorityVs#stat "STAT"


/** MedicationRequest OMRS VS FHIR Mapping*/

Mapping: MedicationRequestMapping   
Source: OMRSMedicationRequest
Target: "MedicationRequest"
Id: omrs-medication-request-mapping
Title: "FHIR  vs OMRS FHIR2"
Description: "MedicationRequest mapping shows how attributes of the FHIR MedicationRequest Resource map to the attributes of the OpenMRS Drug Order object"
* ->  "OMRS MedicationRequest" "This profile maps HL7 FHIR MedicationRequest to OMRS FHIR2"
* id -> "Order.id"
* intent -> "MedicationRequestIntent.ORDER"
* priority -> "Order.Urgency"
* subject -> "Order.Patient"
* encounter -> "Order.Encounter"
* requester -> "Order.Provider"
* reasonCode -> "Order.OrderReason"
* basedOn -> "Order.PreviousOrder"
* note -> "Order.commentToFulfiller"
* dispenseRequest.numberOfRepeatsAllowed -> "numRefills"
* dispenseRequest.quantity -> "quantity"
* priorPrescription -> "Order.PreviousOrder"

/* example for medication request resource */

Instance: OMRSMedicationRequestExample
InstanceOf: OMRSMedicationRequest
Usage: #example
Title: "OpenMRS Medication Request Example"
Description: "Example OpenMRS Medication Request resource"
* identifier.id = "c9582307-b812-4acc-b82b-77c4c24ba7bc"
* status = #active
* intent = #order
* priority = #urgent
* medicationCodeableConcept[+].id = "485df1f8-1813-42ae-ae81-f892f9562067"
* medicationCodeableConcept[=].coding.id = "7bb88c7a-9644-4d87-8a21-686126c8bb38"
* medicationCodeableConcept[=].coding.system = $systemUrl
* medicationCodeableConcept[=].coding.display = "Cetirizine"
* subject = Reference(example-openmrs-Patient) 
* encounter = Reference(EncounterExample)
* authoredOn = "2022-08-07"
* requester = Reference(PractitionerExample)
* dispenseRequest.numberOfRepeatsAllowed = 0
* dispenseRequest.quantity.value = 10
* dispenseRequest.quantity.unit = "tab (s)"
* dosageInstruction.sequence = 1
* dosageInstruction.timing.code.coding[+].id = "05a3c873-a884-4edd-88de-25622f121d77"
* dosageInstruction.timing.code.coding[=].display = "1/day x 7 days/week"
* dosageInstruction.timing.code.coding[=].system = $systemUrl
* dosageInstruction.timing.code.text = "1/day x 7 days/week"
* dosageInstruction.route[+].id = "91753a5c-f3c2-4179-9a1b-35c80df575ce"
* dosageInstruction.route[=].coding[+].id = "41c75ba4-a423-4628-9d1d-0d306ab1f250"
* dosageInstruction.route[=].coding[=].display = "UNKNOWN"
* dosageInstruction.route[=].coding[=].system = $systemUrl 
* dosageInstruction.route[=].text = "UNKNOWN"

/** MedicationRequest Search Parameter*/

Instance: MedicationRequest-subject
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through MedicationRequest endpoint by subject uuid"
* name = "MedicationRequestSubjectSearchParameter"
* status = #active
* description = "Searches for MedicationRequest by a given subject eg) /ws/fhir2/{release}/MedicationRequest?subject:Patient={patientUuid}"
* code = #subject
* base[0] = #MedicationRequest
* target = #MedicationRequest
* type = #reference

Instance: MedicationRequest-subject-identifier
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through MedicationRequest endpoint by subject identifier"
* name = "MedicationRequestSubjectIdentifierSearchParameter"
* status = #active
* description = "Searches for MedicationRequest by the patient identifier eg) /ws/fhir2/{release}/MedicationRequest?subject:Patient.identifier={identifier}"
* code = #subject.identifier
* base[0] = #MedicationRequest
* target = #MedicationRequest
* type = #token

Instance: MedicationRequest-subject-given
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through MedicationRequest endpoint by subject given"
* name = "MedicationRequestSubjectGivenSearchParameter"
* status = #active
* description = "Searches for MedicationRequest based on the patient's given name(s) eg) /ws/fhir2/{release}/MedicationRequest?subject:Patient.given={givenName}"
* code = #subject.given
* base[0] = #MedicationRequest
* target = #MedicationRequest
* type = #string

Instance: MedicationRequest-subject-family
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through MedicationRequest endpoint by subject family"
* name = "MedicationRequestSubjectfamilySearchParameter"
* status = #active
* description = "	Searches for MedicationRequest based on the patient's family name eg) /ws/fhir2/{release}/MedicationRequest?subject:Patient.family={familyName}"
* code = #subject.family
* base[0] = #MedicationRequest
* target = #MedicationRequest
* type = #string

Instance: MedicationRequest-subject-name
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through MedicationRequest endpoint by subject name"
* name = "MedicationRequestSubjectNameSearchParameter"
* status = #active
* description = "Searches for MedicationRequest based on the patient's full or partial name eg) /ws/fhir2/{release}/MedicationRequest?subject:Patient.name={name}"
* code = #subject.name
* base[0] = #MedicationRequest
* target = #MedicationRequest
* type = #string

Instance: MedicationRequest-patient
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through MedicationRequest endpoint by a given patient"
* name = "MedicationRequestPatientSearchParameter"
* status = #active
* description = "Searches for MedicationRequest by a given patient eg) /ws/fhir2/{release}/MedicationRequest?patient={patientUuid}"
* code = #patient
* base[0] = #MedicationRequest
* target = #MedicationRequest
* type = #reference

Instance: MedicationRequest-patient-identifier
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through MedicationRequest endpoint by a given patient"
* name = "MedicationRequestPatientIdentifierSearchParameter"
* status = #active
* description = "Searches for MedicationRequest by a given patient eg) /ws/fhir2/{release}/MedicationRequest?patient.identifier={identifier}"
* code = #patient.identifier
* base[0] = #MedicationRequest
* target = #MedicationRequest
* type = #token

Instance: MedicationRequest-patient.given
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through MedicationRequest endpoint by the patient's given name"
* name = "MedicationRequestPatientGivenNameSearchParameter"
* status = #active
* description = "Searches for MedicationRequest based on the patient's given name(s) eg) /ws/fhir2/{release}/MedicationRequest?patient.given={givenName}"
* code = #patient.given
* base[0] = #MedicationRequest
* target = #MedicationRequest
* type = #string

Instance: MedicationRequest-patient.family
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through MedicationRequest endpoint by the patient's family name"
* name = "MedicationRequestPatientFamilyNameSearchParameter"
* status = #active
* description = "Searches for MedicationRequest based on the patient's family name eg) /ws/fhir2/{release}/MedicationRequest?patient.family={familyName}"
* code = #patient.family
* base[0] = #MedicationRequest
* target = #MedicationRequest
* type = #string

Instance: MedicationRequest-patient-name
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through MedicationRequest endpoint by the patient's full or partial name"
* name = "MedicationRequestPatientNameSearchParameter"
* status = #active
* description = "Searches for MedicationRequest based on the patient's full or partial name eg) /ws/fhir2/{release}/MedicationRequest?patient-name={name}"
* code = #patient-name
* base[0] = #MedicationRequest
* target = #MedicationRequest
* type = #string 

Instance: MedicationRequest-requestor
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through MedicationRequest endpoint by a given Practitioner"
* name = "MedicationRequestRequestorSearchParameter"
* status = #active
* description = "Searches for MedicationRequest by a given Practitioner Reference uuid eg) /ws/fhir2/{release}/MedicationRequest?requestor={Uuid}"
* code = #requestor
* base[0] = #MedicationRequest
* target = #MedicationRequest
* type = #reference

Instance: MedicationRequest-requestor-identifier
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through MedicationRequest endpoint by a given Practitioner"
* name = "MedicationRequestRequestorIdentifierSearchParameter"
* status = #active
* description = "Searches for MedicationRequest by a given Practitioner eg) /ws/fhir2/{release}/MedicationRequest?requestor.identifier={identifier}"
* code = #requestor.identifier
* base[0] = #MedicationRequest
* target = #MedicationRequest
* type = #token

Instance: MedicationRequest-requestor.given
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through MedicationRequest endpoint by the Practitioner's given name"
* name = "MedicationRequestRequestorGivenNameSearchParameter"
* status = #active
* description = "Searches for MedicationRequest based on the Practitioner's given name(s) eg) /ws/fhir2/{release}/MedicationRequest?requestor.given={givenName}"
* code = #requestor.given
* base[0] = #MedicationRequest
* target = #MedicationRequest
* type = #string

Instance: MedicationRequest-requestor.family
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through MedicationRequest endpoint by the Practitioner's family name"
* name = "MedicationRequestRequestorFamilyNameSearchParameter"
* status = #active
* description = "Searches for MedicationRequest based on the Practitioner's family name eg) /ws/fhir2/{release}/MedicationRequest?requestor.family={familyName}"
* code = #requestor.family
* base[0] = #MedicationRequest
* target = #MedicationRequest
* type = #string

Instance: MedicationRequest-requestor.name
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through MedicationRequest endpoint by the Practitioner's full or partial name"
* name = "MedicationRequestRequestorNameSearchParameter"
* status = #active
* description = "Searches for MedicationRequest based on the Practitioner's full or partial name eg) /ws/fhir2/{release}/MedicationRequest?requestor.name={name}"
* code = #requestor.name
* base[0] = #MedicationRequest
* target = #MedicationRequest
* type = #string 

Instance: MedicationRequest-medication
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through MedicationRequest endpoint based on medication reference"
* name = "MedicationRequestmedicationSearchParameter"
* status = #active
* description = "Searches for MedicationRequest by medication reference eg) /ws/fhir2/{release}/MedicationRequest?medication={reference}"
* code = #medication
* base[0] = #MedicationRequest
* target = #MedicationRequest
* type = #reference

Instance: MedicationRequest-id
InstanceOf: SearchParameter
Usage: #definition
Title: "Search in MedicationRequest endpoint basing on MedicationRequest uuid  attribute"
* name = "MedicationRequestUuidSearchParameter"
* status = #active
* description = "Searches based on the MedicationRequest uuid field for the MedicationRequest record eg) /ws/fhir2/{release}}/MedicationRequest?_id={uuid}"
* code = #_id
* base[0] = #MedicationRequest
* target = #MedicationRequest 
* type = #token

Instance: MedicationRequest-lastUpdated
InstanceOf: SearchParameter
Usage: #definition
Title: "Search in MedicationRequest endpoint basing on MedicationRequest lastUpdated  attribute"
* name = "MedicationRequestLastUpdatedSearchParameter"
* status = #active
* description = "Searches based on the MedicationRequest lastUpdated field for the MedicationRequest record eg) /ws/fhir2/{release}/MedicationRequest?_lastUpdated={date-range}"
* code = #_lastUpdated
* base[0] = #MedicationRequest
* target = #MedicationRequest 
* type = #date