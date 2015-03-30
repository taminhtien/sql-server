CREATE DATABASE Fresher_Training_Mngt
GO

USE Fresher_Training_Mngt
GO

--Q1: Create the tables
--(with the most appropriate/economic field/column constraints & types)
-- and add at least 10 records into each created table.

CREATE TABLE Trainee(
	TraineeID			int IDENTITY(1, 1) PRIMARY KEY,
	Full_Name			nvarchar(50),
	Birth_Date			date,
	Gender				bit,
	ET_IQ				int,
	ET_Gmath			int,
	ET_English			int,
	Training_Class		char(10),
	Evaluation_Notes	nvarchar(500)
)
GO

ALTER TABLE Trainee
ADD CONSTRAINT Check_ET_IQ CHECK (ET_IQ >= 0 AND ET_IQ <= 20)
GO

ALTER TABLE Trainee
ADD CONSTRAINT Check_ET_Gmath CHECK (ET_Gmath >= 0 AND ET_Gmath <= 20)
GO

ALTER TABLE Trainee
ADD CONSTRAINT Check_ET_English CHECK (ET_English >= 0 AND ET_English <= 50)
GO

INSERT INTO Trainee
VALUES ('Werdheri Paschalis', '2/12/1993', 1, 15, 18, 35, 'Fresher-1', 'Creative, Quite')
GO

INSERT INTO Trainee
VALUES ( 'Dumitru An', '1/1/1996', 0, 19, 15, 44, 'Fresher-2', 'Polite, Hard-working')
GO

INSERT INTO Trainee
VALUES ('Phoebus Eitan', '9/4/1990', 1, 5, 10, 21, 'Fresher-3', 'Hardest, Bad-tempered')
GO

INSERT INTO Trainee
VALUES ('Gebhard Crescens', '9/11/1983', 0, 10, 10, 20, 'Fresher-3', 'Friendly, Cheerful')
GO

INSERT INTO Trainee
VALUES ('Wotan Ittai', '2/25/1999', 0, 12, 14, 40, 'Fresher-2', 'Crazy, Shy, Talkative')
GO

INSERT INTO Trainee
VALUES ('Thore Zan', '11/22/1993', 1, 2, 10, 20, 'Fresher-2', 'Naughty, Boast')
GO

INSERT INTO Trainee
VALUES ('Izydor Jenaro', '12/31/1996', 1, 20, 19, 49, 'Fresher-1', 'Smart, Talented')
GO

INSERT INTO Trainee
VALUES ('Arash Euaristos', '1/30/2000', 1, 16, 15, 40, 'Fresher-2', 'Dependable, Enthusiastic')
GO

INSERT INTO Trainee
VALUES ('Damodar Lanzo', '5/3/2009', 1, 15, 10, 30, 'Fresher-1', 'Sociable, Optimistic')
GO

INSERT INTO Trainee
VALUES ('Roderick Anton', '1/30/1996', 1, 20, 18, 41, 'Fresher-1', 'Serious, Understantding')
GO

--Q2: Change the table TRAINEE to add one more field named Fsoft_Account
--which is a not-null & unique field.

ALTER TABLE Trainee
ADD Fsoft_Account char(20) NOT NULL UNIQUE
GO

--Q3: Create a VIEW which includes all the ET-passed trainees.
--One trainee is considered as ET-passed when he/she has
-- the entry test points satisfied below criteria:
-- ET_IQ + ET_Gmath >= 20 AND ET_IQ >= 8 AND ET_Gmath >= 8 AND ET_English >= 18

CREATE VIEW ET_Passed_Trainees1 AS
	SELECT TraineeID, Full_Name, Birth_Date, Gender
	FROM Trainee
	WHERE ET_IQ + ET_Gmath >= 20 AND ET_IQ >= 8 AND ET_Gmath >= 8 AND ET_English >= 18
GO
	
--Q4: Query all the trainees who is passed the entry test,
--group them into different birth months.

SELECT	TraineeID,
		Full_Name,
		Birth_Date
FROM	Trainee
WHERE	ET_IQ + ET_Gmath >= 20
		AND ET_IQ >= 8
		AND ET_Gmath >= 8
		AND ET_English >= 18
ORDER BY MONTH(Birth_Date)


--Q5: Query the trainee who has the longest name,
--showing his/her age along with his/her basic information
--(as defined in the table)

SELECT	TraineeID,
		Full_Name,
		Birth_Date,
		YEAR(GETDATE()) - YEAR(Birth_Date) AS AGE,
		Gender
FROM	Trainee
WHERE	LEN(Full_Name) = (SELECT MAX(LEN(Full_Name)) FROM Trainee)


--Drop Database
DROP DATABASE Fresher_Training_Mngt
GO
