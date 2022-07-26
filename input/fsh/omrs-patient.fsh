Profile:      OMRSPatient
Parent:       Patient
Id:           omrs-patient
Title:        "OpenMRS Patient"
Description:  "A FHIR Patient as understood by OpenMRS"
* identifier 1..*
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier only OMRSPatientIdentifier
* active 1..1
* active = true
* name 1..1
* gender 1..1
* birthDate 1..1
* maritalStatus 0..0
* multipleBirth[x] 0..0
* photo 0..0
* contact 0..0
* communication 0..0
* link 0..0

Profile:      OMRSPatientIdentifier
Parent:       Identifier
Id:           omrs-patient-identifier
Title:        "OpenMRS Patient Identifier"
Description:  "Patient Identifers as understood by OpenMRS"
* extension contains
    OMRSPatientIdentifierLocationExtension named location 1..1

Extension:    OMRSPatientIdentifierLocationExtension
Id:           omrs-patient-identifier-location
Title:        "OpenMRS Patient Identifier Location"
Description:  "OpenMRS location for which this identifier is valid"
* value[x] only Reference(OMRSLocation)

// OpenMRS Patient  Example

Instance: example-openmrs-Patient
InstanceOf: OMRSPatient
Usage: #example
Title: "Openmrs Patient"
Description: "Example OMRS Patient Resource"
* identifier.id = "53fbd0ef-ae10-46a0-9d0a-387917a66d6e"
* identifier.use = #official
* identifier.type.text = "OpenMRS ID"
* identifier.value = "1000Y"
* name.id = "3434gh32-34h3j4-34jk34-3422h"
* name.family = "Jeannette"
* name.given = "Ricky"
* gender = #male
* birthDate = "1996-12-12"
* address.extension.url = "http://fhir.openmrs.org/ext/address"
* address.use = #home
* address.country = "Washington"
* address.city = "Washington"
* address.district = "Washington"
* active = true 
