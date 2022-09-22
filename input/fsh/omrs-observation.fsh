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
* partOf 0..0
* category 0..0
* subject 0..0
* dataAbsentReason 0..0
* bodySite 0..0
* method 0..0
* specimen 0..0
* device 0..0
* referenceRange 0..0
* hasMember 0..0
* derivedFrom 0..0
* component 0..0

// OpenMRS Observation Example
Instance: example-openmrs-Observation
InstanceOf: OpenMRSObservation
Usage: #example
Title: "Openmrs Observation"
Description: "Example OMRS Observation Resource"
* identifier.value = "e8f8d71a-6c14-4105-b6fe-30f3cf6b7dc9"
* identifier.system = "http://fhir.openmrs.org/ext/task/identifier"
* code.coding[+].system = "http://loinc.org"
* code.coding[=].code = #22748-8
* status = #preliminary
* effectiveDateTime = "2014-11-25T22:17:00+11:00"

Mapping: ObservationMapping
Source: OpenMRSObservation
Target: "http://hl7.org/fhir/3.0/StructureDefinition/Observation"
Id: Observation-mapping
Title: "FHIR HL7 vs OMRS FHIR2"
Description: "FHIR resource that is used to support diagnosis, monitor progress, determine baselines and patterns and even capture demographic characteristics As such, Observations have a wide range of uses and show up in a wide range of places"
* -> "OpenMRSObservation" "FHIR Observations are mapped to OpenMRS Obs objects"
* id -> "uuid"
* status -> "obs.status"
* interpretation -> "obs.interpretation"
* effectiveDateTime -> "obs.effective"
* code -> "obs.code"
* issued -> "obs.dateTime"
