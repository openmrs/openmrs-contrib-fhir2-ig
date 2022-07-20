Profile: OpenMRSTask
Parent: Task
Id: OpenMRS-task
Title: "OpenMRS Task "
Description: "A Task resource represent an activity that is to be performed,and track the completion of said activity between an OpenMRS and a FHIR2"
* identifier 1..*
* basedOn 1..*
* basedOn only Reference(OpenMRSServiceRequest)
* for only Reference(OMRSPatient)
* encounter only Reference(OpenMRSEncounter)
* authoredOn 1..1
* output.type.text = "DiagnosticReport"

