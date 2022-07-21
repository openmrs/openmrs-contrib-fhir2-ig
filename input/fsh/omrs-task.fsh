Profile: OpenMRSTask
Parent: Task
Id: OpenMRS-task
Title: "OpenMRS Task "
Description: "A Task resource represent an activity that is to be performed,and track the completion of said activity between an OpenMRS and a FHIR2"
* identifier 1..* MS
* basedOn 1..*  MS
* basedOn only Reference(OpenMRSServiceRequest)
* for only Reference(OMRSPatient)
* encounter only Reference(OpenMRSEncounter)
* authoredOn 1..1 MS
* status from OMRSPatientTaskStatusVS 
* intent from OMRSPatientTaskIntentVS 
* output.type.text = "DiagnosticReport"
* statusReason 1..1
* businessStatus 0..1 
* code 0..1
* description 0..1
* focus 0..1
* for 0..1
* executionPeriod 0..1
* authoredOn 1..1
* lastModified 0..1
* performerType 0..*
* reasonCode 0..1
* note 0..*
* restriction 0..1

