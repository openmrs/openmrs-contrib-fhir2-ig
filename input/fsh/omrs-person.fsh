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
* photo 0..0
* managingOrganization 0..0
* link 0..0

//OpenMRS Person Example

Instance: example-openmrs-person
InstanceOf: OMRSPerson 
Usage: #example
Title: "Openmrs Person"
Description: "Example OMRS Person Resource"
* identifier.id = "53fbd0ef-ae10-46a0-9d0a-387917a66d6e"
* identifier.use = #official
* identifier.type.text = "OpenMRS ID"
* identifier.value = "1000Y"
* name.id = "915c9146-8bdb-4fad-bc51-4af10d041c86"
* name.family = "John"
* name.given = "Smith"
* gender = #male
* birthDate = "2001-09-08"
* address.extension.url = "http://fhir.openmrs.org/ext/address"
* address.use = #home
* address.country = "Uganda"
* address.city = "Ntungamo"
* address.district = "Ntungamo"
* active = true