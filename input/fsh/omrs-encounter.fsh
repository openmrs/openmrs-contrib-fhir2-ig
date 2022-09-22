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