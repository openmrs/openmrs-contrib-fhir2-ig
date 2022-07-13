Profile:      OMRSPatient
Parent:       Patient
Id:           omrs-patient
Title:        "OpenMRS Patient"
Description:  "A FHIR Patient as understood by OpenMRS"
* identifier 1..*
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #closed
* identifier only OMRSPatientIdentifier
* active 1..1
* active = true
* name 0..*
* gender 0..1
* birthDate 1..1
* maritalStatus 0..1
* multipleBirth[x] 0..1
* photo 0..*
* address 0..*
* contact 0..*
* telecom 0..*
* communication 0..*
* link 0..*
* managingOrganization 0..1
* generalPractitioner 0..* 


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
