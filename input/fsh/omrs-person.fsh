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
* name -> "Person.name"
* telecom -> "Person.personAttribute" "The attribute used is determined by the fhir2.personContactPointAttributeTypeUuid global property"
* gender -> "Person.gender"
* birthDate -> "Person.birthDate" "Estimated birthdates report month and year for people 5 and under or only year for people older than 5"
* address -> "Person.address"
* link -> "Person is a Patient? link to Patient : nothing"

/** Person resource search parameters*/

Instance: person-name
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through person endpoint by the person's full or partial name"
* name = "personNameSearchParameter"
* status = #active
* description = "Searches for Person based on full or partial name"
* code = #name
* base[0] = #Person
* target = #OMRSPerson
* derivedFrom = "https://dev3.openmrs.org/openmrs/ws/fhir2/R4/Person?name=Walker"
* type = #string

Instance: person-gender
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through person endpoint by the person's gender attribute"
* name = "personGenderSearchParameter"
* status = #active
* description = "Searches based on the gender of the person. Note that this value must be from the AdministrativeGender valueset"
* code = #gender
* base[0] = #Person
* target = #OMRSPerson
* derivedFrom = "https://dev3.openmrs.org/openmrs/ws/fhir2/R4/Person?gender=male"
* type = #token

Instance: person-birthdate
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through person endpoint by the person's birthdate attribute"
* name = "personBirthdateSearchParameter"
* status = #active
* description = "Searches based on the person's birthdate"
* code = #birthdate
* base[0] = #Person
* target = #OMRSPerson
* derivedFrom = "https://dev3.openmrs.org/openmrs/ws/fhir2/R4/Person?birthdate=1943-02-05"
* type = #date

Instance: person-address-city
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through person endpoint by the person's location city"
* name = "personCitySearchParameter"
* status = #active
* description = "Searches based on the person's recorded city/village of address"
* code = #address-city
* base[0] = #Person
* target = #OMRSPerson
* derivedFrom = "https://demo.openmrs.org/openmrs/ws/fhir2/R4/Person?address-city=City6754"
* type = #string

Instance: person-address-state
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through person endpoint by the person's location state"
* name = "personStateSearchParameter"
* status = #active
* description = "Searches based on the person's recorded state/province of address"
* code = #address-state
* base[0] = #Person
* target = #OMRSPerson
* derivedFrom = "https://demo.openmrs.org/openmrs/ws/fhir2/R4/Person?address-state=State7001"
* type = #string

Instance: person-address-postalcode
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through person endpoint by the person's location postal code"
* name = "personPostalCodeSearchParameter"
* status = #active
* description = "Searches based on the person's recorded postal code of address"
* code = #address-postalcode
* base[0] = #Person
* target = #OMRSPerson
* derivedFrom = "https://demo.openmrs.org/openmrs/ws/fhir2/R4/Person?address-postalcode=47002"
* type = #string

Instance: person-address-country
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through person endpoint by the person's location country"
* name = "personCountrySearchParameter"
* status = #active
* description = "Searches based on the person's recorded country of address"
* code = #address-country
* base[0] = #Person
* target = #OMRSPerson
* derivedFrom = "https://demo.openmrs.org/openmrs/ws/fhir2/R4/Person?address-country=Country3018"
* type = #string

Instance: person-id
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through person endpoint by the person's uuid"
* name = "personIdSearchParameter"
* status = #active
* description = "Searches based on the exact UUID of the person record"
* code = #_id
* base[0] = #Person
* target = #OMRSPerson
* derivedFrom = "https://demo.openmrs.org/openmrs/ws/fhir2/R4/Person?_id=9bed23d0-0502-11e3-8ffd-0800200c9a66"
* type = #token

Instance: person-lastUpdated
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through person endpoint basing on dateCreated or dateUpdated field of the person record"
* name = "personLastUpdatedSearchParameter"
* status = #active
* description = "Searches based on the the dateCreated or dateUpdated field for the person record"
* code = #_lastUpdated
* base[0] = #Person
* target = #OMRSPerson
* derivedFrom = "https://demo.openmrs.org/openmrs/ws/fhir2/R4/Person?_lastUpdated=2017-08-01"
* type = #date