/** OMRS Group resource  profile*/

Profile: OMRSGroup
Parent: Group
Id: omrs-group
Title: "OMRS Group"
Description: "A Group Resource is described as Cohort in Fhir2 OMRS"
* identifier 0..0
* name 1..1
* active 1..1
* type 1..1
* actual 1..1
* quantity 0..1
* managingEntity 0..1
* managingEntity only Reference(OMRSPractitioner)
* characteristic 0..0
* member 0..*
* extension contains OMRSGroupDescriptionExtension named description 1..1


/*Extension*/

Extension: OMRSGroupDescriptionExtension 
Id: omrs-group-description-ext
Title: "Group descriptive extension"
Description: "Extension for group description"
* ^context[0].type = #element
* ^context[0].expression = "Group Description"
* extension contains description 1..1 and url 1..1
* extension[description].value[x] only string 
* extension[url].value[x] only string 


/** example group resource */
Instance: OMRSGroupExample
InstanceOf: OMRSGroup
Usage: #example
Title: "OMRS Group Example"
Description: "OMRS Group Resource Example"
* active = true
* actual = true
* name = "male cohort"
* type = #person
* quantity = 10
* managingEntity = Reference(PractitionerExample)
* managingEntity.type = "Practitioner"
* managingEntity.display = "Super User"
* extension[0].url = "http://fhir.openmrs.org/ext/group/description"
* extension[0].valueString = "Male Patients years that are alive"



//OMRS FHIR2 Group Mapping VS HL7 fhir

Mapping: OMRSGroupMapping
Source: OMRSGroup
Target: "http://hl7.org/fhir/3.0/StructureDefinition/Group"
Id: omrs-group-mapping
Title: "FHIR HL7 vs OMRS FHIR2"
Description: "Mapping of Group Resource between HL7 FHIR vs OMRS Fhir2 module"
* -> "OMRS Group" "This profile maps to Group in OMRS Fhir2"
* id -> "id"
* active -> "Cohort.voided"
* name -> "Cohort.name"
* type -> "Group.GroupType"
* managingEntity -> "Cohort.creator"


/** OMRS fhir2 Group Search Paramenters **/

Instance: group-Search-entity-paramenter
InstanceOf: SearchParameter
Usage: #definition
Title: "Search in group endpoint using Managing entity Reference"
* status = #active
* code = #reference
* name = "GroupManagingEnityReference"
* description = "Search for a group  basing on managing entity Reference(Practitioner)"
* base[0] = #Group
* type = #reference
* expression = "Group.member.entity"
