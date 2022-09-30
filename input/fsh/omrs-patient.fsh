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
* deceased[x] 0..1
* address 0..*
* maritalStatus 0..0
* multipleBirth[x] 0..0
* photo 0..0
* contact 0..0
* communication 0..0
* link 0..0
* managingOrganization 0..0
* generalPractitioner 0..0

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
* deceasedBoolean = false

/** OMRS Patient mapping */
Mapping: PatientMapping
Source: OMRSPatient
Target: "http://hl7.org/fhir/3.0/StructureDefinition/Patient"
Id: patient-mapping
Title: "FHIR HL7 vs OMRS FHIR2"
Description: "FHIR resource that is used to represent a patient receiving care or other health-related services"
* -> "OMRS Patient" "This profile maps to Patient in OMRS FHIR2 and FHIR Patients are mapped to OpenMRS Patient objects"
* identifier -> "Patient.identifier"
* id -> "uuid"
* identifier -> "Patient.activeIdentifiers"
* name -> "Patient.name"
* telecom -> "Person.personAttribute " "The attribute used is determined by the fhir2.personContactPointAttributeTypeUuid global property"
* gender -> "Patient.gender"
* birthDate -> "Patient.birthDate"
* deceased[x] -> "Patient.deathDate or Patient.dead"
* address -> "Patient.address"
* active -> "Patient.voided"

/** Patient Resource search parameters*/


Instance: patient-name
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through patient endpoint by the patient's full or partial name"
* name = "PatientNameSearchParameter"
* status = #active
* description = "Searches for patient based on patient's full or partial name"
* code = #name
* base[0] = #Patient
* target = #OMRSPatient
* derivedFrom = "https://dev3.openmrs.org/openmrs/ws/fhir2/R4/Patient?name=Walker"
* type = #string

Instance: patient-gender
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through patient endpoint by the patient's gender attribute"
* name = "patientGenderSearchParameter"
* status = #active
* description = "Searches based on the gender of the patient. Note that this value must be from the AdministrativeGender valueset"
* code = #gender
* base[0] = #Patient
* target = #OMRSPatient
* derivedFrom = "https://dev3.openmrs.org/openmrs/ws/fhir2/R4/Patient?gender=male"
* type = #token

Instance: patient-birthdate
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through patient endpoint by the patient's birthdate attribute"
* name = "patientBirthdateSearchParameter"
* status = #active
* description = "Searches based on the patient's birthdate"
* code = #birthdate
* base[0] = #Patient
* target = #OMRSPatient
* derivedFrom = "https://dev3.openmrs.org/openmrs/ws/fhir2/R4/Patient?birthdate=1943-02-05"
* type = #date

Instance: patient-death-date
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through patient endpoint by the patient's death-date attribute"
* name = "patientDeathDateSearchParameter"
* status = #active
* description = "Searches based on the death date of the patient (if any)"
* code = #death-date
* base[0] = #Patient
* target = #OMRSPatient
* derivedFrom = "https://dev3.openmrs.org/openmrs/ws/fhir2/R4/Patient?death-date=2020-01-16"
* type = #date

Instance: patient-deceased
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through patient endpoint checking for those that passed on or still alive"
* name = "patientDeathDateSearchParameter"
* status = #active
* description = "Searches based on whether a patient is marked as deceased. Acceptable values are true or false"
* code = #deceased
* base[0] = #Patient
* target = #OMRSPatient
* derivedFrom = "https://dev3.openmrs.org/openmrs/ws/fhir2/R4/Patient?deceased=true"
* type = #token

Instance: patient-address-city
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through patient endpoint by the patient's location city"
* name = "patientCitySearchParameter"
* status = #active
* description = "Searches based on the patient's recorded city/village of address"
* code = #address-city
* base[0] = #Patient
* target = #OMRSPatient
* derivedFrom = "https://demo.openmrs.org/openmrs/ws/fhir2/R4/Patient?address-city=City6754"
* type = #string

Instance: patient-address-state
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through patient endpoint by the patient's location state"
* name = "patientStateSearchParameter"
* status = #active
* description = "Searches based on the patient's recorded state/province of address"
* code = #address-state
* base[0] = #Patient
* target = #OMRSPatient
* derivedFrom = "https://demo.openmrs.org/openmrs/ws/fhir2/R4/Patient?address-state=State7001"
* type = #string

Instance: patient-address-postalcode
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through patient endpoint by the patient's location postal code"
* name = "patientPostalCodeSearchParameter"
* status = #active
* description = "Searches based on the patient's recorded postal code of address"
* code = #address-postalcode
* base[0] = #Patient
* target = #OMRSPatient
* derivedFrom = "https://demo.openmrs.org/openmrs/ws/fhir2/R4/Patient?address-postalcode=47002"
* type = #string

Instance: patient-address-country
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through patient endpoint by the patient's location country"
* name = "patientCountrySearchParameter"
* status = #active
* description = "Searches based on the patient's recorded country of address"
* code = #address-country
* base[0] = #Patient
* target = #OMRSPatient
* derivedFrom = "https://demo.openmrs.org/openmrs/ws/fhir2/R4/Patient?address-country=Country3018"
* type = #string

Instance: patient-id
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through patient endpoint by the patient's uuid"
* name = "patientIdSearchParameter"
* status = #active
* description = "Searches based on the exact UUID of the patient record"
* code = #_id
* base[0] = #Patient
* target = #OMRSPatient
* derivedFrom = "https://demo.openmrs.org/openmrs/ws/fhir2/R4/Patient?_id=9bed23d0-0502-11e3-8ffd-0800200c9a66"
* type = #token

Instance: patient-lastUpdated
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through patient endpoint basing on dateCreated or dateUpdated field of the patient record"
* name = "patientLastUpdatedSearchParameter"
* status = #active
* description = "Searches based on the the dateCreated or dateUpdated field for the patient record"
* code = #_lastUpdated
* base[0] = #Patient
* target = #OMRSPatient
* derivedFrom = "https://demo.openmrs.org/openmrs/ws/fhir2/R4/Patient?_lastUpdated=2017-08-01"
* type = #date