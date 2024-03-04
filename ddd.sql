CREATE TABLE Doctor (
  DoctorId INT PRIMARY KEY,
  DoctorName VARCHAR(50),
  Password varchar(50),
  Specialization VARCHAR(50),
  PhoneNumber VARCHAR(20),
  Email VARCHAR(50),
  Address VARCHAR(100),
  DateOfBirth DATE,
  gender varchar(20)
);

CREATE TABLE Patient (
  PatientId INT PRIMARY KEY,
  Name varchar(50),
  Password VARCHAR(50),
  PhoneNumber VARCHAR(20),
  Address VARCHAR(100),
  email varchar(50),
  Gender VARCHAR(10),
  DateOfBirth DATE
);

CREATE TABLE Appointment(
  appointment_id INT PRIMARY KEY,
  doctor_id INT,
  patient_id INT,
  appointment_date DATE,
  appointment_time TIME,
  Status VARCHAR(20),
  FOREIGN KEY (doctor_id) REFERENCES Doctor( DoctorId ),
  FOREIGN KEY (patient_id) REFERENCES Patient(PatientId)
);
Alter Table Appointment
add disease varchar(30);

CREATE TABLE admin (
admin_id INT PRIMARY KEY ,
  Password varchar(10) not null,
  Name VARCHAR(50) not null,
  PhoneNumber VARCHAR(20) not null,
  Email VARCHAR(50) not null,
  Gender varchar(10) not null,
  Address VARCHAR(100) not null,
  DateOfBirth DATE,
  
);

CREATE TABLE Nurse (
  NurseId INT PRIMARY KEY,
  Password varchar(10),
  NurseName VARCHAR(50),
  PhoneNumber VARCHAR(20),
  Email VARCHAR(50),
  Gender varchar(10),
  Address VARCHAR(100),
  DateOfBirth DATE,
);

create table room
( roomid int primary key,
  patientid int foreign key references Patient(PatientId) on update cascade on delete cascade,
  nurseid int foreign key references Nurse(NurseId) on update cascade on delete cascade
);

-- Insert data into the Doctor table
INSERT INTO Doctor (DoctorId, DoctorName, Password, Specialization, PhoneNumber, Email, Address, DateOfBirth, gender)
VALUES (1, 'Dr. John Smith', 'password123', 'Cardiology', '1234567890', 'john.smith@example.com', '123 Main St, City', '1980-01-01', 'Male');

INSERT INTO Doctor (DoctorId, DoctorName, Password, Specialization, PhoneNumber, Email, Address, DateOfBirth, gender)
VALUES (2, 'Dr. Sarah Johnson', 'pass123', 'Dermatology', '9876543210', 'sarah.johnson@example.com', '456 Elm St, City', '1985-05-10', 'Female');

Select * From Doctor

-- Insert data into the Patient table
INSERT INTO Patient (PatientId, Name, Password, PhoneNumber, Address, Email, Gender, DateOfBirth)
VALUES (1, 'John Doe', 'abc123', '555-1234', '789 Oak St, City', 'john.doe@example.com', 'Male', '1990-06-15');

INSERT INTO Patient (PatientId, Name, Password, PhoneNumber, Address, Email, Gender, DateOfBirth)
VALUES (2, 'Jane Smith', 'pass456', '555-5678', '321 Pine St, City', 'jane.smith@example.com', 'Female', '1988-09-20');

Select * From Patient

-- Insert data into the Appointment table
INSERT INTO Appointment (appointment_id, doctor_id, patient_id, appointment_date, appointment_time)
VALUES (1, 1, 1, '2023-05-20', '10:00:00');

INSERT INTO Appointment (appointment_id, doctor_id, patient_id, appointment_date, appointment_time)
VALUES (2, 2, 2, '2023-05-22', '14:30:00');

INSERT INTO Appointment (appointment_id, doctor_id, patient_id, appointment_date, appointment_time , status)
VALUES (3, 1, 1, '2023-05-22', '14:30:00' , null);

Select * From Appointment

SELECT a.appointment_id, d.DoctorName, p.Name AS PatientName, a.appointment_date, a.appointment_time, a.Status
FROM Appointment a
INNER JOIN Doctor d ON a.doctor_id = d.DoctorId
INNER JOIN Patient p ON a.patient_id = p.PatientId
WHERE d.DoctorId = 1


-- Insert data into the admin table
INSERT INTO admin (admin_id, Password, Name, PhoneNumber, Email, Gender, Address, DateOfBirth)
VALUES (1, 'admin123', 'Admin User', '555-9999', 'admin@example.com', 'Male', '789 Main St, City', '1980-12-31');

-- Insert data into the Nurse table
INSERT INTO Nurse (NurseId, Password, NurseName, PhoneNumber, Email, Gender, Address, DateOfBirth)
VALUES (1, 'nursepass', 'Nurse A', '555-1111', 'nurse@example.com', 'Female', '456 Elm St, City', '1995-02-15');

INSERT INTO Nurse (NurseId, Password, NurseName, PhoneNumber, Email, Gender, Address, DateOfBirth)
VALUES (2, 'nursepass123', 'Nurse B', '555-2222', 'nurse2@example.com', 'Male', '123 Oak St, City', '1998-07-20');

CREATE TABLE DoctorCharges (
  doctor_id INT PRIMARY KEY,
  Charges DECIMAL(10,2)
);

CREATE TABLE BillRecord (
  bill_id INT PRIMARY KEY,
  patient_id INT,
  appointment_id INT,
  FOREIGN KEY (patient_id) REFERENCES Patient (PatientId),
  FOREIGN KEY (appointment_id) REFERENCES Appointment (appointment_id)
);
INSERT INTO DoctorCharges (doctor_id, Charges)
VALUES (1, 100.00),
       (2, 150.00),
       (3, 200.00);
INSERT INTO BillRecord (bill_id, patient_id, appointment_id)
VALUES (1, 1, 1),
       (2, 1, 2),
       (3, 2, 3);

	   select * from BillRecord



select * from Patient
select * from Appointment
select * from Doctor
select  * from BillRecord
select  * from Nurse
select * from admin
-- Insert data into the room table

CREATE TABLE Specialization (
  SpecializationId INT PRIMARY KEY,
  SpecializationName VARCHAR(50),
  Cost DECIMAL(10, 2)
);

INSERT INTO Specialization (SpecializationId, SpecializationName, Cost)
VALUES
  (1, 'Cardiology', 5000.00),
  (2, 'Dermatology', 2000.00),
  (3, 'Oncology', 12000.00),
  (4, 'Pediatrics', 1000.00),
  (5, 'Neurosurgery', 15000.00),
  (6, 'Gynaecology', 1500.00);


-- Create Bill table
CREATE TABLE Bill (
 
  PatientId INT,
  TotalAppointments INT,
  TotalCost DECIMAL(10, 2)
);
ALTER TABLE Bill
ADD BillId INT IDENTITY(1, 1);



	select* from bill
	
	select* from specialization


	  ---------------DOCTORS' PAY
  SELECT
  d.DoctorId,d.DoctorName,COUNT(a.appointment_id) AS TotalAppointments,s.Cost * COUNT(a.appointment_id) AS Salary
FROM Doctor d
  JOIN Appointment a ON d.DoctorId = a.doctor_id
  JOIN Specialization s ON d.Specialization = s.SpecializationName
GROUP BY
  d.DoctorId, d.DoctorName, s.Cost;

  select*from admin

  ---patients' bill!
  SELECT
    Appointment.patient_id,
    COUNT(Appointment.appointment_id) AS TotalAppointments,
    COUNT(Appointment.appointment_id) * Specialization.Cost AS TotalCost
FROM
    Appointment
    JOIN Doctor ON Appointment.doctor_id = Doctor.DoctorId
    JOIN Specialization ON Doctor.Specialization = Specialization.SpecializationName
GROUP BY
    Appointment.patient_id, Specialization.Cost;
	