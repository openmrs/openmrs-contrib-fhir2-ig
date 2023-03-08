Profile: OpenMRSServiceRequest
Parent: ServiceRequest
Id: OpenMRS-service-request
Title: "OpenMRS Service Request"
Description: " Service Request Resource is represents a request for some type of procedure or diagnostic test to be performed. When fulfilled, the results of this request are represented as a DiagnosticReport resource with associated Observation resources"
* code 1..1
* code.coding 1..*
* code.coding from OpenMRSOrderCodeVS
* status 1..1
* intent 1..1
* subject 1..1
* subject only Reference(OMRSPatient)
* requester 1..1
* requester only Reference(OMRSPractitioner)
* performer 0..*
* performer only Reference(OMRSPatient)
* occurrence[x] 0..1
* basedOn 0..*
* basedOn only Reference(OpenMRSServiceRequest)
* replaces 0..* 
* replaces only Reference(OpenMRSServiceRequest)
* requisition 0..0
* category 0..0
* priority 0..0
* instantiatesCanonical 0..0
* instantiatesUri 0..0
* doNotPerform 0..0
* orderDetail 0..0
* quantity[x] 0..0
* asNeeded[x] 0..0
* authoredOn 0..0
* performerType 0..0
* locationCode 0..0
* locationReference 0..0
* reasonCode 0..0
* reasonReference 0..0
* insurance 0..0
* supportingInfo 0..0
* specimen 0..0
* bodySite 0..0
* note 0..0
* patientInstruction 0..0
* relevantHistory 0..0

// OpenMRS Service Request Resource

Instance: example-openmrs-ServiceRequest
InstanceOf: OpenMRSServiceRequest
Usage: #example
Title: "Openmrs serviceRequest"
Description: "Example OMRS Service Request Resource"
* code.coding[+].system = "http://snomed.info/sct"
* code.coding[=].code = #48023004
* status = #completed
* intent = #order
* subject = Reference(example-openmrs-Patient)
* occurrenceDateTime = "2014-08-16"
* requester = Reference(PractitionerExample)
* performer = Reference(example-openmrs-Patient)

Mapping: ServiceRequestMapping
Source: OpenMRSServiceRequest
Target: "http://hl7.org/fhir/3.0/StructureDefinition/serviceRequest"
Id: ServiceRequest-mapping
Title: "FHIR HL7 vs OMRS FHIR2"
Description: "ServiceRequest is used to represents a request for some type of procedure or diagnostic test to be performed. When fulfilled, the results of this request are represented as a DiagnosticReport resource with associated Observation resources."
* -> "OpenMRSServiceRequest" "This profile maps to Service Request in OMRS FHIR2"
* id -> "TestOrder.uuid"
* status -> "ServiceRequest.ServiceRequestStatus"
* code -> "TestOrder.concept"
* subject -> "TestOrder.patient"
* requester -> "ServiceRequest.requester"
* performer -> "Task.owner"
* occurrence[x] -> "TestOrder.effectiveStartDate"
* occurrence[x] -> "TestOrder.effectiveEndDate"

/** serviceRequest search parameters*/

Instance: serviceRequest-patient
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through serviceRequest endpoint by patient uuid"
* name = "serviceRequestPatientSearchParameter"
* status = #active
* description = "Searches for serviceRequest by a given patient Uuid eg) /ws/fhir2/{release}/ServiceRequest?patient={uuid}"
* code = #patient
* base[0] = #ServiceRequest
* target = #ServiceRequest
* type = #reference


Instance: serviceRequest-patient-identifier
InstanceOf: SearchParameter
Usage: #definition
Title: "Search serviceRequest endpoint by patient identifier id"
* name = "serviceRequestPatientIdentifierSearchParameter"
* status = #active
* description = "Searches for ServiceRequest by the patient identifier eg) /ws/fhir2/{release}/ServiceRequest?patient.identifier={identifier}"
* code = #patient.identifier
* base[0] = #ServiceRequest
* target = #ServiceRequest
* type = #token


Instance: serviceRequest-patient.given
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through serviceRequest endpoint by the patient's given name"
* name = "serviceRequestPatientGivenNameSearchParameter"
* status = #active
* description = "Searches for serviceRequest based on the patient's given name(s) eg) /ws/fhir2/{release}/ServiceRequest?patient.given={givenName}"
* code = #patient.given
* base[0] = #ServiceRequest
* target = #ServiceRequest
* type = #string

Instance: serviceRequest-patient.family
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through serviceRequest endpoint by the patient's family name"
* name = "serviceRequestPatientFamilyNameSearchParameter"
* status = #active
* description = "Searches for serviceRequest based on the patient's family name eg) /ws/fhir2/{release}/ServiceRequest?patient.family={familyName}"
* code = #patient.family
* base[0] = #ServiceRequest
* target = #ServiceRequest
* type = #string

Instance: serviceRequest-patient.name
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through serviceRequest endpoint by the patient's full or partial name"
* name = "serviceRequestPatientNameSearchParameter"
* status = #active
* description = "Searches for serviceRequest based on the patient's full or partial name eg) /ws/fhir2/{release}/ServiceRequest?patient.name={name}"
* code = #patient.name
* base[0] = #ServiceRequest
* target = #ServiceRequest
* type = #string

Instance: serviceRequest-subject
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through serviceRequest endpoint by subject uuid"
* name = "serviceRequestSubjectSearchParameter"
* status = #active
* description = "Searches for serviceRequest by a given subject eg) /ws/fhir2/{release}/ServiceRequest?subject:Patient={patientUuid}"
* code = #subject
* base[0] = #ServiceRequest
* target = #ServiceRequest
* type = #reference

Instance: serviceRequest-subject-identifier
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through serviceRequest endpoint by subject identifier"
* name = "serviceRequestSubjectIdentifierSearchParameter"
* status = #active
* description = "Searches for serviceRequest by the patient identifier eg) /ws/fhir2/{release}/ServiceRequest?subject:Patient.identifier={identifier}"
* code = #subject.identifier
* base[0] = #ServiceRequest
* target = #ServiceRequest
* type = #token

Instance: serviceRequest-subject-given
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through serviceRequest endpoint by subject given"
* name = "serviceRequestSubjectGivenSearchParameter"
* status = #active
* description = "Searches for serviceRequest based on the patient's given name(s) eg) /ws/fhir2/{release}/ServiceRequest?subject:Patient.given={givenName}"
* code = #subject.given
* base[0] = #ServiceRequest
* target = #ServiceRequest
* type = #string

Instance: serviceRequest-subject-family
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through serviceRequest endpoint by subject family"
* name = "serviceRequestSubjectfamilySearchParameter"
* status = #active
* description = "	Searches for serviceRequest based on the patient's family name eg) /ws/fhir2/{release}/ServiceRequest?subject:Patient.family={familyName}"
* code = #subject.family
* base[0] = #ServiceRequest
* target = #ServiceRequest
* type = #string

Instance: serviceRequest-subject-name
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through serviceRequest endpoint by subject name"
* name = "serviceRequestSubjectNameSearchParameter"
* status = #active
* description = "Searches for serviceRequest based on the patient's full or partial name eg) /ws/fhir2/{release}/ServiceRequest?subject:Patient.name={name}"
* code = #subject.name
* base[0] = #ServiceRequest
* target = #ServiceRequest
* type = #string

Instance: serviceRequest-code
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through serviceRequest endpoint by concept code"
* name = "serviceRequestCodeSearchParameter"
* status = #active
* description = "Searches for serviceRequest based on the serviceRequest concept code eg) /ws/fhir2/{release}/ServiceRequest?code={code}"
* code = #code
* base[0] = #ServiceRequest
* target = #ServiceRequest
* type = #token

Instance: serviceRequest-encounter
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through serviceRequest endpoint by encounter uuid"
* name = "serviceRequestEncounterSearchParameter"
* status = #active
* description = "Searches for serviceRequest based on the serviceRequest encounter Uuid eg) /ws/fhir2/{release}/ServiceRequest?encounter={uuid}"
* code = #code
* base[0] = #ServiceRequest
* target = #ServiceRequest
* type = #reference

Instance: serviceRequest-requester
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through serviceRequest endpoint by Practitioner uuid"
* name = "serviceRequestRequesterSearchParameter"
* status = #active
* description = "Searches for serviceRequest by Practitioner uuid who requested the service eg) /ws/fhir2/{release}/ServiceRequest?requester:Practitioner={uuid}"
* code = #requester
* base[0] = #ServiceRequest
* target = #ServiceRequest
* type = #reference

Instance: serviceRequest-requester-identifier
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through serviceRequest endpoint by Practitioner identifier"
* name = "serviceRequestRequesterIdentifierSearchParameter"
* status = #active
* description = "Searches for serviceRequest by the Practitioner identifier eg) /ws/fhir2/{release}/ServiceRequest?requester:Practitioner.identifier={identifier}"
* code = #requester.identifier
* base[0] = #ServiceRequest
* target = #ServiceRequest
* type = #token

Instance: serviceRequest-requester-given
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through serviceRequest endpoint by Practitioner given"
* name = "serviceRequestRequesterGivenSearchParameter"
* status = #active
* description = "Searches for serviceRequest based on the Practitioner's given name(s) eg) /ws/fhir2/{release}/ServiceRequest?requester:Practitioner.given={givenName}"
* code = #requester.given
* base[0] = #ServiceRequest
* target = #ServiceRequest
* type = #string

Instance: serviceRequest-requester-family
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through serviceRequest endpoint by Practitioner family"
* name = "serviceRequestRequesterfamilySearchParameter"
* status = #active
* description = "Searches for serviceRequest based on the Practitioner's family name eg) /ws/fhir2/{release}/ServiceRequest?requester:Practitioner.family={familyName}"
* code = #requester.family
* base[0] = #ServiceRequest
* target = #ServiceRequest
* type = #string

Instance: serviceRequest-requester-name
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through serviceRequest endpoint by Practitioner name"
* name = "serviceRequestRequesterNameSearchParameter"
* status = #active
* description = "Searches for serviceRequest based on the Practitioner's full or partial name eg) /ws/fhir2/{release}/ServiceRequest?requester:Practitioner.name={name}"
* code = #requester.name
* base[0] = #ServiceRequest
* target = #ServiceRequest
* type = #string

Instance: serviceRequest-occurrence
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through serviceRequest endpoint by Occurrence when service should occurance"
* name = "serviceRequestOccurrenceSearchParameter"
* status = #active
* description = "Searches for serviceRequest based on to occurrent date eg) /ws/fhir2/{release}/ServiceRequest?occurrence={date}"
* code = #occurrence
* base[0] = #ServiceRequest
* target = #ServiceRequest
* type = #date

Instance: serviceRequest-id
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through serviceRequest endpoint by service Uuid"
* name = "serviceRequestIdSearchParameter"
* status = #active
* description = "Searches for serviceRequest based on service Uuid eg) /ws/fhir2/{release}/ServiceRequest?_id={uuid}"
* code = #_id
* base[0] = #ServiceRequest
* target = #ServiceRequest
* type = #token

Instance: serviceRequest-lastUpdated
InstanceOf: SearchParameter
Usage: #definition
Title: "Search through serviceRequest endpoint by service lastUpdated field"
* name = "serviceRequestLastUpdatedSearchParameter"
* status = #active
* description = "Searches for serviceRequest based on service lastUpdated field eg) /openmrs/ws/fhir2/{release}/ServiceRequest?_lastUpdated={date}"
* code = #_lastUpdated
* base[0] = #ServiceRequest
* target = #ServiceRequest
* type = #date
