Profile: OpenMRSDiagnosticReport
Parent: DiagnosticReport
Id: OpenMRS-diagnostic-report
Title: "OpenMRS Diagnostic Report"
Description: "DiagnosticReport resource created by a OpenMRS that representing results of diagnostic tests that are performed in a given clinical context."
* identifier 0..*
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier only OMRSPatientIdentifier
* basedOn 0..*
* code.coding 1..*
* code.coding from OpenMRSOrderCodeVS
* result only Reference(OpenMRSObservation)
* status 1..1
* category 0..*
* encounter 0..1
* subject 0..1
* issued  0..1
* result  0..*

Instance: example-Openmrs-DiagnosticReport
InstanceOf: OpenMRSDiagnosticReport
Usage: #example
Title: "Openmrs DiagnosticReport"
Description: "Example OMRS DiagnosticReport Resource"
* identifier.id = "53fbd0ef-ae10-46a0-9d0a-387917a66d6e"
* identifier.use = #official
* identifier.extension.url = "http://fhir.openmrs.org/StructureDefinition/patient-identifier.diagnosticReport"
* identifier.extension.valueReference.reference = "Location/8d6c993e-c2cc-11de-8d13-0010c6dffd0f"
* identifier.extension.valueReference.type = "Location"
* identifier.extension.valueReference.display = "Inpatient Ward"
* code.coding[+].system = "http://loinc.org"
* code.coding[=].code = #8480-6
* subject = Reference("Patient/5946f880-b197-400b-9caa-a3c661d23041")
* encounter = Reference("Encounter/6519d653-393b-4118-9c83-a3715b82d4ac")
* result = Reference("Observation/6f16bb57-12bc-4077-9f49-ceaa9b928669")
* status = #preliminary

Mapping: DiagnosticReportMapping
Source: OpenMRSDiagnosticReport
Target: "http://hl7.org/fhir/3.0/StructureDefinition/DiagnosticReport"
Id: diagnosticReport-mapping
Title: "FHIR HL7 vs OMRS FHIR2"
Description: "Diagnostic Report resource that is part of the Diagnostic Medicine Module. A DiagnosticReport is used to represent the results of diagnostic tests that are performed in a given clinical context. "
* -> "OpenMRSDiagnosticReport" "This profile maps to Diagnostic Report in OMRS FHIR2"
* id -> "uuid"
* status -> "diagnosticReport.status"
* code -> "diagnosticReport.code"
* encounter -> "diagnosticReport.encounter"
