Profile: OMRSRelatedPerson
Parent: RelatedPerson
Id: omrs-related-person
Title: "OpenMRS Related Person"
Description: "A FHIR RelatedPerson as understood by OpenMRS Relationship"
* id 1..1
* patient 1..1
* identifier 0..*
* address 0..*
* name 0..*
* gender 0..1
* birthDate 0..1
* active 0..1
* period 0..1

//OpenMRS RelatedPerson Example

Instance: RelatedPersonExample
InstanceOf: OMRSRelatedPerson
Title: "Example of RelatedPerson"
Description: "An example instance of the OpenMRS RelatedPerson resource."
* patient = Reference(example-openmrs-Patient)
* identifier.system = "http://openmrs.org/fhir/RelatedPerson"
* identifier.value = "Person/1000Y"
* name.id = "915c9146-8bdb-4fad-bc51-4af10d041c86"
* name.family = "John"
* name.given[0] = "Smith"
* gender = #male
* birthDate = "2001-09-08"
* active = true
* period.start = "2020-01-01"
* period.end = "2024-01-01"

Mapping: RelatedPersonMapping
Source: OMRSRelatedPerson
Target: "Relationship"
Id: relatedPerson-mapping
Title: "FHIR HL7 vs OMRS"
Description: "This mapping defines how a FHIR RelatedPerson resource corresponds to an OpenMRS Relationship. In OpenMRS, a Relationship connects two Person objects, while in FHIR, a RelatedPerson represents a person with a connection to a patient."
* -> "OMRS Relationship" "This profile maps to RelatedPerson in OMRS FHIR2"
* id -> "Relationship.uuid"
* identifier.system -> "RelatedPerson"
* identifier.value -> "Person/{personA.uuid}"
* name.family -> "Relationship.personA.names.family"
* name.given -> "Relationship.personA.names.given"
* gender -> "Relationship.personA.gender"
* birthDate -> "Relationship.personA.birthdate"
* address -> "Relationship.personA.addresses"
* patient -> "Relationship.personB"
* period.start -> "Relationship.startDate"
* period.end -> "Relationship.endDate"

// Search parameters for OMRSRelatedPerson

Instance: relatedperson-active
InstanceOf: SearchParameter
Usage: #definition
Title: "Search by RelatedPerson Active Status"
* name = "RelatedPersonActiveSearchParameter"
* status = #active
* description = "Indicates if the related person record is active"
* code = #active
* base[0] = #RelatedPerson
* type = #token
* target = #RelatedPerson

Instance: relatedperson-name
InstanceOf: SearchParameter
Usage: #definition
Title: "Search by RelatedPerson Name"
* name = "RelatedPersonNameSearchParameter"
* status = #active
* description = "Searches for RelatedPerson based on name"
* code = #name
* base[0] = #RelatedPerson
* type = #string
* target = #RelatedPerson

Instance: relatedperson-family
InstanceOf: SearchParameter
Usage: #definition
Title: "Search by RelatedPerson Family Name"
* name = "RelatedPersonFamilySearchParameter"
* status = #active
* description = "A portion of the family name of the related person"
* code = #family
* base[0] = #RelatedPerson
* type = #string
* target = #RelatedPerson

Instance: relatedperson-given
InstanceOf: SearchParameter
Usage: #definition
Title: "Search by RelatedPerson Given Name"
* name = "RelatedPersonGivenSearchParameter"
* status = #active
* description = "A portion of the given name of the related person"
* code = #given
* base[0] = #RelatedPerson
* type = #string
* target = #RelatedPerson

Instance: relatedperson-gender
InstanceOf: SearchParameter
Usage: #definition
Title: "Search by RelatedPerson Gender"
* name = "RelatedPersonGenderSearchParameter"
* status = #active
* description = "Searches for RelatedPerson based on gender"
* code = #gender
* base[0] = #RelatedPerson
* type = #token
* target = #RelatedPerson

Instance: relatedperson-birthdate
InstanceOf: SearchParameter
Usage: #definition
Title: "Search by RelatedPerson Birthdate"
* name = "RelatedPersonBirthdateSearchParameter"
* status = #active
* description = "Searches for RelatedPerson based on birthdate"
* code = #birthdate
* base[0] = #RelatedPerson
* type = #date
* target = #RelatedPerson

Instance: relatedperson-address
InstanceOf: SearchParameter
Usage: #definition
Title: "Search by RelatedPerson Address"
* name = "RelatedPersonAddressSearchParameter"
* status = #active
* description = "A server defined search that may match any of the string fields in the Address, including line, city, district, state, country, postalCode, and/or text"
* code = #address
* base[0] = #RelatedPerson
* type = #string
* target = #RelatedPerson

Instance: relatedperson-address-city
InstanceOf: SearchParameter
Usage: #definition
Title: "Search by RelatedPerson Address City"
* name = "RelatedPersonCitySearchParameter"
* status = #active
* description = "Searches for RelatedPerson based on city of address"
* code = #address-city
* base[0] = #RelatedPerson
* type = #string
* target = #RelatedPerson

Instance: relatedperson-address-state
InstanceOf: SearchParameter
Usage: #definition
Title: "Search by RelatedPerson Address State"
* name = "RelatedPersonStateSearchParameter"
* status = #active
* description = "Searches for RelatedPerson based on state of address"
* code = #address-state
* base[0] = #RelatedPerson
* type = #string
* target = #RelatedPerson

Instance: relatedperson-address-postalcode
InstanceOf: SearchParameter
Usage: #definition
Title: "Search by RelatedPerson Address Postal Code"
* name = "RelatedPersonPostalCodeSearchParameter"
* status = #active
* description = "Searches for RelatedPerson based on postal code of address"
* code = #address-postalcode
* base[0] = #RelatedPerson
* type = #string
* target = #RelatedPerson

Instance: relatedperson-address-country
InstanceOf: SearchParameter
Usage: #definition
Title: "Search by RelatedPerson Address Country"
* name = "RelatedPersonCountrySearchParameter"
* status = #active
* description = "Searches for RelatedPerson based on country of address"
* code = #address-country
* base[0] = #RelatedPerson
* type = #string
* target = #RelatedPerson

Instance: relatedperson-identifier
InstanceOf: SearchParameter
Usage: #definition
Title: "Search by RelatedPerson Identifier"
* name = "RelatedPersonIdentifierSearchParameter"
* status = #active
* description = "An Identifier of the RelatedPerson"
* code = #identifier
* base[0] = #RelatedPerson
* type = #token
* target = #RelatedPerson

Instance: relatedperson-patient
InstanceOf: SearchParameter
Usage: #definition
Title: "Search by RelatedPerson Patient Reference"
* name = "RelatedPersonPatientSearchParameter"
* status = #active
* description = "The patient this related person is related to"
* code = #patient
* base[0] = #RelatedPerson
* type = #reference
* target = #RelatedPerson