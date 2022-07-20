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

/** mapping FHIR HL7 vs OMRS*/

Mapping: PersonMapping
Source: OMRSPerson
Target: "http://hl7.org/fhir/3.0/StructureDefinition/Person"
Id: person-mapping
Title: "FHIR HL7 vs OMRS "
Description: "Person is a FHIR resource that is used to represent demographics and administrative information about a person independent of a specific health-related context. FHIR Persons are mapped to OpenMRS Person objects."
* -> "OMRS Person" "This profile maps to Person in OMRS FHIR2"
* identifier -> "Patient.identifier"
* id -> "Person.uuid"
* telecom -> "Person.personAttribute" "The attribute used is determined by the fhir2.personContactPointAttributeTypeUuid global property"
* gender -> "Person.gender"
* birthDate -> "Person.birthDate" "Estimated birthdates report month and year for people 5 and under or only year for people older than 5"
* address -> "Person.address"
* link -> "Person.link"


