Profile:      OMRSLocation
Parent:       Location
Id:           omrs-location
Title:        "OpenMRS Location"
Description:  "An OpenMRS location"
* identifier 1..1 MS
* status 1..1 MS
* status from LocationStatusVS
* name 1..1 MS
* position 0..1 MS
* position.longitude 1..1
* position.latitude 1..1 
* telecom 0..1 MS
* telecom only OMRSLocationContactPoint 
* address only OMRSAddress


Profile:      OMRSLocationContactPoint
Parent:       ContactPoint
Id:           omrs-location-contact-point
Title:        "OpenMRS Location Contact Point"
Description:  "An OpenMRS Location Phone Number"
* id 1..1 MS
* value 1..1 MS

Profile: OMRSAddress
Parent: Address
Id: omrs-address
Title: "OMRS Address"
Description: "Address profile specifies the geological location details"
* use 0..1 MS
* city 0..1 MS
* district 0..1 MS
* state 0..1 MS
* postalCode 0..1 MS
* country 0..1 MS


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
* identifier.id = "2daccc0e-654c-4130-9693-a84f328f045e"
* status = #active
* name = "Outpatient Clinic"
* telecom.id = "e85ab215-a425-4c22-9452-5c8e9f6d1e52"
* telecom.value = "(555) 675 5745"
* address.use = #home
* address.city = "Kampala"
* address.district = "Mukono"
* address.state = "Uganda"
* address.postalCode = "256"
* address.country = "Uganda"
* position.latitude = 8.206053
* position.longitude = -25.087541