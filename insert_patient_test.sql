\set pt1 `cat fixtures/pt2.json`
\set cfg '{"base":"https://test.me"}'
\set pt_tags '[{"scheme": "http://pt.com", "term": "http://pt/vip", "label":"pt"}]'

select fhir_create(:'cfg', 'Patient', :'pt1', :'pt_tags'::jsonb);

