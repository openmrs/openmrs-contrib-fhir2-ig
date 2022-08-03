Profile: OMRSPractitioner
Parent: Practitioner
Id: omrs-practitioner
Title: "Openmrs Practitioner"
Description: "A FHIR Practitioner as understood by OpenMRS"
* identifier 1..1 
* id 1..1 
* active 1..1 
* name 1..* 
* birthDate 1..1 
* gender 1..1 
* address 1..* 
* telecom 0..1 
* meta.lastUpdated 0..1 

/** OMRS Practitioner mapping */
Mapping: PractitionerMapping
Source: OMRSPractitioner
Target: "http://hl7.org/fhir/3.0/StructureDefinition/Practitioner"
Id: practitioner-mapping
Title: "FHIR HL7 vs OMRS FHIR2"
Description: "Practitioner resource represents a person who is directly or indirectly involved in the provisioning of healthcare. Practitioner covers all individuals who are engaged in the healthcare process and healthcare-related services as part of their formal responsibilities."
* -> "OMRS Practitioner" "This profile maps to Practitioner in OMRS FHIR2"
* id -> "uuid"
* identifier -> "identifier"
* active -> "retired"
* telecom -> "providerAttribute"
* address -> "Person.address"
* name -> "Person.name"
* gender -> "Person.gender"
* birthDate -> "Person.birthDate"

/** Practitioner Example */

Instance: PractitionerExample
InstanceOf: OMRSPractitioner
Usage: #example
Title: "Practitioner Example"
Description: "Practitioner Resource Example"
* id = "7a9e2727-11ee-47ae-8af5-1dcf5337f7c2"
* identifier[0].system = #OpenMRS
* identifier[0].value = "1001"
* active = true
* name[+].family = "Careful"
* name[=].given = "Adam"
* name[=].suffix = "Dr"
* gender = #male
* address[+].use = #home
* address[=].city = "PleasantVille"
* address[=].line =  "534 Erewhon St"
* address[=].state = "Vic"
* telecom[+].system = #phone
* telecom[=].value = "(545-243-545-1)"
* birthDate = "1974-12-25"