Profile: OMRSEncounter
Parent: Encounter
Id: omrs-encounter
Title: "Openmrs Encounter"
Description: "A FHIR Encounter as understood by OpenMRS"
* id 1..1 
* meta 0..1 
* meta.tag 0..* 
* meta.tag ^slicing.discriminator.type = #value
* meta.tag ^slicing.discriminator.path = "system"
* meta.tag ^slicing.rules = #closed
* status 1..1 
* class 1..1 
* class.code
* class.system 
* type 1..*
* serviceType 0..0
* priority 0..0
* subject 1..1
* subject only Reference(OMRSPatient)
* episodeOfCare 0..0
* basedOn 0..0
* participant 0..*
* appointment 0..0
* period 1..1
* length 0..0
* reasonCode 0..0
* reasonReference 0..0
* diagnosis 0..*
* account 0..0
* hospitalization 0..0
* location.location 1..1
* location.location only Reference(OMRSLocation)
* partOf only Reference(OMRSEncounter)

/** Encounter Type code system*/
CodeSystem: EncounterType
Id: encounter-type
Title: "Encounter Type Code System"
Description: "Encounter Type Coding System"
* #discharge "Discharge" "Indicates that a patient's inpatient care at the hospital is ending, and they are expected to leave soon."
* #admission "Admission" "Indicates that the patient has been admitted for inpatient care, and is not expected to leave the hospital unless discharged."
* #visitNote "Visit Note" "Encounter where a full or abbreviated examination is done, usually leading to a presumptive or confirmed diagnosis, recorded by the examining clinician."
* #checkOut "Check Out" "The patient is explicitly leaving the hospital/clinic. (Usually no formal encounter is captured for this.)"
* #checkIn "Check In" "Indicates the patient has done the required paperwork and check-in to begin a visit to the clinic/hospital."
* #transfer "Transfer" "Indicates that a patient is being transferred into a different department within the hospital. (Transfers out of the hospital should not use this encounter type.)"
* #vitals "Vitals" "For capturing vital signs"
* #attachmentUpload "Attachment Upload" "Encounters used to record uploads of attachments."

/**encounter status Value set **/

Alias: $statusVsUrl = https://hl7.org/fhir/encounter-status
ValueSet: EncounterVs
Id: encounter-status-vs
Title: "EncounterStatus"
Description: "Encounter  status ValueSet"
* $statusVsUrl#planned "Planned"
* $statusVsUrl#arrived "Arrived"
* $statusVsUrl#triaged "Triaged"
* $statusVsUrl#in-progress "In Progress"
* $statusVsUrl#onleave "On Leave"
* $statusVsUrl#finished "Finished"
* $statusVsUrl#cancelled "Cancelled"
* $statusVsUrl#entered-in-error "Entered in Error"
* $statusVsUrl#unknown "Unknown"

/** OMRS Encounter Resource Example **/

Instance: EncounterExample
InstanceOf: OMRSEncounter 
Usage: #example
Title: "Encounter Resource Example"
Description: "Example OMRS Encounter"
* id = "5b829d01-34bb-47d1-b1bb-9303c3a9ebcb"
* status = #unknown
* class.code = #AMB
* class.system = "http://terminology.hl7.org/CodeSystem/v3-ActCode"
* subject = Reference(EncounterPatientExample)
* subject.type = "Patient"
* type.coding.code = #67a71486-1a54-468f-ac3e-7091a9a79584
* type.coding.display = "Vitals"
* type.coding.system = "http://fhir.openmrs.org/code-system/encounter-type"
* period[0].start = 2022-06-22
* period[0].end = 2022-06-22
* location.location = Reference(LocationExample)

Instance: EncounterPatientExample
InstanceOf: Patient
Usage: #example
Title: "Encounter Patient Example"
Description: "OMRS Encounter Resource Example"
* id = "51ead2ec-279f-482d-80f8-209a5d4109d0"
* name.family = "Doe"
* name.given = "Jane"

/** Encounter FHIR -- Openmrs Mapping*/
Mapping: EncounterMapping
Source: OMRSEncounter
Target: "http://hl7.org/fhir/3.0/StructureDefinition/Encounter"
Id: encounter-mapping
Title: "FHIR HL7 vs OMRS FHIR2"
Description: "Encounter is an FHIR resource that is used to represent an Interaction between a patient and healthcare provider(s)  for the purpose of providing healthcare services or assessing the health status of a patient. Encounter FHIR resources are mapped to both OpenMrs Encounter and Visit Objects."
* -> "OMRS Encounter" "This profile maps to Encounter in OMRS FHIR2"
* id -> "Encounter.uuid"
* status -> "Encounter.status"
* subject -> "Encounter.patient"
* participant -> "Encounter.encounterProvider"
* location -> "Encounter.location"

/** encounter resource search parameters*/

Instance: Encounter-date
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through Encounter endpoint by the date when the encounter was created"
* name = "EncounterPatientNameSearchParameter"
* status = #active
* description = "Searches for Encounter based on the encounter creation date eg) /ws/fhir2/{release}/Encounter?date={date}"
* code = #Encounter.period
* base[0] = #Encounter
* target = #OMRSEncounter
* type = #date

Instance: Encounter-location
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through Encounter endpoint based on location reference"
* name = "EncounterLocationNameSearchParameter"
* status = #active
* description = "Searches for Encounter based on the location reference uuid eg) /ws/fhir2/{release}/Encounter?location={uuid}"
* code = #Encounter.location
* base[0] = #Encounter
* target = #OMRSEncounter
* type = #reference

Instance: Encounter-address-city
InstanceOf: SearchParameter
Usage: #definition
Title: "Search in Encounter endpoint basing on Encounter location address-city attribute"
* name = "EncounterCitySearchParameter"
* status = #active
* description = "Searches based on the address-city field for the Encounter record eg) /ws/fhir2/{release}/Encounter?address-city={city}"
* code = #address-city
* base[0] = #Encounter
* target = #OMRSEncounter
* type = #string

Instance: Encounter-address-country
InstanceOf: SearchParameter
Usage: #definition
Title: "Search in Encounter endpoint basing on  Encounter location address-country attribute"
* name = "EncounterCountrySearchParameter"
* status = #active
* description = "Searches based on the address-country field for the Encounter record eg) /ws/fhir2/{release}/Encounter?address-country={country}"
* code = #address-country
* base[0] = #Encounter
* target = #OMRSEncounter
* type = #string

Instance: Encounter-address-postalcode
InstanceOf: SearchParameter
Usage: #definition
Title: "Search in Encounter endpoint basing on Encounter location address-postalcode attribute"
* name = "EncounterPostalCodeSearchParameter"
* status = #active
* description = "Searches based on the address-postalcode field for the Encounter record eg) /ws/fhir2/{release}/Encounter?address-postalcode={postalCode}"
* code = #address-postalcode
* base[0] = #Encounter
* target = #OMRSEncounter
* type = #string

Instance: Encounter-address-state
InstanceOf: SearchParameter
Usage: #definition
Title: "Search in Encounter endpoint basing on Encounter location address-state attribute"
* name = "EncounterStateSearchParameter"
* status = #active
* description = "Searches based on the address-state field for the Encounter record eg) /ws/fhir2/{release}/Encounter?address-state={state}"
* code = #address-state
* base[0] = #Encounter
* target = #OMRSEncounter
* type = #string

Instance: Encounter-subject
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through Encounter endpoint by subject uuid"
* name = "EncounterSubjectSearchParameter"
* status = #active
* description = "Searches for Encounter by a given subject eg) /ws/fhir2/{release}/Encounter?subject:Patient={patientUuid} "
* code = #subject
* base[0] = #Encounter
* target = #OMRSEncounter
* type = #reference

Instance: Encounter-subject-identifier
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through Encounter endpoint by subject identifier"
* name = "EncounterSubjectIdentifierSearchParameter"
* status = #active
* description = "Searches for Encounter by the patient identifier eg) /ws/fhir2/{release}/Encounter?subject:Patient.identifier={identifier}"
* code = #subject.identifier
* base[0] = #Encounter
* target = #OMRSEncounter
* type = #token

Instance: Encounter-subject-given
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through Encounter endpoint by subject given"
* name = "EncounterSubjectGivenSearchParameter"
* status = #active
* description = "Searches for Encounter based on the patient's given name(s) eg) /ws/fhir2/{release}/Encounter?subject:Patient.given={givenName}"
* code = #subject.given
* base[0] = #Encounter
* target = #OMRSEncounter
* type = #string

Instance: Encounter-subject-family
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through Encounter endpoint by subject family"
* name = "EncounterSubjectfamilySearchParameter"
* status = #active
* description = "	Searches for Encounter based on the patient's family name eg) /ws/fhir2/{release}/Encounter?subject:Patient.family={familyName}"
* code = #subject.family
* base[0] = #Encounter
* target = #OMRSEncounter
* type = #string

Instance: Encounter-subject-name
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through Encounter endpoint by subject name"
* name = "EncounterSubjectNameSearchParameter"
* status = #active
* description = "Searches for Encounter based on the patient's full or partial name eg) /ws/fhir2/{release}/Encounter?subject:Patient.name={name}"
* code = #subject.name
* base[0] = #Encounter
* target = #OMRSEncounter
* type = #string

Instance: Encounter-type
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through Encounter endpoint by encounter type"
* name = "EncounterTypeSearchParameter"
* status = #active
* description = "Searches for Encounter based on encounter type field eg) /ws/fhir2/{release}/Encounter?type={encounterType}"
* code = #encounter.type
* base[0] = #Encounter
* target = #OMRSEncounter
* type = #token

Instance: Encounter-patient
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through Encounter endpoint by a given patient"
* name = "EncounterPatientSearchParameter"
* status = #active
* description = "Searches for Encounters by a given patient eg) /ws/fhir2/{release}/Encounter?patient={patientUuid}"
* code = #patient
* base[0] = #Encounter
* target = #OMRSEncounter
* type = #reference

Instance: Encounter-patient-identifier
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through Encounter endpoint by a given patient"
* name = "EncounterPatientIdentifierSearchParameter"
* status = #active
* description = "Searches for Encounters by a given patient eg) /ws/fhir2/{release}/Encounter?patient.identifier={identifier}"
* code = #patient.identifier
* base[0] = #Encounter
* target = #OMRSEncounter
* type = #token

Instance: Encounter-patient.given
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through Encounter endpoint by the patient's given name"
* name = "EncounterPatientGivenNameSearchParameter"
* status = #active
* description = "Searches for Encounters based on the patient's given name(s) eg) /ws/fhir2/{release}/Encounter?patient.given={givenName}"
* code = #patient.given
* base[0] = #Encounter
* target = #OMRSEncounter
* type = #string

Instance: Encounter-patient.family
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through Encounter endpoint by the patient's family name"
* name = "EncounterPatientFamilyNameSearchParameter"
* status = #active
* description = "Searches for Encounters based on the patient's family name eg) /ws/fhir2/{release}/Encounter?patient.family={familyName}"
* code = #patient.family
* base[0] = #Encounter
* target = #OMRSEncounter
* type = #string

Instance: Encounter-patient.name
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through Encounter endpoint by the patient's full or partial name"
* name = "EncounterPatientNameSearchParameter"
* status = #active
* description = "Searches for Encounters based on the patient's full or partial name eg) /ws/fhir2/{release}/Encounter?patient.name={name}"
* code = #patient.name
* base[0] = #Encounter
* target = #OMRSEncounter
* type = #string 

Instance: Encounter-participant
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through Encounter endpoint by a given Practitioner "
* name = "EncounterParticipantSearchParameter"
* status = #active
* description = "Searches for Encounters by a given Practitioner Reference uuid eg) /ws/fhir2/{release}/Encounter?participant={PractitionerUuid}"
* code = #participant
* base[0] = #Encounter
* target = #OMRSEncounter
* type = #reference

Instance: Encounter-participant-identifier
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through Encounter endpoint by a given Practitioner"
* name = "EncounterParticipantIdentifierSearchParameter"
* status = #active
* description = "Searches for Encounters by a given Practitioner eg) /ws/fhir2/{release}/Encounter?participant.identifier={identifier}"
* code = #participant.identifier
* base[0] = #Encounter
* target = #OMRSEncounter
* type = #token

Instance: Encounter-participant.given
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through Encounter endpoint by the Practitioner's given name"
* name = "EncounterParticipantGivenNameSearchParameter"
* status = #active
* description = "Searches for Encounters based on the Practitioner's given name(s) eg) /ws/fhir2/{release}/Encounter?participant.given={givenName}"
* code = #participant.given
* base[0] = #Encounter
* target = #OMRSEncounter
* type = #string

Instance: Encounter-participant.family
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through Encounter endpoint by the Practitioner's family name"
* name = "EncounterParticipantFamilyNameSearchParameter"
* status = #active
* description = "Searches for Encounters based on the Practitioner's family name eg) /ws/fhir2/{release}/Encounter?participant.family={familyName}"
* code = #participant.family
* base[0] = #Encounter
* target = #OMRSEncounter
* type = #string

Instance: Encounter-participant.name
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through Encounter endpoint by the Practitioner's full or partial name"
* name = "EncounterParticipantNameSearchParameter"
* status = #active
* description = "Searches for Encounters based on the Practitioner's full or partial name eg) /ws/fhir2/{release}/Encounter?participant.name={name}"
* code = #participant.name
* base[0] = #Encounter
* target = #OMRSEncounter
* type = #string 

Instance: Encounter-id
InstanceOf: SearchParameter
Usage: #definition
Title: "Search in Encounter endpoint basing on Encounter uuid  attribute"
* name = "EncounterIdSearchParameter"
* status = #active
* description = "Searches based on the Encounter uuid field for the Encounter record eg) /ws/fhir2/{release}}/Encounter?_id={uuid}"
* code = #_id
* base[0] = #Encounter
* target = #OMRSEncounter 
* type = #token

Instance: Encounter-lastUpdated
InstanceOf: SearchParameter
Usage: #definition
Title: "Search in Encounter endpoint basing on Encounter lastUpdated  attribute"
* name = "EncounterLastUpdatedSearchParameter"
* status = #active
* description = "Searches based on the Encounter lastUpdated field for the Encounter record eg) /ws/fhir2/{release}/Encounter?_lastUpdated={date}"
* code = #_lastUpdated
* base[0] = #Encounter
* target = #OMRSEncounter 
* type = #date