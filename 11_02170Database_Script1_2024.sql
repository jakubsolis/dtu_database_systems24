
CREATE DATABASE IF NOT EXISTS HospitalDB;
USE HospitalDB;

-- Department Table
CREATE TABLE Department (
    Department_ID INT AUTO_INCREMENT PRIMARY KEY,
    Department_Name VARCHAR(100) NOT NULL  
);

-- Doctor Table
CREATE TABLE Doctor (
    Doctor_ID INT AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(45) NOT NULL,
    Last_Name VARCHAR(45),
    Contact_Info VARCHAR(100)  
);

-- Medicine Table
CREATE TABLE Medicine (
    Medicine_ID INT AUTO_INCREMENT PRIMARY KEY,
    Medicine_Name VARCHAR(100) NOT NULL,  -- Medicine names can vary in length
    Dosage VARCHAR(45),  
    Type VARCHAR(45) 
);

-- Patient Table
CREATE TABLE Patient (
    Patient_ID INT AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(45) NOT NULL,
    Last_Name VARCHAR(45),
    Contact_Info VARCHAR(100),
    Date_of_Birth DATE,
    Age INT  -- can be calculated from date of birth not sure if we want to store it??
);

-- Room Table
CREATE TABLE Room (
    Room_ID INT AUTO_INCREMENT PRIMARY KEY,
    Capacity INT NOT NULL 
);

-- Appointment Table
CREATE TABLE Appointment (
    Appointment_ID INT AUTO_INCREMENT PRIMARY KEY,
    Day DATE NOT NULL,
    Start_Time TIME NOT NULL,
    End_Time TIME NOT NULL,
    Doctor_ID INT,
    Patient_ID INT,
    Room_ID INT,
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID)
);

-- Doctor to Department (Specializes)
CREATE TABLE Specializes (
    Doctor_ID INT,
    Department_ID INT,
    PRIMARY KEY (Doctor_ID, Department_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID),
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);

-- Doctor to Medicine (Prescribes)
CREATE TABLE Prescribes (
    Doctor_ID INT,
    Medicine_ID INT,
    PRIMARY KEY (Doctor_ID, Medicine_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID),
    FOREIGN KEY (Medicine_ID) REFERENCES Medicine(Medicine_ID)
);

-- Patient to Room (Occupies)
CREATE TABLE Occupies (
    Patient_ID INT,
    Room_ID INT,
    PRIMARY KEY (Patient_ID, Room_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID)
);

-- Prescription Table
CREATE TABLE Prescription (
    Medicine_ID INT,
    Patient_ID INT,
    Prescription_Info TEXT,  
    PRIMARY KEY (Medicine_ID, Patient_ID),
    FOREIGN KEY (Medicine_ID) REFERENCES Medicine(Medicine_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);
-- Inserting dummy data into Department
INSERT INTO Department (Department_Name) VALUES 
('Cardiology'), ('Neurology'), ('Oncology'), ('Pediatrics'), ('Orthopedics'),
('Dermatology'), ('Gastroenterology'), ('Urology'), ('Endocrinology'), ('Rheumatology'),
('Nephrology'), ('Ophthalmology'), ('Otorhinolaryngology'), ('Pulmonology'), ('Pathology'),
('Radiology'), ('Psychiatry'), ('Immunology'), ('Anesthesiology'), ('Emergency Medicine');


-- Inserting dummy data into Doctor
INSERT INTO Doctor (First_Name, Last_Name, Contact_Info) VALUES 
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com'),
('Emily', 'Jones', 'emily.jones@example.com'),
('Chris', 'Brown', 'chris.brown@example.com'),
('Lisa', 'Taylor', 'lisa.taylor@example.com'),
('David', 'Wilson', 'david.wilson@example.com'),
('Anna', 'Moore', 'anna.moore@example.com'),
('Richard', 'Jackson', 'richard.jackson@example.com'),
('Patricia', 'Lopez', 'patricia.lopez@example.com'),
('Daniel', 'Harris', 'daniel.harris@example.com'),
('Barbara', 'Clark', 'barbara.clark@example.com'),
('Michael', 'Lewis', 'michael.lewis@example.com'),
('Linda', 'Robinson', 'linda.robinson@example.com'),
('Matthew', 'Walker', 'matthew.walker@example.com'),
('Susan', 'Hall', 'susan.hall@example.com'),
('James', 'Allen', 'james.allen@example.com'),
('Karen', 'Young', 'karen.young@example.com'),
('Robert', 'Hernandez', 'robert.hernandez@example.com'),
('Patricia', 'King', 'patricia.king@example.com'),
('William', 'Wright', 'william.wright@example.com');

INSERT INTO Medicine (Medicine_Name, Dosage, Type) VALUES 
('Acetaminophen', '500mg', 'Analgesic'),
('Ibuprofen', '400mg', 'Anti-inflammatory'),
('Amoxicillin', '250mg', 'Antibiotic'),
('Atorvastatin', '20mg', 'Statins'),
('Lisinopril', '10mg', 'ACE inhibitor'),
('Metformin', '500mg', 'Biguanide'),
('Amlodipine', '5mg', 'Calcium channel blocker'),
('Metoprolol', '50mg', 'Beta blocker'),
('Sildenafil', '20mg', 'Vasodilator'),
('Simvastatin', '20mg', 'Lipid-lowering'),
('Clopidogrel', '75mg', 'Antiplatelet'),
('Levothyroxine', '100mcg', 'Thyroid hormone'),
('Hydrochlorothiazide', '25mg', 'Diuretic'),
('Furosemide', '40mg', 'Diuretic'),
('Gabapentin', '300mg', 'Anticonvulsant'),
('Ciprofloxacin', '500mg', 'Antibiotic'),
('Alprazolam', '0.5mg', 'Anxiolytic'),
('Loratadine', '10mg', 'Antihistamine'),
('Esomeprazole', '40mg', 'Proton pump inhibitor'),
('Fluoxetine', '20mg', 'Antidepressant');



INSERT INTO Patient (First_Name, Last_Name, Contact_Info, Date_of_Birth, Age) VALUES 
('Alex', 'Smith', 'alex.smith@example.com', '1990-01-01', 34),
('Brian', 'Johnson', 'brian.johnson@example.com', '1985-02-02', 39),
('Carla', 'Williams', 'carla.williams@example.com', '1992-03-03', 32),
('David', 'Brown', 'david.brown@example.com', '1978-04-04', 46),
('Evelyn', 'Jones', 'evelyn.jones@example.com', '1980-05-05', 44),
('Frank', 'Garcia', 'frank.garcia@example.com', '1972-06-06', 52),
('Grace', 'Miller', 'grace.miller@example.com', '1995-07-07', 29),
('Henry', 'Davis', 'henry.davis@example.com', '2000-08-08', 24),
('Isabella', 'Martinez', 'isabella.martinez@example.com', '1996-09-09', 28),
('Jack', 'Hernandez', 'jack.hernandez@example.com', '1999-10-10', 25),
('Katie', 'Moore', 'katie.moore@example.com', '2001-11-11', 23),
('Liam', 'Taylor', 'liam.taylor@example.com', '1983-12-12', 41),
('Mia', 'Anderson', 'mia.anderson@example.com', '1975-01-13', 49),
('Noah', 'Thomas', 'noah.thomas@example.com', '1968-02-14', 56),
('Olivia', 'Jackson', 'olivia.jackson@example.com', '1986-03-15', 38),
('Peter', 'White', 'peter.white@example.com', '1993-04-16', 31),
('Quinn', 'Harris', 'quinn.harris@example.com', '1989-05-17', 35),
('Rachel', 'Martin', 'rachel.martin@example.com', '1970-06-18', 54),
('Steven', 'Lee', 'steven.lee@example.com', '1965-07-19', 59),
('Tina', 'Perez', 'tina.perez@example.com', '2003-08-20', 21);

INSERT INTO Room (Capacity) VALUES 
(1), (2), (1), (3), (2),
(1), (4), (2), (1), (2),
(3), (2), (1), (4), (3),
(1), (2), (3), (1), (4);

INSERT INTO Appointment (Day, Start_Time, End_Time, Doctor_ID, Patient_ID, Room_ID) VALUES 
('2024-04-01', '08:00', '08:30', 1, 1, 1),
('2024-04-01', '09:00', '09:30', 2, 2, 2),
('2024-04-01', '10:00', '10:30', 3, 3, 3),
('2024-04-01', '11:00', '11:30', 4, 4, 4),
('2024-04-01', '12:00', '12:30', 5, 5, 5),
('2024-04-01', '13:00', '13:30', 6, 6, 6),
('2024-04-01', '14:00', '14:30', 7, 7, 7),
('2024-04-01', '15:00', '15:30', 8, 8, 8),
('2024-04-02', '08:00', '08:30', 9, 9, 9),
('2024-04-02', '09:00', '09:30', 10, 10, 10),
('2024-04-02', '10:00', '10:30', 11, 11, 11),
('2024-04-02', '11:00', '11:30', 12, 12, 12),
('2024-04-02', '12:00', '12:30', 13, 13, 13),
('2024-04-02', '13:00', '13:30', 14, 14, 14),
('2024-04-02', '14:00', '14:30', 15, 15, 15),
('2024-04-02', '15:00', '15:30', 16, 16, 16),
('2024-04-03', '08:00', '08:30', 17, 17, 17),
('2024-04-03', '09:00', '09:30', 18, 18, 18),
('2024-04-03', '10:00', '10:30', 19, 19, 19),
('2024-04-03', '11:00', '11:30', 20, 20, 20);

INSERT INTO Specializes (Doctor_ID, Department_ID) VALUES 
(1, 1), (1, 2), (1, 3), (2, 4), (2, 5),
(3, 6), (3, 7), (4, 8), (4, 9), (4, 10),
(5, 11), (5, 12), (6, 13), (6, 14), (7, 15),
(7, 16), (8, 17), (8, 18), (9, 19), (9, 20),
(10, 1), (10, 2), (11, 3), (11, 4), (12, 5),
(12, 6), (13, 7), (13, 8), (14, 9), (14, 10),
(15, 11), (15, 12), (16, 13), (16, 14), (17, 15),
(17, 16), (18, 17), (18, 18), (19, 19), (19, 20),
(20, 1), (20, 2);

INSERT INTO Prescribes (Doctor_ID, Medicine_ID) VALUES 
(1, 1), (1, 5), (1, 10), 
(2, 2), (2, 6), (2, 11), 
(3, 3), (3, 7), (3, 12), 
(4, 4), (4, 8), (4, 13), 
(5, 5), (5, 9), (5, 14), 
(6, 6), (6, 10), (6, 15), 
(7, 7), (7, 11), (7, 16), 
(8, 8), (8, 12), (8, 17), 
(9, 9), (9, 13), (9, 18), 
(10, 10), (10, 14), (10, 19), 
(11, 15), (11, 1), (11, 6), 
(12, 16), (12, 2), (12, 7), 
(13, 17), (13, 3), (13, 8), 
(14, 18), (14, 4), (14, 9), 
(15, 19), (15, 5), (15, 10), 
(16, 20), (16, 1), (16, 11), 
(17, 2), (17, 6), (17, 15), 
(18, 3), (18, 7), (18, 16), 
(19, 4), (19, 8), (19, 17), 
(20, 5), (20, 9), (20, 18);

INSERT INTO Occupies (Patient_ID, Room_ID) VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(11, 11), (12, 12), (13, 13), (14, 14), (15, 15),
(16, 16), (17, 17), (18, 18), (19, 19), (20, 20);

INSERT INTO Prescription (Medicine_ID, Patient_ID, Prescription_Info) VALUES 
(1, 1, 'Take one tablet by mouth every 6 hours as needed for pain.'),
(2, 2, 'Take one tablet by mouth daily.'),
(3, 3, 'Take 500mg by mouth twice a day for 10 days.'),
(4, 4, 'Take 20mg by mouth once a day.'),
(5, 5, 'Take 10mg by mouth once a day.'),
(6, 6, 'Take 500mg by mouth twice a day before meals.'),
(7, 7, 'Take one pill by mouth every morning.'),
(8, 8, 'Take 50mg by mouth once a day for blood pressure.'),
(9, 9, '20mg as directed by the physician.'),
(10, 10, 'Take 20mg by mouth once a day.'),
(11, 1, 'Take 75mg by mouth once a day.'),
(12, 2, '100mcg daily in the morning.'),
(13, 3, '25mg by mouth once a day.'),
(14, 4, '40mg by mouth twice a day.'),
(15, 5, '300mg three times a day.'),
(16, 6, '500mg by mouth twice a day for 7 days.'),
(17, 7, '0.5mg by mouth at bedtime as needed.'),
(18, 8, '10mg by mouth once a day for allergies.'),
(19, 9, '40mg by mouth once a day before meals.'),
(20, 10, '20mg by mouth once a day in the morning.');