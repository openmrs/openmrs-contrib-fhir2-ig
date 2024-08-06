FHIR (Fast Healthcare Interoperability Resources) is an HL7 standard for representing healthcare information electronically.
It is based on a series of Resources, which define common representations for different kinds of healthcare data. You can
find the current version of the FHIR specification
at [https://www.hl7.org/fhir/index.html](https://www.hl7.org/fhir/index.html).

### Summary <a name="summary"/>

OpenMRS has recently undertaken a commitment to implement FHIR in order to ensure better interoperability between healthcare
systems. The
[Openmrs FHIR2 module](https://github.com/openmrs/openmrs-module-fhir2) was developed as part of these efforts. Currently,
the FHIR module supports the export of the following FHIR Resources

1. [Patient](https://fhir.openmrs.org/StructureDefinition-omrs-patient.html)
2. [Person](https://fhir.openmrs.org/StructureDefinition-omrs-person.html)
3. [practitioner](https://fhir.openmrs.org/StructureDefinition-omrs-practitioner.html)
4. [Observation](https://fhir.openmrs.org/StructureDefinition-OpenMRS-observation.html)
5. [Location](https://fhir.openmrs.org/StructureDefinition-omrs-location.html)
6. [AllergyIntolerance](https://fhir.openmrs.org/StructureDefinition-omrs-AllergyIntolerance.html)
7. [Condition](https://fhir.openmrs.org/StructureDefinition-omrs-Condition.html)
8. [DiagnosticReport](https://fhir.openmrs.org/StructureDefinition-OpenMRS-diagnostic-report.html)
9. [Encounter](https://fhir.openmrs.org/StructureDefinition-omrs-encounter.html)
10. [Medication](https://fhir.openmrs.org/StructureDefinition-omrs-medication.html)
11. [MedicationRequest](https://fhir.openmrs.org/StructureDefinition-omrs-medication-request.html)
12. [MedicationDispense](https://fhir.openmrs.org/StructureDefinition-omrsmedication-dispense.html)
13. [ServiceRequest](https://fhir.openmrs.org/StructureDefinition-OpenMRS-service-request.html)
14. [Task](https://fhir.openmrs.org/StructureDefinition-OpenMRS-task.html)
15. [Group](https://fhir.openmrs.org/StructureDefinition-omrs-group.html)
16. [Immunization](https://fhir.openmrs.org/StructureDefinition-omrs-immunization.html)
17. [RelatedPerson](https://fhir.openmrs.org/StructureDefinition-omrs-related-person.html)

### About This Implementation Guide <a name="about"/>
The top menu allows quick navigation to the different sections, and a Table of Contents is provided with the entire content of this Implementation Guide.

### Intellectual Property Considerations <a name="ip"/>
While this implementation guide and the underlying FHIR are licensed as public domain, this guide may include examples making use of terminologies such as LOINC, SNOMED CT and others which have more restrictive licensing requirements. Implementers should make themselves familiar with licensing and any other constraints of terminologies, questionnaires, and other components used as part of their implementation process. In some cases, licensing requirements may limit the systems that data captured using certain questionnaires may be shared with.

### Disclaimer
This specification is provided without warranty of completeness or consistency, and the official publication supersedes this draft. No liability can be inferred from the use or misuse of this specification, or its consequences.

### Credits and Acknowledgements
This specification is based on FHIR and the FHIR tooling ecosystem and community processes. It has been defined with the support and participation of the following institutions:
1. Google Season of Docs
2. OpenMRS Inc
3. HL7

### Want to Contribute to Our FHIR IG?
We love hearing from new people, and the only way this FHIR IG can continue to be reliable is if many people help us keep it up-to-date! Please consider sharing your suggestions through a PR on GitHub here: https://github.com/openmrs/openmrs-contrib-fhir2-ig/
