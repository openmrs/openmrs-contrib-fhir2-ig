Instance: OpenMRSLogicalModel
InstanceOf: StructureDefinition
Description: "OpenMRS Communication Logical Model"
Title: "OpenMRS Logical Model" // user-friendly name
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
* mapping[=].name = "OpenMRS RefApp 2.9"
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

