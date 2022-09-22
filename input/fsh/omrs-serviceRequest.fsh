Profile: OpenMRSServiceRequest
Parent: ServiceRequest
Id: OpenMRS-service-request
Title: "OpenMRS Service Request"
Description: " Service Request Resource is represents a request for some type of procedure or diagnostic test to be performed. When fulfilled, the results of this request are represented as a DiagnosticReport resource with associated Observation resources"
* identifier 0..*
* code 1..1
* code.coding 1..*
* code.coding from OpenMRSOrderCodeVS
* subject only Reference(OMRSPatient)
* status 1..1
* intent 1..1
* subject 1..1
* requester 0..1
* performer 0..*
* occurrence[x] 0..1

// OpenMRS Service Request Resource
Instance: example-openmrs-ServiceRequest
InstanceOf: OpenMRSServiceRequest
Usage: #example
Title: "Openmrs serviceRequest"
Description: "Example OMRS Service Request Resource"
* identifier.value = "7d13b03b-58c2-43f5-b34d-08750c51aea9"
* identifier.system = "http://fhir.openmrs.org/ext/task/identifier"
* code.coding[+].system = "http://snomed.info/sct"
* code.coding[=].code = #48023004
* category.coding[+].system = "http://snomed.info/sct"
* category.coding[=].code = #311401005
* status = #completed
* intent = #order
* subject.display = "Patient/5946f880-b197-400b-9caa-a3c661d23041, Jane Doe"
* subject.type = "Patient"
* occurrenceDateTime = "2014-08-16"
* authoredOn = "2016-08-16"
* requester.display = "Angela Care, MD"
* performer.display = "Pamela Educator, RN"

Mapping: ServiceRequestMapping
Source: OpenMRSServiceRequest
Target: "http://hl7.org/fhir/3.0/StructureDefinition/serviceRequest"
Id: ServiceRequest-mapping
Title: "FHIR HL7 vs OMRS FHIR2"
Description: "ServiceRequest is used to represents a request for some type of procedure or diagnostic test to be performed. When fulfilled, the results of this request are represented as a DiagnosticReport resource with associated Observation resources."
* -> "OpenMRSServiceRequest" "This profile maps to Service Request in OMRS FHIR2"
* id -> "uuid"
* status -> "ServiceRequest.status"
* code -> "ServiceRequest.concept"
* performer -> "ServiceRequestt.performer"
* requester -> "ServiceRequest.requester"
* subject -> "ServiceRequest.subject"
