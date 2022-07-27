Profile: OpenMRSTask
Parent: Task
Id: OpenMRS-task
Title: "OpenMRS Task"
Description: "A Task resource represent an activity that is to be performed,and track the completion of said activity between an OpenMRS and a FHIR2"
* identifier 1..*
* basedOn 1..*
* basedOn only Reference(OpenMRSServiceRequest)
* for only Reference(OMRSPatient)
* authoredOn 1..1
* status from OMRSPatientTaskStatusVS
* intent from OMRSPatientTaskIntentVS
* statusReason 0..1
* businessStatus 0..1 
* code 0..1
* description 0..1
* focus 0..1
* for 0..1
* executionPeriod 0..1
* lastModified 0..1
* output 0..* 
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
* identifier.value = "e8f8d71a-6c14-4105-b6fe-30f3cf6b7dc9"
* identifier.system = "http://fhir.openmrs.org/ext/task/identifier"
* status = #completed
* basedOn[+].type = "ServiceRequest"
* intent = #order
* for = Reference(OMRSPatient)
* authoredOn =  "2021-02-20"
* lastModified = "2021-02-21"
* owner = Reference(OMRSPatient)

Mapping: TaskMapping
Source: OpenMRSTask
Target: "http://hl7.org/fhir/3.0/StructureDefinition/Task"
Id: task-mapping
Title: "FHIR HL7 vs OMRS FHIR2"
Description: "Task is used to represent an activity that is to be performed,and track the completion of said activity."
* -> "OpenMRSTask" "This profile maps to Task in OMRS FHIR2"
* id -> "uuid"
* status -> "task.status"
* intent -> "task.intent"
* basedOn -> "task.basedOn"
* owner -> "task.owner"
* input -> "task.input"
* output -> "task.output"
* code -> "code"
* for -> "patient"
* focus -> "focus"
