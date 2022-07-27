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
* managingOrganization 0..1

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

/** OpenMRS Patient  Example */

Instance: example-openmrs-Patient
InstanceOf: OMRSPatient
Usage: #example
Title: "Openmrs Patient"
Description: "Example OMRS Patient Resource"
* identifier.id = "53fbd0ef-ae10-46a0-9d0a-387917a66d6e"
* identifier.use = #official
* identifier.extension.url = "http://fhir.openmrs.org/StructureDefinition/patient-identifier-location"
* identifier.extension.valueReference.reference = "Location/8d6c993e-c2cc-11de-8d13-0010c6dffd0f"
* identifier.extension.valueReference.type = "Location"
* identifier.extension.valueReference.display = "Inpatient Ward"
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

/** OMRS Patient mapping */
Mapping: PatientMapping
Source: OMRSPatient
Target: "http://hl7.org/fhir/3.0/StructureDefinition/Patient"
Id: patient-mapping
Title: "FHIR HL7 vs OMRS FHIR2"
Description: "FHIR resource that is used to represent a person receiving care or other health-related services"
* -> "OMRS Patient" "This profile maps to Patient in OMRS FHIR2 and FHIR Patients are mapped to OpenMRS Patient objects"
* identifier -> "Patient.identifier"
* id -> "uuid"
* name -> "Patient.name"
* contact -> "Person.personAttribute " "The attribute used is determined by the fhir2.personContactPointAttributeTypeUuid global property"
* gender -> "Patient.gender"
* birthDate -> "Patient.birthDate"
* multipleBirth[x] -> "Patient.deceased[x]"
* address -> "Patient.address"
