Profile: OpenMRSTask
Parent: Task
Id: OpenMRS-task
Title: "OpenMRS Task"
Description: "A Task resource represent an activity that is to be performed,and track the completion of said activity between an OpenMRS and a FHIR2"
* id 1..1 
* basedOn 1..*
* basedOn only Reference(OpenMRSServiceRequest)
* for 0..1
* for only Reference(OMRSPatient)
* authoredOn 1..1
* status 1..1
* status from OMRSPatientTaskStatusVS
* intent 1..1
* intent from OMRSPatientTaskIntentVS
* lastModified 0..1
* output 0..* 
* input 0..*
* encounter 0..1
* encounter only Reference(OMRSEncounter)
* owner 0..1
* owner only Reference(Organization)


// OpenMRS Task  Example
Instance: example-openmrs-Task
InstanceOf: OpenMRSTask
Usage: #example
Title: "Openmrs Task"
Description: "Example OMRS Task Resource"
* id = "e8f8d71a-6c14-4105-b6fe-30f3cf6b7dc9"
* status = #completed
* basedOn = Reference(example-openmrs-ServiceRequest)
* intent = #order
* for = Reference(example-openmrs-Patient)
* authoredOn =  "2021-02-20"
* lastModified = "2021-02-21"
* owner.reference = "Organization/1832473e-2fe0-452d-abe9-3cdb9879522f"
* owner.display = "Clinical Laboratory @ Acme Hospital"
* encounter = Reference(EncounterExample)

/** Mapping Task hl7 fhir vs OMRS Fhir2 **/

Mapping: TaskMapping
Source: OpenMRSTask
Target: "http://hl7.org/fhir/3.0/StructureDefinition/Task"
Id: task-mapping
Title: "FHIR HL7 vs OMRS FHIR2"
Description: "Task is used to represent an activity that is to be performed,and track the completion of said activity."
* -> "OpenMRSTask" "This profile maps to Task in OMRS FHIR2"
* id -> "uuid"
* status -> "FhirTask.status"
* intent -> "FhirTask.intent"
* basedOn -> "FhirTask.basedOn" "Collection<FhirReference>"
* encounter -> "FhirTask.encounter"
* for -> "FhirTask.for"
* owner -> "FhirTask.owner"
* input -> "FhirTask.input" "Collection<FhirTaskInput>"
* output -> "FhirTask.output" "Collection<FhirTaskOutput>"
* authoredOn -> "FhirTask.dateCreated"
* lastModified -> "FhirTask.dateChanged"

/** OMRS Task search parameters **/

Instance: Task-basedOn
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through FhirTask endpoint by the ServiceRequest Reference uuid"
* name = "TaskBasedOnSearchParameter"
* status = #active
* description = "Searches for FhirTask based on the ServiceRequest Reference eg) /ws/fhir2/{release}/Task?based-on={ServiceRequestUuid}"
* code = #Task.based-on
* base[0] = #Task
* target = #Task
* type = #reference 

Instance: Task-owner
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through FhirTask endpoint by the Organization Reference uuid"
* name = "TaskOwnerSearchParameter"
* status = #active
* description = "Searches for FhirTask based on the Organization Reference eg) /ws/fhir2/{release}/Task?owner={uuid}"
* code = #Task.owner
* base[0] = #Task
* target = #Task
* type = #reference 

Instance: Task-status
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through FhirTask endpoint by FhirTask status in the current state"
* name = "TaskStatueSearchParameter"
* status = #active
* description = "Searches for FhirTask based on the FhirTask status eg) /ws/fhir2/{release}/Task?status={codeable concept}"
* code = #Task.status
* base[0] = #Task
* target = #Task
* type = #token 

Instance: Task-id
InstanceOf: SearchParameter
Usage: #definition
Title: "Search in Task endpoint basing on Task uuid attribute"
* name = "TaskIdSearchParameter"
* status = #active
* description = "Searches based on the Task uuid field for the Task record eg) /ws/fhir2/{release}}/Task?_id={uuid}"
* code = #_id
* base[0] = #Task
* target = #Task 
* type = #token

Instance: Task-lastUpdated
InstanceOf: SearchParameter
Usage: #definition
Title: "Search in Task endpoint basing on Task lastUpdated attribute"
* name = "TaskLastUpdatedSearchParameter"
* status = #active
* description = "Searches based on the Task lastUpdated field for the Task record eg) /ws/fhir2/{release}/Task?_lastUpdated={date}"
* code = #_lastUpdated
* base[0] = #Task
* target = #Task 
* type = #date