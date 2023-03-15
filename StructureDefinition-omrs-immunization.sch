<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile Immunization
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:Immunization</sch:title>
    <sch:rule context="f:Immunization">
      <sch:assert test="count(f:id) &gt;= 1">id: minimum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 0">identifier: maximum cardinality of 'identifier' is 0</sch:assert>
      <sch:assert test="count(f:statusReason) &lt;= 0">statusReason: maximum cardinality of 'statusReason' is 0</sch:assert>
      <sch:assert test="count(f:recorded) &lt;= 0">recorded: maximum cardinality of 'recorded' is 0</sch:assert>
      <sch:assert test="count(f:primarySource) &lt;= 0">primarySource: maximum cardinality of 'primarySource' is 0</sch:assert>
      <sch:assert test="count(f:reportOrigin) &lt;= 0">reportOrigin: maximum cardinality of 'reportOrigin' is 0</sch:assert>
      <sch:assert test="count(f:site) &lt;= 0">site: maximum cardinality of 'site' is 0</sch:assert>
      <sch:assert test="count(f:route) &lt;= 0">route: maximum cardinality of 'route' is 0</sch:assert>
      <sch:assert test="count(f:doseQuantity) &lt;= 0">doseQuantity: maximum cardinality of 'doseQuantity' is 0</sch:assert>
      <sch:assert test="count(f:note) &lt;= 0">note: maximum cardinality of 'note' is 0</sch:assert>
      <sch:assert test="count(f:reasonCode) &lt;= 0">reasonCode: maximum cardinality of 'reasonCode' is 0</sch:assert>
      <sch:assert test="count(f:reasonReference) &lt;= 0">reasonReference: maximum cardinality of 'reasonReference' is 0</sch:assert>
      <sch:assert test="count(f:isSubpotent) &lt;= 0">isSubpotent: maximum cardinality of 'isSubpotent' is 0</sch:assert>
      <sch:assert test="count(f:education) &lt;= 0">education: maximum cardinality of 'education' is 0</sch:assert>
      <sch:assert test="count(f:programEligibility) &lt;= 0">programEligibility: maximum cardinality of 'programEligibility' is 0</sch:assert>
      <sch:assert test="count(f:fundingSource) &lt;= 0">fundingSource: maximum cardinality of 'fundingSource' is 0</sch:assert>
      <sch:assert test="count(f:reaction) &lt;= 0">reaction: maximum cardinality of 'reaction' is 0</sch:assert>
      <sch:assert test="count(f:protocolApplied) &lt;= 1">protocolApplied: maximum cardinality of 'protocolApplied' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Immunization/f:performer</sch:title>
    <sch:rule context="f:Immunization/f:performer">
      <sch:assert test="count(f:function) &lt;= 0">function: maximum cardinality of 'function' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Immunization/f:protocolApplied</sch:title>
    <sch:rule context="f:Immunization/f:protocolApplied">
      <sch:assert test="count(f:seriesDoses[x]) &lt;= 0">seriesDoses[x]: maximum cardinality of 'seriesDoses[x]' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
