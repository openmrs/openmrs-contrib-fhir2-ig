Alias: TS = http://hl7.org/fhir/ValueSet/task-status
Alias: TI = http://hl7.org/fhir/ValueSet/task-intent
Alias: DS = http://hl7.org/fhir/diagnostic-report-status
Alias: LOINC = http://loinc.org

ValueSet:   OMRSPatientTaskStatusVS
Id: OpenMRS-task-status-vs
Title: "OpenMRS Status for Task"
Description:  "The state of the task, subset from https://www.hl7.org/FHIR/valueset-task-status.html"
* TS#task-status-requested "Requested"
* TS#task-status-rejected "Rejected"
* TS#task-status-accepted "Accepted"
* TS#task-status-completed "Completed"

ValueSet:   OMRSPatientTaskIntentVS
Id: OpenMRS-task-intent-vs
Title: "OpenMRS Intent for Task"
Description:  "The intent of the task, subset from https://www.hl7.org/FHIR/valueset-task-intent.html"
* TI#task-intent-order "Order"

ValueSet: OpenMRSOrderCodeVS
Id: OpenMRS-order-code-vs
Title: "OpenMRS Order Code"
Description: "The code for the openmrs requested in the EMR."
* include codes from system LOINC

ValueSet:   OpenMRSDiagnosis
Id: OpenMRS-diagnostic-report-status-vs
Title: "OpenMRS Diagnostic Report Status Flag"
Description:  "The status of the diagnostic report, subset from https://www.hl7.org/fhir/valueset-diagnostic-report-status.html"
* DS#diagnostic-report-status-partial "Partial"
* DS#diagnostic-report-status-final "Final"
* DS#diagnostic-report-status-unknown "Unknown"
* DS#diagnostic-report-status-canceled "Canceled"
* DS#diagnostic-report-status-amended "Amended"

