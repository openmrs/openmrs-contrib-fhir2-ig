Profile: OpenMRSObservation
Parent: Observation
Id: OpenMRS-observation
Title: "OpenMRS Observation"
Description: "Observation resource created by a OpenMRS that representing a result for an order submitted by an EMR System"
* code 1..1
* identifier 0..*
* code 1..1
* category 0..*
* status 1..1
* interpretation 0..*
* issued 0..1
* basedOn 0..*
* component 0..*
* encounter 0..1
* value[x]  0..1

// OpenMRS Task  Example
Instance: example-openmrs-Observation
InstanceOf: OpenMRSObservation
Usage: #example
Title: "Openmrs Observation"
Description: "Example OMRS Observation Resource"
* identifier.value = "e8f8d71a-6c14-4105-b6fe-30f3cf6b7dc9"
* identifier.system = "http://fhir.openmrs.org/ext/task/identifier"
* code.coding[+].system = "http://loinc.org"
* code.coding[=].code = #22748-8
* category.coding[+].system = "http://loinc.org"
* category.coding[=].code = #22748-8
* status = #preliminary
* subject = Reference("Patient/5946f880-b197-400b-9caa-a3c661d23041")
* subject.type = "Patient"
* effectiveDateTime = "2014-11-25T22:17:00+11:00"
