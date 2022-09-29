Profile:      OMRSCondition
Parent:       Condition
Id:           omrs-Condition
Title:        "OpenMRS condition"
Description:  "A FHIR Condition as understood by OpenMRS"
* id 1..1 
* code 0..1
* subject 1..1
* subject only Reference(OMRSPatient)
* onsetDateTime 0..1
* recorder 0..1 
* recordedDate 0..1
* clinicalStatus 0..0
* verificationStatus 0..0

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
* id -> "condition.id"
* code -> "condition.code"
* subject -> "condition.patient"
* onsetDateTime -> "condition.onsetDate"
* recorder -> "condition.creator"
* recordedDate -> "condition.dateCreated"

