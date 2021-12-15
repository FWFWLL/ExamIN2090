/* Oppgave 3 */
WITH tellus (sid) AS (
	SELECT sid
 	FROM planet
	WHERE navn = 'Tellus')
SELECT navn, masse
FROM planet AS p, tellus
WHERE p.sid = tellus.sid;
