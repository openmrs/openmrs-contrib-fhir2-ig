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
Target: "Practitioner"
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
Title: "OpenMRS Practitioner Example"
Description: "Practitioner Resource Example"
* id = "7a9e2727-11ee-47ae-8af5-1dcf5337f7c2"
//* identifier[0].system = #OpenMRS
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

/** Practitioner Resource search Parameters*/

Instance: Practitioner.name
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through Practitioner endpoint by the Practitioner's full or partial name"
* name = "PractitionerNameSearchParameter"
* status = #active
* description = "Searches for Practitioner based on the Practitioner's full or partial name eg) /ws/fhir2/{release}/Practitioner?name={name}"
* code = #practitioner.name
* base[0] = #Practitioner
* target = #Practitioner
* type = #string 

Instance: Practitioner.given
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through Practitioner endpoint by the Practitioner's given name"
* name = "PractitionerGivenNameSearchParameter"
* status = #active
* description = "Searches for Practitioner based on the Practitioner's given name(s) eg) /ws/fhir2/{release}/Practitioner?given={givenName}"
* code = #practitioner.given
* base[0] = #Practitioner
* target = #Practitioner
* type = #string

Instance: Practitioner.family
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through Practitioner endpoint by the Practitioner's family name"
* name = "PractitionerFamilyNameSearchParameter"
* status = #active
* description = "Searches for Practitioner based on the Practitioner's family name eg) /ws/fhir2/{release}/Practitioner?family={familyName}"
* code = #practitioner.family
* base[0] = #Practitioner
* target = #Practitioner
* type = #string

Instance: Practitioner-identifier
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through Practitioner endpoint by a given Practitioner"
* name = "PractitionerIdentifierSearchParameter"
* status = #active
* description = "Searches for Practitioner by a given Practitioner eg) /ws/fhir2/{release}/Practitioner?identifier={identifier}"
* code = #practitioner.identifier
* base[0] = #Practitioner
* target = #Practitioner
* type = #token

Instance: Practitioner-address-city
InstanceOf: SearchParameter
Usage: #definition
Title: "Search in Practitioner endpoint basing on Practitioner's address-city attribute"
* name = "PractitionerCitySearchParameter"
* status = #active
* description = "Searches based on the address-city field for the Practitioner record eg) /ws/fhir2/{release}/Practitioner?address-city={city}"
* code = #address-city
* base[0] = #Practitioner
* target = #Practitioner
* type = #string

Instance: Practitioner-address-country
InstanceOf: SearchParameter
Usage: #definition
Title: "Search in Practitioner endpoint basing on Practitioner's address-country attribute"
* name = "PractitionerCountrySearchParameter"
* status = #active
* description = "Searches based on the address-country field for the Practitioner record eg) /ws/fhir2/{release}/Practitioner?address-country={country}"
* code = #address-country
* base[0] = #Practitioner
* target = #Practitioner
* type = #string

Instance: Practitioner-address-postalcode
InstanceOf: SearchParameter
Usage: #definition
Title: "Search in Practitioner endpoint basing on Practitioner's address-postalcode attribute"
* name = "PractitionerPostalCodeSearchParameter"
* status = #active
* description = "Searches based on the address-postalcode field for the Practitioner record eg) /ws/fhir2/{release}/Practitioner?address-postalcode={postalCode}"
* code = #address-postalcode
* base[0] = #Practitioner
* target = #Practitioner
* type = #string

Instance: Practitioner-address-state
InstanceOf: SearchParameter
Usage: #definition
Title: "Search in Practitioner endpoint basing on Practitioner's address-state attribute"
* name = "PractitionerStateSearchParameter"
* status = #active
* description = "Searches based on the address-state field for the Practitioner record eg) /ws/fhir2/{release}/Practitioner?address-state={state}"
* code = #address-state
* base[0] = #Practitioner
* target = #Practitioner
* type = #string

Instance: Practitioner-id
InstanceOf: SearchParameter
Usage: #definition
Title: "Search in Practitioner endpoint basing on Practitioner uuid attribute"
* name = "PractitionerUuidSearchParameter"
* status = #active
* description = "Searches based on the Practitioner uuid field for the Practitioner record eg) /ws/fhir2/{release}}/Practitioner?_id={uuid}"
* code = #_id
* base[0] = #Practitioner
* target = #Practitioner 
* type = #token

Instance: Practitioner-lastUpdated
InstanceOf: SearchParameter
Usage: #definition
Title: "Search in Practitioner endpoint basing on Practitioner lastUpdated  attribute"
* name = "PractitionerLastUpdatedSearchParameter"
* status = #active
* description = "Searches based on the Practitioner lastUpdated field for the Practitioner record eg) /ws/fhir2/{release}/Practitioner?_lastUpdated={date-range}"
* code = #_lastUpdated
* base[0] = #Practitioner
* target = #Practitioner 
* type = #date