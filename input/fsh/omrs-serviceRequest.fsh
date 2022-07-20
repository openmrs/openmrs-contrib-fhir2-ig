Profile: OpenMRSServiceRequest
Parent: ServiceRequest
Id: OpenMRS-service-request
Title: "OpenMRS Service Request"
Description: " Service Request Resource is represents a request for some type of procedure or diagnostic test to be performed. When fulfilled, the results of this request are represented as a DiagnosticReport resource with associated Observation resources"
* code 1..1
* code.coding 1..*
* code.coding from OpenMRSOrderCodeVS
* subject only Reference(OMRSPatient)
// * encounter only Reference(Encounter)

