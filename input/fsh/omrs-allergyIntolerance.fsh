Profile:  OpenMRSAllergyIntolerance
Parent:   AllergyIntolerance
Id:       omrs-AllergyIntolerance
Title:    "OpenMRS AllergyIntolerance"
Description: "A FHIR Allergy as understood by OpenMRS"
* identifier 0..1
* code 0..1
* reaction 0..1
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
Title: "Allergy Intolerance Resource Example"
Description: "Example OMRS Allergy Intolerance"
* id = "5b829d01-34bb-47d1-b1bb-9303c3a9ebcb"
* patient.reference = "Patient/da7f524f-27ce-4bb2-86d6-6d1d05312bd5"
* patient.type = "Patient"
* recorder.reference = "Practitioner/c98a1558-e131-11de-babe-001e378eb67e"
* recorder.type = "Practitioner"
* recorder.display = "Super User"
* reaction.substance.coding.code = #162298
* reaction.substance.coding.system = "https://openconceptlab.org/orgs/CIEL/sources/CIEL"
* reaction.manifestation.coding.code = #22748-8
* clinicalStatus.coding.system = "http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical"
* clinicalStatus.coding.code =  #active
* clinicalStatus.coding.display = #active
* identifier.id = "dce9740a-1691-11df-97a5-7038c432aabf"
* identifier.use = #usual
* identifier.system = #OpenMRS
* identifier.value = #35tu-9

/** Allergy intolerance omrs fhir mapping*/

Mapping: AllergyIntoleranceMapping
Source: OpenMRSAllergyIntolerance
Target: "http://hl7.org/fhir/3.0/StructureDefinition/Allergyintolerance"
Id: allergyintolerance-mapping
Title: "FHIR HL7 vs OMRS FHIR2"
Description: "Allergy or Intolerance; a propensity, or a potential risk to an individual, to have an adverse reaction on future exposure to the specified substance, or class of substance."
* -> "OMRS Allergy intolerance" "This profile maps to allergy intolerance in OMRS FHIR2"
* asserter -> "allergy.source"
* onset[x] -> "allergy.init"
* category -> "allergy.class"
* identifier -> "allery.identifier"
* code -> "allergy.Code"
* note -> "allergy.note"
* recorder -> "allergy.author"
* recordedDate -> "allergy.recorded"
* criticality -> "allergy.grade"
* verificationStatus -> "allergy.status"
* clinicalStatus -> "allergy.status"
* type -> "allergy.class"
