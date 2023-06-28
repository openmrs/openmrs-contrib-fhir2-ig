Profile:      OMRSPatient
Parent:       Patient
Id:           omrs-patient
Title:        "OpenMRS Patient"
Description:  "A FHIR Patient as understood by OpenMRS"
* id 1..1
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
* uri = http://fhir.openmrs.org/ext/patient/identifier#location
* value[x] only Reference(OMRSLocation)
* ^context[0].type = #element
* ^context[0].expression = "Identifier"

/** OpenMRS Patient  Example */

Instance: example-openmrs-Patient
InstanceOf: OMRSPatient
Usage: #example
Title: "OpenMRS Patient Example"
Description: "Example OpenMRS Patient resource"
* identifier.use = #official
* identifier.extension[OMRSPatientIdentifierLocationExtension].valueReference = Reference(LocationExample)
  * type = "Location"
  * display = "Inpatient Ward"
* identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#MR
* identifier.type.text = "OpenMRS ID"
* identifier.value = "4343534"
* name.family = "Jeannette"
* name.given = "Ricky"
* gender = #male
* birthDate = "1996-12-12"
* telecom[0].value = "+256788232241"
* telecom[0].system = #phone
* address.use = #home
* address.country = "Washington"
* address.city = "Washington"
* address.district = "Washington"
* active = true 
* deceasedBoolean = false

/** OMRS Patient mapping */
Mapping: PatientMapping
Source: OMRSPatient
Target: "Patient"
Id: patient-mapping
Title: "FHIR HL7 vs OMRS FHIR2"
Description: "FHIR resource that is used to represent a patient receiving care or other health-related services"
* -> "OMRS Patient" "This profile maps to Patient in OMRS FHIR2 and FHIR Patients are mapped to OpenMRS Patient objects"
* identifier -> "Patient.identifier"
* id -> "uuid"
* identifier -> "Patient.activeIdentifiers"
* name -> "Patient.name"
* telecom -> "Person.personAttribute" "The attribute used is determined by the fhir2.personContactPointAttributeTypeUuid global property"
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
* description = "Searches for patient based on patient's full or partial name eg) /ws/fhir2/{release}/Patient?name={name}"
* code = #name
* base[0] = #Patient
* target = #Patient
* type = #string

Instance: patient-gender
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through patient endpoint by the patient's gender attribute"
* name = "PatientGenderSearchParameter"
* status = #active
* description = "Searches based on the gender of the patient. Note that this value must be from the AdministrativeGender valueset eg) /ws/fhir2/{release}/Patient?gender={gender}"
* code = #gender
* base[0] = #Patient
* target = #Patient
* type = #token

Instance: patient-birthdate
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through patient endpoint by the patient's birthdate attribute"
* name = "PatientBirthdateSearchParameter"
* status = #active
* description = "Searches based on the patient's birthdate eg) /ws/fhir2/{release}/Patient?birthdate={date}"
* code = #birthdate
* base[0] = #Patient
* target = #Patient
* type = #date

Instance: patient-death-date
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through patient endpoint by the patient's death-date attribute"
* name = "PatientDeathDateSearchParameter"
* status = #active
* description = "Searches based on the death date of the patient (if any) eg) /ws/fhir2/{release}/Patient?death-date={date}"
* code = #death-date
* base[0] = #Patient
* target = #Patient
* type = #date

Instance: patient-deceased
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through patient endpoint checking for those that passed on or still alive"
* name = "PatientDeathDateSearchParameter"
* status = #active
* description = "Searches based on whether a patient is marked as deceased. Acceptable values are true or false eg) /ws/fhir2/{release}/Patient?deceased={boolean}"
* code = #deceased
* base[0] = #Patient
* target = #Patient
* type = #token

Instance: patient-address-city
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through patient endpoint by the patient's location city"
* name = "PatientCitySearchParameter"
* status = #active
* description = "Searches based on the patient's recorded city/village of address eg) /ws/fhir2/{release}/Patient?address-city={city}"
* code = #address-city
* base[0] = #Patient
* target = #Patient
* type = #string

Instance: patient-address-state
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through patient endpoint by the patient's location state"
* name = "PatientStateSearchParameter"
* status = #active
* description = "Searches based on the patient's recorded state/province of addresseg) /ws/fhir2/{release}/Patient?address-state={state}"
* code = #address-state
* base[0] = #Patient
* target = #Patient
* type = #string

Instance: patient-address-postalcode
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through patient endpoint by the patient's location postal code"
* name = "PatientPostalCodeSearchParameter"
* status = #active
* description = "Searches based on the patient's recorded postal code of address eg) /ws/fhir2/{release}/Patient?address-postalcode={postalCode}"
* code = #address-postalcode
* base[0] = #Patient
* target = #Patient
* type = #string

Instance: patient-address-country
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through patient endpoint by the patient's location country"
* name = "PatientCountrySearchParameter"
* status = #active
* description = "Searches based on the patient's recorded country of address eg) /ws/fhir2/{release}/Patient?address-country={country}"
* code = #address-country
* base[0] = #Patient
* target = #Patient
* type = #string

Instance: patient-id
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through patient endpoint by the patient's uuid"
* name = "PatientIdSearchParameter"
* status = #active
* description = "Searches based on the exact UUID of the patient record eg} /ws/fhir2/{release}/Patient?_id={uuid}"
* code = #_id
* base[0] = #Patient
* target = #Patient
* type = #token

Instance: patient-lastUpdated
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through patient endpoint basing on dateCreated or dateUpdated field of the patient record"
* name = "PatientLastUpdatedSearchParameter"
* status = #active
* description = "Searches based on the the dateCreated or dateUpdated field for the patient record eg) /ws/fhir2/{release}/Patient?_lastUpdated={date-range}"
* code = #_lastUpdated
* base[0] = #Patient
* target = #Patient
* type = #date