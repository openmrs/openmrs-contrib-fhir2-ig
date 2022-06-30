Instance: example-OpenMRS-patient
InstanceOf: OpenMRSPatient 
Usage: #example 
Description: "Example OpenMRS Patient"
Title:   "OpenMRS Patient"

* birthDate = "2004-08-12",
* identifier.id = "0b42f99b-776e-4388-8f6f-84357ae2a8fb"
* identifier.use = #official
* identifier.type.text = "Test Identifier Type"
* identifier.value = "4444-6"
* identifier.extension.url = "https://fhir.openmrs.org/StructureDefinition/OpenMRSLogicalModel/openmrs-patient-identifier-location"
* identifier.extension.valueReference.reference = "Location/92ab9667-4686-49af-8be8-65a4b58fc49c"
* identifier.extension.valueReference.type = "Location"
* identifier.extension.valueReference.display = "Unknown Location"
* gender = #male
* active = true
* name.family = "Adam"
* name.given = "John"
* deceasedBoolean =  false
* address.use = #home
