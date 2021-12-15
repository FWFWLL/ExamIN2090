/* Oppgave 5 */
DROP VIEW IF EXISTS universet;
CREATE VIEW universet AS
WITH counts_and_masses AS (
	SELECT COUNT(*) AS counts, SUM(masse) AS masses  FROM stjerne
	UNION ALL
	SELECT COUNT(*), SUM(masse) FROM planet
	UNION ALL
	SELECT COUNT(*), SUM(masse) FROM måne)
SELECT SUM(cm.counts) AS antall, SUM(cm.masses) AS masse
FROM counts_and_masses AS cm;
