Profile: OpenMRSDiagnosticReport
Parent: DiagnosticReport
Id: OpenMRS-diagnostic-report
Title: "OpenMRS Diagnostic Report"
Description: "DiagnosticReport resource created by a OpenMRS that representing results of diagnostic tests that are performed in a given clinical context."
* id 1..1
* code 1..1
* code.coding from OpenMRSOrderCodeVS
* result  0..*
* result only Reference(OpenMRSObservation)
* status 1..1
* category 0..*
* encounter 0..1
* subject 0..1
* issued  0..1

Instance: example-Openmrs-DiagnosticReport
InstanceOf: OpenMRSDiagnosticReport
Usage: #example
Title: "Openmrs DiagnosticReport"
Description: "Example OMRS DiagnosticReport Resource"
* id = "8a849d5e-6011-4279-a124-40ada5a687de"
* code.coding[+].system = "http://loinc.org"
* code.coding[=].code = #8480-6
* code.coding[+].display = "Systolic blood pressure"
* subject = Reference(Patient/5946f880-b197-400b-9caa-a3c661d23041)
* encounter = Reference(Encounter/6519d653-393b-4118-9c83-a3715b82d4ac)
* result = Reference(Observation/6f16bb57-12bc-4077-9f49-ceaa9b928669)
* issued = "2011-03-04T11:45:33+11:00"
* status = #final

Mapping: DiagnosticReportMapping
Source: OpenMRSDiagnosticReport
Target: "http://hl7.org/fhir/3.0/StructureDefinition/DiagnosticReport"
Id: diagnosticReport-mapping
Title: "FHIR HL7 vs OMRS FHIR2"
Description: "Diagnostic Report resource that is part of the Diagnostic Medicine Module. A DiagnosticReport is used to represent the results of diagnostic tests that are performed in a given clinical context. "
* -> "OpenMRSDiagnosticReport" "This profile maps to Diagnostic Report in OMRS FHIR2"
* id -> "Obs.uuid"
* status -> "Obs.status"
* code -> "Obs.concept"
* encounter -> "Obs.encounter"
* subject -> "Obs.person"
* issued -> "Obs.dateCreated"
* result -> "Obs.groupMembers"
