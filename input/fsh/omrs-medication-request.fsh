Alias: MedicPriorityVs = http://fhir.openmrs.org/fhir/request-priority
Alias: $systemUrl = http://fhir.openmrs.org
Alias: MedicIntentVs = http://fhir.openmrs.org/fhir/CodeSystem/medicationrequest-intent

/** medication request resource profile*/

Profile: OMRSMedicationRequest
Parent: MedicationRequest
Id: omrs-medication-request
Title: "OpenMRS Medication Request"
Description: "A FHIR MedicationRequest as understood by OpenMRS"
* identifier 1..*
* status 1..1
* intent 1..1
* intent from MedicationRequestIntentVs
* category 0..0
* priority 1..1
* priority from MedicationRequestPriorityVs
* doNotPerform 0..0
* reported[x] 0..0
* medication[x] 1..1
* medicationCodeableConcept 1..1
* subject 1..1 
* subject only Reference(OMRSPatient)
* encounter 1..1
* encounter only Reference(OMRSEncounter)
* supportingInformation 0..0
* authoredOn 0..1
* requester 1..1
* requester only Reference(OMRSPractitioner)
* performer 0..0
* performerType 0..0
* recorder 0..0
* reasonCode 0..*
* reasonReference 0..0
* instantiatesCanonical 0..0
* instantiatesUri 0..0
* basedOn 0..*
* basedOn only Reference(OMRSMedicationRequest)
* groupIdentifier 0..0
* courseOfTherapyType 0..0
* insurance 0..0
* note 0..1
* dosageInstruction 0..*
* dispenseRequest 0..1
* dispenseRequest.initialFill 0..0
* dispenseRequest.dispenseInterval 0..0
* dispenseRequest.validityPeriod 0..0
* dispenseRequest.numberOfRepeatsAllowed 1..1
* dispenseRequest.quantity 1..1
* dispenseRequest.expectedSupplyDuration 0..0
* dispenseRequest.performer 0..0
* substitution 0..0
* priorPrescription 0..1
* priorPrescription only Reference(OMRSMedicationRequest)
* detectedIssue 0..0
* eventHistory 0..0

/** Medication request Intent value set*/

ValueSet: MedicationRequestIntentVs
Id: medication-request-intent-vs
Title: "Medication Request Intent Vs"
Description: "Medication Request Intent ValueSet"
* MedicIntentVs#proposal "Proposal"
* MedicIntentVs#plan "Plan"
* MedicIntentVs#order "Order"
* MedicIntentVs#original-order "Original Order"
* MedicIntentVs#reflex-order "Reflex Order"
* MedicIntentVs#filler-order "Filler Order"
* MedicIntentVs#instance-order "Instance Order"
* MedicIntentVs#option "Option"



ValueSet: MedicationRequestPriorityVs
Id: medication-request-priority-vs
Title: "Medication Request Priority ValueSet"
Description: "Openmrs Medication Request Priority ValueSet"
* MedicPriorityVs#routine "Routine"
* MedicPriorityVs#urgent "Urgent"
* MedicPriorityVs#asap "ASAP"
* MedicPriorityVs#stat "STAT"


/** MedicationRequest OMRS VS FHIR Mapping*/

Mapping: MedicationRequestMapping   
Source: OMRSMedicationRequest
Target: "http://hl7.org/fhir/3.0/StructureDefinition/MedicationRequest"
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
Title: "OMRS Medication Request Example"
Description: "Example of the OMRS medication Request Resource"
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

