/** OMRS Group resource  profile*/

Profile: OMRSGroup
Parent: Group
Id: omrs-group
Title: "OMRS Group"
Description: "A Group Resource is described as Cohort in Fhir2 OMRS"
* identifier 1..1
* name 1..1
* active 1..1
* type 1..1
* actual 1..1
* quantity 1..1
* managingEntity 0..1
* managingEntity only Reference(OMRSPractitioner)
* characteristic 0..0
* member 0..*


/** example group resource */
Instance: OMRSGroupExample
InstanceOf: OMRSGroup
Usage: #example
Title: "OMRS Group Example"
Description: "OMRS Group Resource Example"
* identifier.id = "da66e7d9-f95f-4efe-a32f-e3dff5fc1d46"
* active = true
* actual = true
* name = "male cohort"
* type = #person
* quantity = 0
* managingEntity = Reference(PractitionerExample)
* managingEntity.type = "Practitioner"
* managingEntity.display = "Super User"
* extension[0].url = "http://fhir.openmrs.org/ext/group/description"
* extension[0].valueString = "Male Patients years that are alive"