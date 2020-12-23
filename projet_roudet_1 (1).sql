-- DROP FK
ALTER TABLE cellule
DROP CONSTRAINT fk_idSilo;
ALTER TABLE sonde
DROP CONSTRAINT fk_idCellule;
ALTER TABLE accident
DROP CONSTRAINT fk_idSonde;
ALTER TABLE accident
DROP CONSTRAINT fk_idCapteur;
ALTER TABLE op
DROP CONSTRAINT fk_idPersonnel;
ALTER TABLE op
DROP CONSTRAINT fk_numLot;
ALTER TABLE capteur 
DROP CONSTRAINT fk_idConvoyeur;

-- DROP SEQ

DROP SEQUENCE numLot_seq;
DROP SEQUENCE op_seq;
DROP SEQUENCE accident_seq;


-- DROP BOOL
ALTER TABLE cellule
DROP CONSTRAINT b_pleinCellule;
ALTER TABLE camion
DROP CONSTRAINT b_pleinCamion;
ALTER TABLE convoyeur
DROP CONSTRAINT b_marche;
ALTER TABLE convoyeur
DROP CONSTRAINT b_actionConvoyeur;
ALTER TABLE camion
DROP CONSTRAINT b_actionCamion;


-- DROP TABLE
DROP TABLE silo;
DROP TABLE cellule;
DROP TABLE sonde;
DROP TABLE accident;
DROP TABLE capteur;
DROP TABLE lotCereale;
DROP TABLE camion;
DROP TABLE op;
DROP TABLE personnel;
DROP TABLE convoyeur;

--CREATE TABLE
CREATE TABLE silo(
idSilo INT,
nbCellules INT
);

CREATE TABLE cellule(
idCellule INT,
nbSondes INT,
temperature FLOAT,
capacite FLOAT,
typeCereale VARCHAR(50),
plein INT,
idSilo INT
);

CREATE TABLE sonde(
idSonde INT,
idCellule INT
);

CREATE TABLE accident(
idAccident INT,
libelle VARCHAR(50),
source VARCHAR(50),
description VARCHAR(50),
dateAccident DATE,
idSonde INT,
idCapteur INT
);

CREATE TABLE capteur(
idCapteur INT,
idCellule INT,
plaque VARCHAR(11),
numLot INT
);

CREATE TABLE camion(
plaque VARCHAR(11),
plein INT,
typeCereale VARCHAR(50),
quantite FLOAT,
destination VARCHAR(50),
action INT
);

CREATE TABLE lotCereale(
numLot INT,
type VARCHAR(50),
poids FLOAT,
tauxHumidite FLOAT,
qualite INT,
origine VARCHAR(50),
dateArrivee DATE
);

CREATE TABLE op(
idOperation INT,
nom VARCHAR(50),
idPersonnel INT,
numLot INT
);

CREATE TABLE personnel(
idPersonnel INT,
nom VARCHAR(50),
prenom VARCHAR(50),
adresse VARCHAR(50),
poste VARCHAR(50)
);

CREATE TABLE convoyeur(
nomConvoyeur VARCHAR(50),
vitesse FLOAT,
marche INT,
action INT,
plaque VARCHAR(11),
numLot INT,
idCellule INT
);

--PK
ALTER TABLE silo
ADD CONSTRAINT pk_silo PRIMARY KEY (idSilo);

ALTER TABLE personnel
ADD CONSTRAINT pk_personnel PRIMARY KEY (idPersonnel);

ALTER TABLE cellule
ADD CONSTRAINT pk_cellule PRIMARY KEY (idCellule);

ALTER TABLE op
ADD CONSTRAINT pk_op PRIMARY KEY (idOperation);

ALTER TABLE lotCereale
ADD CONSTRAINT pk_cereale PRIMARY KEY (numLot);

ALTER TABLE camion
ADD CONSTRAINT pk_camion PRIMARY KEY (plaque);

ALTER TABLE capteur
ADD CONSTRAINT pk_capteur PRIMARY KEY (idCapteur);

ALTER TABLE accident
ADD CONSTRAINT pk_accident PRIMARY KEY (idAccident);

ALTER TABLE sonde
ADD CONSTRAINT pk_sonde PRIMARY KEY (idSonde);

ALTER TABLE convoyeur
ADD CONSTRAINT pk_convoyeur PRIMARY KEY (numLot,idCellule,plaque);

--FK

ALTER TABLE cellule 
ADD CONSTRAINT fk_idSilo FOREIGN KEY (idSilo) REFERENCES silo(idSilo);

ALTER TABLE op
ADD CONSTRAINT fk_idPersonnel FOREIGN KEY (idPersonnel) REFERENCES personnel(idPersonnel);

ALTER TABLE op
ADD CONSTRAINT fk_numLot FOREIGN KEY (numLot) REFERENCES lotCereale(numLot);

ALTER TABLE accident 
ADD CONSTRAINT fk_idSonde FOREIGN KEY (idSonde) REFERENCES sonde(idSonde);

ALTER TABLE accident 
ADD CONSTRAINT fk_idCapteur FOREIGN KEY (idCapteur) REFERENCES capteur(idCapteur);

ALTER TABLE sonde 
ADD CONSTRAINT fk_idCellule FOREIGN KEY (idCellule) REFERENCES cellule(idCellule);

ALTER TABLE capteur 
ADD CONSTRAINT fk_idConvoyeur FOREIGN KEY (numLot,idCellule,plaque) REFERENCES convoyeur(numLot,idCellule,plaque);

--boolean

ALTER TABLE cellule 
ADD CONSTRAINT b_pleinCellule CHECK (plein IN (0,1));

ALTER TABLE camion
ADD CONSTRAINT b_actionCamion CHECK (action IN (0,1));

ALTER TABLE camion
ADD CONSTRAINT b_pleinCamion CHECK (plein IN (0,1));

ALTER TABLE convoyeur
ADD CONSTRAINT b_marche CHECK (marche IN (0,1));

ALTER TABLE convoyeur
ADD CONSTRAINT b_actionConvoyeur CHECK (action IN (0,1));

-- seq auto increment

CREATE SEQUENCE numLot_seq START WITH 1;
CREATE SEQUENCE op_seq START WITH 1;
CREATE SEQUENCE accident_seq START WITH 1;

CREATE OR REPLACE TRIGGER numLot_seq
BEFORE INSERT ON lotCereale
FOR EACH ROW

BEGIN
	SELECT numLot_seq.NEXTVAL
	INTO :new.numLot
	FROM dual;
END;
/

CREATE OR REPLACE TRIGGER op_seq
BEFORE INSERT ON op
FOR EACH ROW

BEGIN
	SELECT op_seq.NEXTVAL
	INTO :new.idOperation
	FROM dual;
END;
/

CREATE OR REPLACE TRIGGER accident_seq
BEFORE INSERT ON accident
FOR EACH ROW

BEGIN
	SELECT accident_seq.NEXTVAL
	INTO :new.idAccident
	FROM dual;
END;
/



