Profile: OMRSImmunization
Parent: Immunization
Id: omrs-immunization
Title: "OpenMRS Immunization"
Description: "A FHIR Immunization Resource as understood by OpenMRS"
* id 1..1
* identifier 0..0
* status 1..1
* status from ImmunizationStatusVs
* statusReason 0..0
* vaccineCode 1..1
* patient 1..1 
* patient only Reference(OMRSPatient)
* encounter 0..1
* encounter only Reference(OMRSEncounter)
* occurrence[x] 1..1
* occurrenceDateTime
* recorded 0..0
* primarySource 0..0
* reportOrigin 0..0
* location 0..1
* location only Reference(OMRSLocation)
* manufacturer 0..1
* manufacturer only Reference(Organization)
* lotNumber 0..1
* expirationDate  0..1
* site 0..0
* route 0..0
* doseQuantity 0..0
* performer 0..*
* performer.actor 1..1
* performer.function 0..0
* performer.actor only Reference(OMRSPractitioner)
* note 0..0
* reasonCode 0..0
* reasonReference 0..0
* isSubpotent 0..0
* education 0..0
* programEligibility 0..0
* fundingSource 0..0
* reaction 0..0
* protocolApplied 0..1 
* protocolApplied.doseNumber[x] 1..1
* protocolApplied.seriesDoses[x] 0..0

// Immunization status valueSet
Alias: $ISVS = https://fhir.openmrs.org/fhir/valueset-immunization-status

ValueSet: ImmunizationStatusVs
Id: valueset-immunization-status
Title: "Immunization Status ValueSet"
Description: "Immunization Value Set"
* $ISVS#completed "completed"
* $ISVS#entered-in-error "entered-in-error"
* $ISVS#not-done "not-done"


// Immunization Mapping 
Mapping: ImmunizationMapping 
Source: OMRSImmunization
Target: "http://hl7.org/fhir/3.0/StructureDefinition/Immunization"
Id: immunization-mapping
Title: "FHIR HL7 vs OMRS FHIR2"
Description: "Immunization is a FHIR resource that represents details about the patient's immunization,FHIR Immunizations are mapped to OpenMRS Immunization Objects"
* -> "OMRS Immunization" "Immunization profile maps to OMRS Immunization and HL7 Object"
* id  -> "obs.uuid"
* status -> "obs.status"
* vaccineCode -> "Coding.code"
* patient -> "obs.Person"
* encounter -> "obs.encounter"
* occurrenceDateTime -> "ValueDatetime"
* location -> "obs.location"
* manufacturer -> "obs.ValueText"
* lotNumber -> "obs.ValueText"
* expirationDate -> "obs.ValueDate"
* performer.actor -> "obs.Practitioner"
* protocolApplied.doseNumber[x] -> "obs.ValueNumeric"

//Immunization example 

Instance: OMRSImmunizationExample
InstanceOf: OMRSImmunization
Usage: #example
Title:  "OMRS Immunization Example"
Description: "Example OMRS Immunization Resource"
* id = "d48df5c7-605f-4f7b-88b3-f7235b474663"
* status = #completed
* vaccineCode.coding.code = #116958AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
* vaccineCode.coding.system = "https://cielterminology.org/"
* patient = Reference(example-openmrs-Patient)
* encounter = Reference(EncounterExample)
* occurrenceDateTime = "2022-12-30"
* location = Reference(LocationExample)
* expirationDate = "2025-05-07"
* lotNumber = "AAJN11K"
* performer.actor = Reference(PractitionerExample)


