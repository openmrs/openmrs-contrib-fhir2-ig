Profile: OMRSPerson
Parent: Person
Id: omrs-person
Title: "OpenMRS Person"
Description: "A FHIR Person as understood by OpenMRS"
* identifier 0..*
* name 1..* MS
* telecom 0..* MS
* gender 1..1 MS
* birthDate 1..1 MS
* address 0..* MS
* active 1..1 MS
* active = true
