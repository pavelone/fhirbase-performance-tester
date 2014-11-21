select fhir_search(('{"base":"https://test.me"}')::jsonb, 'Patient', 'name="given1791"');
select fhir_search(('{"base":"https://test.me"}')::jsonb, 'Patient', 'name="given120291"');
select fhir_search(('{"base":"https://test.me"}')::jsonb, 'Patient', 'name="given11535"');
select fhir_search(('{"base":"https://test.me"}')::jsonb, 'Patient', 'name="given14873"');
select fhir_search(('{"base":"https://test.me"}')::jsonb, 'Patient', 'name="given17925"');
