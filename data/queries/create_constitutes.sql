DROP TABLE IF EXISTS temp.voters;

CREATE TABLE temp.voters AS
SELECT * FROM demog.voters
WHERE st_within(demog.voters.location, 
	(SELECT geom
	FROM geom.districts
	WHERE geom.districts.id = 6));


DROP FUNCTION IF EXISTS createconstitutes();
CREATE FUNCTION createconstitutes()
RETURNS void
AS $$
DECLARE
	voter RECORD;
BEGIN
   FOR voter IN SELECT * FROM temp.voters LOOP
     INSERT INTO demog.constitutes(voter_id, district_id) VALUES (voter.id, 6);
   END LOOP;
 END;
$$ LANGUAGE plpgsql;


select createconstitutes();