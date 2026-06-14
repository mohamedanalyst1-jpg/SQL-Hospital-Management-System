CREATE DATABASE HospitalDatabasee;
 
USE HospitalDatabasee;
 
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName VARCHAR(100) NOT NULL,
    Location VARCHAR(100)
);
 
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY IDENTITY(1,1),
    DoctorName VARCHAR(100) NOT NULL,
    Specialty VARCHAR(100),
    DepartmentID INT,
    Phone VARCHAR(20),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY IDENTITY(1,1),
    PatientName VARCHAR(100) NOT NULL,
    Gender VARCHAR(10),
    DateOfBirth DATE,
    Phone VARCHAR(20)
);
 
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY IDENTITY(1,1),
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    Diagnosis VARCHAR(200),
    Fees DECIMAL(8,2),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);
 
INSERT INTO Departments (DepartmentName, Location)
VALUES 
('Cardiology', 'Building A'),
('Neurology', 'Building B'),
('Pediatrics', 'Building C'),
('Orthopedics', 'Building D');
 
INSERT INTO Doctors (DoctorName, Specialty, DepartmentID, Phone)
VALUES
('Dr. Ahmed Ali', 'Heart Specialist', 1, '01011111111'),
('Dr. Mona Hassan', 'Brain Specialist', 2, '01022222222'),
('Dr. Omar Youssef', 'Child Specialist', 3, '01033333333'),
('Dr. Sara Mahmoud', 'Bone Specialist', 4, '01044444444');
 
INSERT INTO Patient(PatientName, Gender, DateOfBirth, Phone)
VALUES
('Ali Mohamed', 'Male', '1990-05-10', '01111111111'),
('Nada Samir', 'Female', '1995-09-22', '01122222222'),
('Youssef Adel', 'Male', '2002-01-15', '01133333333');
 
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Diagnosis, Fees)
VALUES
(1, 1, '2025-01-10', 'Heart Checkup', 500),
(2, 2, '2025-01-11', 'Migraine', 400),
(3, 3, '2025-01-12', 'Fever', 300),
(1, 4, '2025-01-15', 'Back Pain', 450);
select * from Patient;
--doc name ,patiant anem ,appointment

Select 
    Doctors.DoctorName,
    Patient.PatientName,
    Appointments.AppointmentDate
From Appointments
INNER JOIN Patient 
ON Appointments.PatientID = Patient.PatientID
INNER JOIN Doctors 
ON Appointments.DoctorID = Doctors.DoctorID;

select  Patient.PatientName,Appointments.AppointmentDate
from Patient
left  join Appointments on Patient.PatientID=Appointments.PatientID;

--all the appointments for cadiology department (patiant name ,app adte ,location fees doc spicaility)
select Patient.PatientName,Appointments.AppointmentDate ,Departments.Location,Appointments.Fees,Doctors.Specialty
from Appointments
join Patient ON Appointments.PatientID = Patient.PatientID
JOIN Doctors ON Appointments.DoctorID = Doctors.DoctorID
join Departments on Departments.DepartmentID=Doctors.DepartmentID
 where Departments.DepartmentName='cardiology';
 --patiant name  with thier appointment date 

 select P.PatientName,A.AppointmentDate, p.Gender,A.Diagnosis
 from  Patient p 
 join Appointments A on A.PatientID=p.PatientID

 --patient names and doc names diagnos
  select P.PatientName,d.DoctorName,A.Diagnosis
  from Patient p 
 join Appointments A on A.PatientID=p.PatientID
 join Doctors  d on d.DoctorID=a.DoctorID
