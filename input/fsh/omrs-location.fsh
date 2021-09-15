Profile:      OMRSLocation
Parent:       Location
Id:           omrs-location
Title:        "OpenMRS Location"
Description:  "An OpenMRS location"
* id 1..1
* status 1..1
* status = #active
* operationalStatus 0..0
* name 1..1
* alias 0..0
* mode 0..0
* type 0..0
* telecom 0..1
* telecom only OMRSLocationContactPoint
* physicalType 0..0
* managingOrganization 0..0
* hoursOfOperation 0..0
* availabilityExceptions 0..0
* endpoint 0..0

Profile:      OMRSLocationContactPoint
Parent:       ContactPoint
Id:           omrs-location-contact-point
Title:        "OpenMRS Location Contact Point"
Description:  "An OpenMRS Location Phone Number"
* id 1..1
* system 0..0
* value 1..1
* use 0..0
* rank 0..0
* period 0..0