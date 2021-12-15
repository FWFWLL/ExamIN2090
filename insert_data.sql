DROP TABLE IF EXISTS observator CASCADE;
DROP TABLE IF EXISTS stjerne CASCADE;
DROP TABLE IF EXISTS planet CASCADE;
DROP TABLE IF EXISTS måne CASCADE;

CREATE TABLE observator (
	oid int PRIMARY KEY,
	type text NOT NULL,
	navn text NOT NULL
);

CREATE TABLE stjerne (
	sid int PRIMARY KEY,
	navn text NOT NULL UNIQUE,
	masse float NOT NULL,
	lysstyrke float,
	oppdaget int,
	oid int REFERENCES observator(oid)
);

CREATE TABLE planet (
	pid int PRIMARY KEY,
	navn text NOT NULL UNIQUE,
	masse float NOT NULL,
	sid int REFERENCES stjerne(sid),
	oppdaget int,
	oid int REFERENCES observator(oid)
);

CREATE TABLE måne (
	mid int PRIMARY KEY,
	navn text NOT NULL UNIQUE,
	masse float NOT NULL,
	pid int REFERENCES planet(pid),
	oppdaget int,
	oid int REFERENCES observator(oid)
);

INSERT INTO observator(oid, type, navn)
VALUES
	(1, 'observatorie', 'Palomar Observatory'),
	(2, 'satellitt', 'Infrared Astronomical Satellite'),
	(3, 'observatorie', 'La Silla Observatory'),
	(4, 'person', 'Sir Isaac Newton'),
	(5, 'observatorie','Girawali Observatory'),
	(6, 'person', 'Johann Galle et al.'),
	(7, 'person', 'Gallileo Gallilei'),
	(8, 'observatorie', 'Helsinki University Observatory'),
	(9, 'satellitt', 'Astron'),
	(10, 'observatorie', 'BESS'),
	(11, 'satellitt', 'Infrared Space Observatory'),
	(12, 'person', 'Walter Sidney Adams'),
	(13, 'person', 'John William Draper'),
	(14, 'person', 'William Lassell');

INSERT INTO stjerne(sid, navn, masse, lysstyrke, oppdaget, oid)
VALUES
	(1, 'Sun', 198.9, 1, NULL, NULL),
	(2, 'Vega', 424.6, 40.12, 1900, 13),
	(3, 'Sirius a', 398.1, 25.4, NULL, NULL),
	(4, 'STR 002', 218.6, 11.4, 1912, 9),
	(5, 'STR 312', 98.1, 0.56, 2018, 2),
	(6, 'Sirius b', 412.6, 25.4, 1915, 12),
	(7, 'STR 987', 123.4, 2.7, 2001, 8),
	(8, 'LHS 1723', 33.91245, 0.00365, 1982, 1),
	(9, 'STR 045', 619.5, 70.5, 1701, 4);

INSERT INTO planet(pid, navn, masse, sid, oppdaget, oid)
VALUES 
	(1, 'STR 002 a', 0.314, 4, 1981, 9),
	(2, 'Tellus', 0.597, 1, NULL, NULL),
	(3, 'LHS 1723 a', 1.20594, 8, 2017, 3),
	(4, 'Vega b', 13.0743, 2, 2012, 2),
	(5, 'LHS 1723 b', 1.37907, 8, 2017, 3),
	(6, 'Jupiter', 189.249, 1, NULL, NULL),
	(7, 'STR 045 c', 0.717, 9, 2006, 10),
	(8, 'Neptune', 9.928113, 1, 1846, 6);

INSERT INTO måne(mid, navn, masse, pid, oppdaget, oid)
VALUES
	(1, 'Moon', 0.007343, 2, NULL, NULL),
	(2, 'Europa', 0.004776, 6, 1610, 7),
	(3, 'MN 322', 0.000597, 1, 2020, 11),
	(4, 'Triton', 0.002388, 8, 1846, 14),
	(5, 'STR 045 c1', 0.001791, 7, 2019, 5),
	(6, 'LHS1723 b3', 0.005373, 5, 2020, 5);
