Profile: OMRSEncounter
Parent: Encounter
Id: omrs-encounter
Title: "Openmrs Encounter"
Description: "A FHIR Encounter as understood by OpenMRS"
* id 1..1 
* meta 1..1 
* meta.tag 0..* 
* meta.tag.code 0..1 
* meta.tag.system 0..1 
* status 1..1 
* class 1..1 
* class.code
* class.system 
* type 1..*
* subject 1..1
* subject only Reference(OMRSPatient)
* period.start 1..1
* location.location 1..1
* location.location only Reference(OMRSLocation)


/** OMRS Encounter Resource Example **/


