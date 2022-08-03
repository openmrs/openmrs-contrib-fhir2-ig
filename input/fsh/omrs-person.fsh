Profile: OMRSPerson
Parent: Person
Id: omrs-person
Title: "OpenMRS Person"
Description: "A FHIR Person as understood by OpenMRS"
* identifier 0..*
* name 1..* 
* telecom 0..* 
* gender 1..1 
* birthDate 1..1 
* address 0..* 
* active 1..1 
* active = true
* photo 0..0
* managingOrganization 0..0
* link 0..0