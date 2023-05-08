Profile: OMRSMedicationDispense
Parent: MedicationDispense
Id: omrsmedication-dispense
Title: "OMRS Medication Dispense"
Description: "Indicates that a medication product is to be or has been dispensed for a named person/patient. This includes a description of the medication product (supply) provided and the instructions for administering the medication. The medication dispense is the result of a pharmacy system responding to a medication order."
* identifier 0..0
* partOf 0..0
* status 1..1
* statusReasonCodeableConcept 0..1
* category 0..0 
* medication[x] 1..1
* medication[x].medicationCodeableConcept
* medication[x].medicationReference 
* subject 0..1
* context 0..1
* context only Reference(OMRSEncounter)
* supportingInformation 0..0
* performer.actor 1..1
* performer.actor only Reference(OMRSPractitioner)
* location 0..1 
* location only Reference(OMRSLocation)
* authorizingPrescription 0..* 
* authorizingPrescription only Reference(OMRSMedicationRequest)
* type 0..1
* quantity 0..1
* daysSupply 0..0
* whenPrepared 0..1
* whenHandedOver 0..1
* destination 0..0
* receiver 0..0
* note 0..0
* dosageInstruction 0..* 
* substitution 0..1
* substitution.wasSubstituted 1..1
* substitution.type 0..1
* substitution.reason 0..1
* substitution.responsibleParty 0..0
* detectedIssue 0..0
* eventHistory 0..0 

//Medication Dispense Mapping 

Mapping: MedicationDispenseMapping
Source: OMRSMedicationDispense
Target: "MedicationDispense"
Id: medication-dispense-mapping
Title: "FHIR HL7 vs OMRS FHIR2"
Description: "MedicationDispense is a FHIR resource that represents a description of the medication product (supply) provided and the instructions for administering the medication and these are mapped to OpenMRS MedicationDispense objects between HL7 FHIR"
* id -> "MedicationDispense.uuid"
* status -> "MedicationDispense.status"
* statusReasonCodeableConcept -> "Concept.code"
* location -> "MedicationDispense.location"
* type -> "Concept.code"
* subject -> "MedicationDispense.subject"
* authorizingPrescription -> "MedicationDispense.DrugOrder"
* context -> "MedicationDispense.encounter"
* whenPrepared -> "MedicationDispense.DatePrepared"
* whenHandedOver -> "MedicationDispense.DateHandedOver"
* medication[x] -> "MedicationDispense.Medication"
* dosageInstruction -> "MedicationDispense.DosageInstruction"
* quantity -> "MedicationDispense.Quantity"
* performer.actor -> "MedicationDispense.Practitioner"
* substitution.wasSubstituted -> "MedicationDispense.WasSubstituted"
* substitution.type -> "Concept.code"
* substitution.reason -> "Concept.code"

//Medication Dispense resource Example

Instance: MedicationDispenseExample
InstanceOf: OMRSMedicationDispense 
Usage: #example
Title: "OpenMRS Medication Dispense Example"
Description: "Example OpenMRS Medication Dispense resource"
* id = "1e2edf7a-89f2-4694-8412-49c99770aed6"
* status = #completed
* medicationReference = Reference(MedicationExample)
* subject = Reference(example-openmrs-Patient)
* performer.actor = Reference(PractitionerExample)
* authorizingPrescription = Reference(OMRSMedicationRequestExample)
* type.coding[0].code = #RFP
* type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-ActCode"
* type.coding[0].display = "Refill - Part Fill"
* quantity.value = 50
* quantity.system = "http://terminology.hl7.org/CodeSystem/v3-orderableDrugForm"
* quantity.code = #TAB
* whenPrepared = "2022-12-31"
* whenHandedOver = "2022-12-31"
* dosageInstruction.sequence = 1
* dosageInstruction.text = "Take 3 tablets (6mg) once daily"
* dosageInstruction.timing[+].repeat[0].frequency = 1 
* dosageInstruction.timing[=].repeat[0].period = 1
* dosageInstruction.timing[=].repeat[0].periodUnit = #d
* location = Reference(LocationExample)
* context = Reference(EncounterExample)
