/** Location Resource profile*/

Profile:      OMRSLocation
Parent:       Location
Id:           omrs-location
Title:        "OpenMRS Location"
Description:  "An OpenMRS location"
* status 0..1 
* status from LocationStatusVS
* name 1..1 
* description 1..1
* type 0..*
* position 0..1 
* position.longitude 1..1
* position.latitude 1..1 
* telecom 0..*
* telecom only OMRSLocationContactPoint 
* address only OMRSAddress
* partOf 0..1
* alias 0..0
* mode 0..0
* operationalStatus 0..0
* hoursOfOperation 0..0
* managingOrganization 0..0
* availabilityExceptions 0..0
* endpoint 0..0
* physicalType 0..0
* managingOrganization 0..0

/** Contact point profile */

Profile:      OMRSLocationContactPoint
Parent:       ContactPoint
Id:           omrs-location-contact-point
Title:        "OpenMRS Location Contact Point"
Description:  "An OpenMRS Location Phone Number"
* system 1..1
* value 1..1 

/** Address element profile */

Profile: OMRSAddress
Parent: Address
Id: omrs-address
Title: "OMRS Address"
Description: "Address profile specifies the geological location details"
* use 0..1 
* line 0..*
* city 0..1 
* district 0..1 
* state 0..1 
* postalCode 0..1 
* country 0..1 

Alias: $SCT = https://fhir.openmrs.org/location-status

/** location status value set  **/
ValueSet: LocationStatusVS
Id: location-status-vs
Title: "Location Status ValueSet"
Description: "Indicates whether the location is still in use."
* $SCT#active "Active" 
* $SCT#inactive "Inactive" 
* $SCT#suspended "Suspended"

/** Location Resource Mapping */

Mapping: LocationMapping
Source: OMRSLocation
Target: "http://hl7.org/fhir/3.0/StructureDefinition/Location"
Id: location-Mapping
Title: "FHIR HL7 vs OMRS FHIR2"
Description: "Location is a FHIR resource that represents details and position information for a physical place where services are provided and resources and participants may be stored, found, contained, or accommodated. In the current implementation, FHIR Locations are mapped to OpenMRS Location objects."
* -> "OMRS Location" "This profile maps to Location in OMRS FHIR2"
* id -> "Location.uuid"
* name -> "name"
* description -> "description"
* address.line -> "address1"
* address.city -> "cityVillage"
* address.state -> "stateProvince"
* address.country -> "country"
* address.postalCode -> "postalCode"
* address.district -> "countyDistrict"
* position.latitude -> "latitude"
* position.longitude -> "longintude"
* status -> "retired"
* partOf -> "parentLocation"
* meta.tag -> "tags"

/** Location Example*/

Instance: LocationExample
InstanceOf: OMRSLocation
Usage: #example
Title: "Location Example"
Description: "Example OMRS location"
* status = #active
* name = "Outpatient Clinic"
* description = "Outpatient Clinic"
* type.coding[0].code = #Sleep
* type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
* type.coding[0].display = "Sleep disorders unit"
* telecom[+].system = #phone
* telecom[=].value = "(+1) 734-677-7777"
* telecom[+].system = #fax
* telecom[=].value = "(+1) 734-677-6622"
* telecom[+].system = #email
* telecom[=].value =  "hq@HL7.org"
* address.use = #home
* address.line[0].value = "3300 Washtenaw Avenue, Suite 227"
* address[0].city = "Ann Arbor"
* address[0].district = "Mukono"
* address[0].state = "MI"
* address[0].postalCode = "48104"
* address[0].country = "USA"
* position[0].latitude = 42.256500
* position[0].longitude = -83.694710

/** location search parameters*/

Instance: location-name
InstanceOf: SearchParameter
Usage: #definition
Title: "Search in Location endpoint basing on location name attribute"
* name = "LocationNameSearchParameter"
* status = #active
* description = "Searches based on the name field for the location record eg) /ws/fhir2/{release}/Location?name={name}"
* code = #name
* base[0] = #Location
* target = #OMRSLocation
* type = #string

Instance: location-address-city
InstanceOf: SearchParameter
Usage: #definition
Title: "Search in Location endpoint basing on location address-city attribute"
* name = "LocationCitySearchParameter"
* status = #active
* description = "Searches based on the address-city field for the location record eg) /ws/fhir2/{release}/Location?address-city={city}"
* code = #address-city
* base[0] = #Location
* target = #OMRSLocation
* type = #string

Instance: location-address-country
InstanceOf: SearchParameter
Usage: #definition
Title: "Search in Location endpoint basing on location address-country attribute"
* name = "LocationCountrySearchParameter"
* status = #active
* description = "Searches based on the address-country field for the location record eg) /ws/fhir2/{release}/Location?address-country={country}"
* code = #address-country
* base[0] = #Location
* target = #OMRSLocation
* type = #string

Instance: location-address-postalcode
InstanceOf: SearchParameter
Usage: #definition
Title: "Search in Location endpoint basing on location address-postalcode attribute"
* name = "LocationPostalCodeSearchParameter"
* status = #active
* description = "Searches based on the address-postalcode field for the location record eg) /ws/fhir2/{release}/Location?address-postalcode={postalCode}"
* code = #address-postalcode
* base[0] = #Location
* target = #OMRSLocation
* type = #string

Instance: location-address-state
InstanceOf: SearchParameter
Usage: #definition
Title: "Search in Location endpoint basing on location address-state attribute"
* name = "LocationStateSearchParameter"
* status = #active
* description = "Searches based on the address-state field for the location record eg) /ws/fhir2/{release}/Location?address-state={state}"
* code = #address-state
* base[0] = #Location
* target = #OMRSLocation
* type = #string

Instance: location-tag
InstanceOf: SearchParameter
Usage: #definition
Title: "Search in Location endpoint basing on location tag attribute"
* name = "LocationTagSearchParameter"
* status = #active
* description = "Searches based on the tag field for the location record eg) /ws/fhir2/{release}/Location?_tag={tag}"
* code = #tag
* base[0] = #Location
* target = #OMRSLocation 
* type = #string

Instance: location-partof
InstanceOf: SearchParameter
Usage: #definition
Title: "Search in Location endpoint basing on location partof attribute"
* name = "LocationPartOfSearchParameter"
* status = #active
* description = "Searches based on the partof field for the location record eg) /ws/fhir2/{release}/Location?partof={reference}"
* code = #partOf
* base[0] = #Location
* target = #OMRSLocation 
* type = #reference

Instance: location-partof-name
InstanceOf: SearchParameter
Usage: #definition
Title: "Search in Location endpoint basing on location partof reference location name attribute"
* name = "LocationPartOfNameSearchParameter"
* status = #active
* description = "Searches based on the partof location reference name field for the location record eg) /ws/fhir2/{release}/Location?partof.name={name}"
* code = #partOf-name
* base[0] = #Location
* target = #OMRSLocation 
* type = #reference

Instance: location-id
InstanceOf: SearchParameter
Usage: #definition
Title: "Search in Location endpoint basing on location uuid  attribute"
* name = "LocationIdSearchParameter"
* status = #active
* description = "Searches based on the location uuid field for the location record eg) /ws/fhir2/{release}/Location?_id={uuid}"
* code = #_id
* base[0] = #Location
* target = #OMRSLocation 
* type = #token

Instance: location-lastUpdated
InstanceOf: SearchParameter
Usage: #definition
Title: "Search in Location endpoint basing on location lastUpdated  attribute"
* name = "LocationLastUpdatedSearchParameter"
* status = #active
* description = "Searches based on the location lastUpdated field for the location record eg) /ws/fhir2/{release}/Location?_lastUpdated={date}"
* code = #_lastUpdated
* base[0] = #Location
* target = #OMRSLocation 
* type = #date
