<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile Task
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:Task</sch:title>
    <sch:rule context="f:Task">
      <sch:assert test="count(f:id) &gt;= 1">id: minimum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:instantiatesCanonical) &lt;= 0">instantiatesCanonical: maximum cardinality of 'instantiatesCanonical' is 0</sch:assert>
      <sch:assert test="count(f:instantiatesUri) &lt;= 0">instantiatesUri: maximum cardinality of 'instantiatesUri' is 0</sch:assert>
      <sch:assert test="count(f:basedOn) &gt;= 1">basedOn: minimum cardinality of 'basedOn' is 1</sch:assert>
      <sch:assert test="count(f:groupIdentifier) &lt;= 0">groupIdentifier: maximum cardinality of 'groupIdentifier' is 0</sch:assert>
      <sch:assert test="count(f:partOf) &lt;= 0">partOf: maximum cardinality of 'partOf' is 0</sch:assert>
      <sch:assert test="count(f:statusReason) &lt;= 0">statusReason: maximum cardinality of 'statusReason' is 0</sch:assert>
      <sch:assert test="count(f:businessStatus) &lt;= 0">businessStatus: maximum cardinality of 'businessStatus' is 0</sch:assert>
      <sch:assert test="count(f:priority) &lt;= 0">priority: maximum cardinality of 'priority' is 0</sch:assert>
      <sch:assert test="count(f:code) &lt;= 0">code: maximum cardinality of 'code' is 0</sch:assert>
      <sch:assert test="count(f:description) &lt;= 0">description: maximum cardinality of 'description' is 0</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 0">focus: maximum cardinality of 'focus' is 0</sch:assert>
      <sch:assert test="count(f:executionPeriod) &lt;= 0">executionPeriod: maximum cardinality of 'executionPeriod' is 0</sch:assert>
      <sch:assert test="count(f:authoredOn) &gt;= 1">authoredOn: minimum cardinality of 'authoredOn' is 1</sch:assert>
      <sch:assert test="count(f:requester) &lt;= 0">requester: maximum cardinality of 'requester' is 0</sch:assert>
      <sch:assert test="count(f:performerType) &lt;= 0">performerType: maximum cardinality of 'performerType' is 0</sch:assert>
      <sch:assert test="count(f:location) &lt;= 0">location: maximum cardinality of 'location' is 0</sch:assert>
      <sch:assert test="count(f:reasonCode) &lt;= 0">reasonCode: maximum cardinality of 'reasonCode' is 0</sch:assert>
      <sch:assert test="count(f:reasonReference) &lt;= 0">reasonReference: maximum cardinality of 'reasonReference' is 0</sch:assert>
      <sch:assert test="count(f:insurance) &lt;= 0">insurance: maximum cardinality of 'insurance' is 0</sch:assert>
      <sch:assert test="count(f:note) &lt;= 0">note: maximum cardinality of 'note' is 0</sch:assert>
      <sch:assert test="count(f:relevantHistory) &lt;= 0">relevantHistory: maximum cardinality of 'relevantHistory' is 0</sch:assert>
      <sch:assert test="count(f:restriction) &lt;= 0">restriction: maximum cardinality of 'restriction' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
