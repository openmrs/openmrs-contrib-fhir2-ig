/**Location Resource profile*/

Profile:      OMRSLocation
Parent:       Location
Id:           omrs-location
Title:        "OpenMRS Location"
Description:  "An OpenMRS location"
* identifier 1..1 
* status 1..1 
* status from LocationStatusVS
* operationalStatus 0..0
* name 1..1 
* alias 0..0
* description 0..1
* mode 0..0
* type 0..*
* position 0..1 
* position.longitude 1..1
* position.latitude 1..1 
* telecom 0..*
* telecom only OMRSLocationContactPoint 
* address only OMRSAddress
* managingOrganization 0..0
* partOf 0..1
* hoursOfOperation 0..0
* availabilityExceptions 0..0
* endpoint 0..0


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
* identifier.id = "2daccc0e-654c-4130-9693-a84f328f045e"
* status = #active
* name = "Outpatient Clinic"
* description = "Outpatient Clinic"
* type.coding[0].code = #Sleep
* type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
* type.coding[0].display = "Sleep disorders unit"
* telecom[+].system = #Phone
* telecom[=].value = "(+1) 734-677-7777"
* telecom[+].system = #Fax
* telecom[=].value = "(+1) 734-677-6622"
* telecom[+].system = #Email
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