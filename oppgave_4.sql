/* Oppgave 4 */
UPDATE stjerne
SET masse = masse * 0.45
WHERE oppdaget < 1990 AND stjerne.oid = (SELECT oid FROM observator WHERE navn = 'BESS');
