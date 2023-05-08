Profile: OMRSMedication
Parent: Medication
Id: omrs-medication
Title: "OMRS Medication"
Description: "A FHIR Medication Resource as understood by OpenMRS"
* id 1..1
* code 0..1 
* status 0..1
* manufacturer 0..0
* form 0..1
* amount 0..0
* ingredient 0..1 
* ingredient.item[x] 1..1
* batch 0..0

// Medication mapping 

Mapping: OMRSMedicationMapping
Source: OMRSMedication
Target: "Medication"
Id: medication-mapping
Title: "FHIR HL7 vs OMRS FHIR2"
Description: "This resource is primarily used for the identification and definition of a medication for the purposes of prescribing, dispensing, and administering a medication as well as for making statements about medication use."
* -> "OMRS Medication" "This profile maps to Medication in OMRS FHIR2"
* id -> "Drug.uuid"
* code -> "Concept.code"
* status -> "Medication.MedicationStatus"
* form -> "Concept.code"
* ingredient -> "Concept.code"

// medication resource example 

Instance: MedicationExample
InstanceOf: OMRSMedication
Usage: #example
Title: "OpenMRS Medication Example"
Description: "Example OpenMRS Medication resource"
* id = "f49e4247-528a-4cfd-8856-de161d03fa76"
* status = #active
* code.coding[0].code = #86082
* code.coding[0].system = "https://cielterminology.org"
* code.coding[0].display = "Vancomycin"
* form.coding[+].code = #385219001
* form.coding[=].system = "http://snomed.info/sct"
* form.coding[=].display = "Solution for injection"
* ingredient.itemCodeableConcept[0].coding.code = #66955
* ingredient.itemCodeableConcept[0].coding.system = "http://www.nlm.nih.gov/research/umls/rxnorm"
* ingredient.itemCodeableConcept[0].coding.display = "Vancomycin Hydrochloride"
