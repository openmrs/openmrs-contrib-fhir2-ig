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

/* OpenMRS Observation Resource  Example */

Instance: example-openmrs-Observation
InstanceOf: OpenMRSObservation
Usage: #example
Title: "Openmrs Observation"
Description: "Example OMRS Observation Resource"
* identifier.value = "e8f8d71a-6c14-4105-b6fe-30f3cf6b7dc9"
* identifier.system = "http://fhir.openmrs.org/ext/task/identifier"
* category.coding[+].system = "http://terminology.hl7.org/CodeSystem/observation-category"
* category.coding[=].code = #exam
* code.coding[+].code = #431314004
* code.coding[=].system = "http://snomed.info/sct"
* code.coding[=].display = "Arterial blood oxygen saturation (pulse oximeter)"
* code.text = "Arterial blood oxygen saturation (pulse oximeter)"
* status = #preliminary
* subject = Reference(example-openmrs-Patient)
* encounter = Reference(EncounterExample)
* issued = "2022-08-17T19:26:04.000+00:00"
* valueQuantity[+].code = #%
* valueQuantity[=].value = 88.3
* valueQuantity[=].unit = "%"
* valueQuantity[=].system = "http://unitsofmeasure.org"
* interpretation.coding[0].code = #H
* interpretation.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation"
* interpretation.coding[0].display = "High"
* referenceRange.low[0].value = 0.0
* referenceRange.high[0].value = 100.0
* referenceRange.type.coding[0].system = "http://fhir.openmrs.org/ext/obs/reference-range"
* referenceRange.type.coding[0].code = #absolute
* effectiveDateTime =  "2017-08-17T02:30:04+00:00"
