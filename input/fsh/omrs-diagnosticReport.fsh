Profile: OpenMRSDiagnosticReport
Parent: DiagnosticReport
Id: OpenMRS-diagnostic-report
Title: "OpenMRS Diagnostic Report"
Description: "DiagnosticReport resource created by a OpenMRS that representing results of diagnostic tests that are performed in a given clinical context."
* code.coding 1..*
* code.coding from OpenMRSOrderCodeVS
* result only Reference(OpenMRSObservation)
