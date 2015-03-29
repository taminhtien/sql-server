CREATE DATABASE StudentMgnt
GO

CREATE TABLE Student (
	SSN			int NOT NULL,
	Name		nvarchar(50),
	Major		nvarchar(50),
	Bdate		datetime,
	PRIMARY KEY (SSN)
)
GO

CREATE TABLE  Course (
	Course		int NOT NULL,
	Cname		nvarchar(50),
	Dept		nvarchar(100),
	PRIMARY KEY (Course)
)
GO

CREATE TABLE Enroll (
	SSN			int NOT NULL,
	Course		int NOT NULL,
	Quarter		nvarchar(50),
	Grade		nvarchar(50),
	PRIMARY KEY (Course),
	FOREIGN KEY (SSN) REFERENCES Student (SSN),
	FOREIGN KEY (Course) REFERENCES Course (Course)
)
GO

CREATE TABLE Book_Adoption (
	Course		int NOT NULL,
	Quarter		nvarchar(50),
	Book_ISBN	int NOT NULL,
	PRIMARY KEY (Course),
	FOREIGN KEY (Book_ISBN) REFERENCES Text (Book_ISBN)
)
GO

CREATE TABLE Text (
	Book_ISBN	int NOT NULL,
	Book_Title	nvarchar(50),
	Publisher	nvarchar(50),
	Author		nvarchar(50),
	PRIMARY KEY (Book_ISBN)
)
GO

ALTER TABLE Book_Adoption
ADD CONSTRAINT FK_BookAdoption_Course FOREIGN KEY (Course) REFERENCES Course (Course)
GO