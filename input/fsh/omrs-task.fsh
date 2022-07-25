Profile: OpenMRSTask
Parent: Task
Id: OpenMRS-task
Title: "OpenMRS Task"
Description: "A Task resource represent an activity that is to be performed,and track the completion of said activity between an OpenMRS and a FHIR2"
* identifier 1..* MS
* basedOn 1..*  MS
* basedOn only Reference(OpenMRSServiceRequest)
* for only Reference(OMRSPatient)
// * encounter only Reference(Encounter)
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
* lastModified 0..1
* performerType 0..*
* reasonCode 0..1
* note 0..*
* restriction 0..1

// OpenMRS Task  Example
Instance: example-openmrs-Task
InstanceOf: OpenMRSTask
Usage: #example
Title: "Openmrs Task"
Description: "Example OMRS Task Resource"
* id = "e8f8d71a-6c14-4105-b6fe-30f3cf6b7dc9"
* status = "accepted"
* basedOn = "OpenMRSServiceRequest"
* businessStatus = "waiting for specimen (Details )"
* intent = "order"
* priority = "routine"
* code = "Specimen Collection (Details )"
* authoredOn =  "25/7/22"
* lastModified = "26/7/22"
* focus = "BloodDraw ProcedureRequest"
* owner "Inpatient Ward"
* performerType = "Performer"


Mapping: TaskMapping
Source: OpenMRSTask
Target: "http://hl7.org/fhir/3.0/StructureDefinition/Task"
Id: task-mapping
Title: "FHIR HL7 vs OMRS FHIR2"
Description: "Task is used to represent an activity that is to be performed,and track the completion of said activity."
* -> "OpenMRSTask" "This profile maps to Task in OMRS FHIR2"
* id -> "id"
* status -> "status"
* intent -> "intent"
* basedOn -> "basedOn"
// * encounter -> "encounter"
* owner -> "owner"
* input -> "input"
* output -> "output"

