Instance: OMRSLogicalModel
InstanceOf: StructureDefinition
Description: "OpenMRS Communication Logical Model"
Title: "OMRS Logical Model" // user-friendly name
Usage: #definition

* insert PublisherContextInstance
* name = "OpenMRSLogicalModel" // computer ready name
* url = "https://fhir.openmrs.org/StructureDefinition/OpenMRSLogicalModel"
* version = "0.1.0"
* kind = #logical
* abstract = false
* type = "OpenMRSLogicalModel"
* baseDefinition = "http://hl7.org/fhir/StructureDefinition/Element"
* derivation = #specialization

// Systems To Map
* mapping[+].identity = "OpenMRS"
* mapping[=].name = "OpenMRS RefApp 2.12.0"
* mapping[+].identity = "FHIR-R4"
* mapping[=].name = "FHIR Release 4"

/**
    Definitions & Mappings
*/ 

* differential.element[+].id = "OpenMRSLogicalModel"
* differential.element[=].path = "OpenMRSLogicalModel"
* differential.element[=].definition = "OpenMRSLogicalModel"
* differential.element[=].min = 0
* differential.element[=].max = "*"
* differential.element[=].mapping[+].identity = "OpenMRS"
* differential.element[=].mapping[=].map = "OpenMRS Data Model"
* differential.element[=].mapping[+].identity = "FHIR-R4"
* differential.element[=].mapping[=].map = "FHIR-R4 Mappings"

/**
 Patient
*/
* differential.element[+].id = "Patient"
* differential.element[=].path = "OpenMRSLogicalModel.Patient"
* differential.element[=].short = "Openmrs Patient Logical Model"
* differential.element[=].definition = "Logical model of OpenMRS Patient"
* differential.element[=].type.code = #BackboneElement
* differential.element[=].min = 0
* differential.element[=].max = "1"
* differential.element[=].mapping[+].identity = "OpenMRS"
* differential.element[=].mapping[=].map = "Patient"
* differential.element[=].mapping[+].identity = "FHIR-R4"
* differential.element[=].mapping[=].map = "OpenMRSPatient"

//Patient.id
* differential.element[+].id = "Patient.Id"
* differential.element[=].path = "OpenmrsLogicalModel.Patient.Id"
* differential.element[=].short = "Patient Logical ID"
* differential.element[=].definition = "Patient Logical ID"
* differential.element[=].type.code = #id
* differential.element[=].min = 1
* differential.element[=].max = "1"
* differential.element[=].mapping[+].identity = "OpenMRS"
* differential.element[=].mapping[=].map = "Patient.uuid"
* differential.element[=].mapping[+].identity = "FHIR-R4"
* differential.element[=].mapping[=].map = "Patient.id

/*
* Patient.identifier
*/
* differential.element[+].id = "Patient.Identifier"
* differential.element[=].path = "OpenMRSLogicalModel.Patient.Identifier"
* differential.element[=].short = "An identifier for this patient."
* differential.element[=].definition = "Patient Identifier"
* differential.element[=].type.code = #Identifier
* differential.element[=].min = 0
* differential.element[=].max = "1"
* differential.element[=].mapping[+].identity = "OpenMRS"
* differential.element[=].mapping[=].map = "Patient.activeIdentifiers"
* differential.element[=].mapping[+].identity = "FHIR-R4"
* differential.element[=].mapping[=].map = "OpenMRSPatient.identifier"

//Patient.Name
* differential.element[+].id = "Patient.Name"
* differential.element[=].path = "OpenMRSLogicalModel.Patient.Name"
* differential.element[=].short = "Patient Name"
* differential.element[=].definition = "Patient Name"
* differential.element[=].type.code = #HumanName
* differential.element[=].min = 0
* differential.element[=].max = "*"
* differential.element[=].mapping[+].identity = "OpenMRS"
* differential.element[=].mapping[=].map = "Patient.name"
* differential.element[=].mapping[+].identity = "FHIR-R4"
* differential.element[=].mapping[=].map = "Patient.name"

//Patient.Contact
* differential.element[+].id = "Patient.Contact"
* differential.element[=].path = "OpenMRSogicalModel.Patient.Contact"
* differential.element[=].short = "Patient Contact"
* differential.element[=].definition = "Patient Contact"
* differential.element[=].type.code =  #ContactPoint
* differential.element[=].min = 0
* differential.element[=].max = "*"
* differential.element[=].mapping[+].identity = "OpenMRS"
* differential.element[=].mapping[=].map = "Person.personAttribute"
* differential.element[=].mapping[+].identity = "FHIR-R4"
* differential.element[=].mapping[=].map = "OpenmrsPerson.telecom (phone)"

//Patient.Gender
* differential.element[+].id = "Patient.Gender"
* differential.element[=].path = "OpenMRSLogicalModel.Patient.Gender"
* differential.element[=].short = "Patient Gender"
* differential.element[=].definition = "Patient Gender"
* differential.element[=].type.code =  #code
* differential.element[=].min = 1
* differential.element[=].max = "1"
* differential.element[=].mapping[+].identity = "OpenMRS"
* differential.element[=].mapping[=].map = "Patient.gender"
* differential.element[=].mapping[+].identity = "FHIR-R4"
* differential.element[=].mapping[=].map = "openMRSPatient.gender"

//Patient.BirthDate
* differential.element[+].id = "Patient.BirthDate"
* differential.element[=].path = "OpenMRSLogicalModel.Patient.BirthDate"
* differential.element[=].short = "Patient Date of Birth"
* differential.element[=].definition = "Patient Date of Birth"
* differential.element[=].type.code =  #date
* differential.element[=].min = 0
* differential.element[=].max = "1"
* differential.element[=].mapping[+].identity = "OpenMRS"
* differential.element[=].mapping[=].map = "Patient.birthdate"
* differential.element[=].mapping[+].identity = "FHIR-R4"
* differential.element[=].mapping[=].map = "OpenMRSPatient.birthDate"

//Patient.Address
* differential.element[+].id = "Patient.Address"
* differential.element[=].path = "OpenMRSLogicalModel.Patient.Address"
* differential.element[=].short = "Patient Address"
* differential.element[=].definition = "Patient Address"
* differential.element[=].type.code =  #Address
* differential.element[=].min = 0
* differential.element[=].max = "*"
* differential.element[=].mapping[+].identity = "OpenMRS"
* differential.element[=].mapping[=].map = "Patient.addresses"
* differential.element[=].mapping[+].identity = "FHIR-R4"
* differential.element[=].mapping[=].map = "OpenMRSPatient.address"

//Patient.DeathDate
* differential.element[+].id = "Patient.DeceasedDateTime"
* differential.element[=].path = "OpenMRSLogicalModel.Patient.DeceasedDateTime"
* differential.element[=].short = "Patient Death Date"
* differential.element[=].definition = "Patient Death Date"
* differential.element[=].type.code =   #date
* differential.element[=].min = 0
* differential.element[=].max = "1"
* differential.element[=].mapping[+].identity = "OpenMRS"
* differential.element[=].mapping[=].map = "Patient.deathDate or Patient.dead"
* differential.element[=].mapping[+].identity = "FHIR-R4"
* differential.element[=].mapping[=].map = "OpenMRSPatient.deceased"

//Patient.Active
* differential.element[+].id = "Patient.Active"
* differential.element[=].path = "OpenMRSLogicalModel.Patient.Active"
* differential.element[=].short = "Patient Active Flag"
* differential.element[=].definition = "Flag for distinguishing between active and not active Patients"
* differential.element[=].type.code = #boolean
* differential.element[=].binding.valueSet = TODO
* differential.element[=].binding.strength = #extensible
* differential.element[=].min = 0
* differential.element[=].max = "1"
* differential.element[=].mapping[+].identity = "OpenMRS"
* differential.element[=].mapping[=].map = "not Patient.voided"
* differential.element[=].mapping[+].identity = "FHIR-R4"
* differential.element[=].mapping[=].map = "OpenMRSPatient.active"


