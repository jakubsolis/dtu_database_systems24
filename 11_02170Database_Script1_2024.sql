CREATE DATABASE IF NOT EXISTS HospitalDB;
USE HospitalDB;

-- Department Table
CREATE TABLE Departments (
    Department_ID INT AUTO_INCREMENT PRIMARY KEY,
    Department_name VARCHAR(100) NOT NULL
);

-- Doctor Table
CREATE TABLE Doctor (
    Doctor_ID INT AUTO_INCREMENT PRIMARY KEY,
    Doctor_FName VARCHAR(45) NOT NULL,
    Doctor_LName VARCHAR(45) NOT NULL,
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
);

-- Phone Table
CREATE TABLE Phone (
    Phone_ID INT AUTO_INCREMENT PRIMARY KEY,
    Phone_number VARCHAR(45) NOT NULL,
    Doctor_ID INT,
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID)
);

-- Room Table
CREATE TABLE Room (
    Room_id INT AUTO_INCREMENT PRIMARY KEY,
    Capacity INT NOT NULL,
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
);

-- Medicine Table
CREATE TABLE Medicine (
    Medicine_ID INT AUTO_INCREMENT PRIMARY KEY,
    Medicine_name VARCHAR(100) NOT NULL,
    Dosage VARCHAR(45),
    Type VARCHAR(45),
    Doctor_ID INT,
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID)
);



-- Patient Table
CREATE TABLE Patient (
    Patient_ID INT AUTO_INCREMENT PRIMARY KEY,
    First_name VARCHAR(45) NOT NULL,
    Last_name VARCHAR(45) NOT NULL,
    Date_Of_Birth DATE NOT NULL,
    Doctor_ID INT,
    Room_ID INT,
    Phone_number VARCHAR(45),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID),
    FOREIGN KEY (Room_ID) REFERENCES Room(Room_id)
);
-- Appointment Table
CREATE TABLE Appointment (
    Appointment_ID INT AUTO_INCREMENT PRIMARY KEY,
    Doctor_ID INT,
    Patient_ID INT,
    Room_ID INT,
    Day DATE NOT NULL,
    Start_time TIME NOT NULL,
    End_time TIME NOT NULL,
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Room_ID) REFERENCES Room(Room_id)
);
-- Prescription Table
CREATE TABLE Prescription (
    Prescription_ID INT AUTO_INCREMENT PRIMARY KEY,
    Medicine_ID INT,
    Patient_id INT,
    Prescription_info TEXT NOT NULL,
    FOREIGN KEY (Medicine_ID) REFERENCES Medicine(Medicine_ID),
    FOREIGN KEY (Patient_id) REFERENCES Patient(Patient_ID)
);

-- Inserting dummy data into Departments
INSERT INTO Departments (Department_name) VALUES 
('General Medicine'), ('Pediatrics'), ('Oncology'), ('Cardiology'), ('Neurology'),
('Radiology'), ('Orthopedics'), ('ENT'), ('Dermatology'), ('Psychiatry'),
('Gastroenterology'), ('Urology'), ('Endocrinology'), ('Ophthalmology'), ('Pathology'),
('Surgery'), ('Anaesthesiology'), ('Nephrology'), ('Pulmonology'), ('Infectious Diseases');

-- Inserting dummy data into Doctor
INSERT INTO Doctor (Doctor_FName, Doctor_LName, Department_ID) VALUES 
('John', 'Doe', 1), ('Jane', 'Smith', 2), ('Emily', 'Jones', 3), ('Chris', 'Brown', 4),
('Lisa', 'Taylor', 5), ('David', 'Wilson', 6), ('Anna', 'Moore', 7), ('Richard', 'Jackson', 8),
('Patricia', 'Lopez', 9), ('Daniel', 'Harris', 10), ('Barbara', 'Clark', 11), ('Michael', 'Lewis', 12),
('Linda', 'Robinson', 13), ('Matthew', 'Walker', 14), ('Susan', 'Hall', 15), ('James', 'Allen', 16),
('Karen', 'Young', 17), ('Robert', 'Hernandez', 18), ('Patricia', 'King', 19), ('William', 'Wright', 20);

-- Inserting dummy data into Phone
INSERT INTO Phone (Phone_number, Doctor_ID) VALUES 
('202-555-0100', 1), ('202-555-0101', 2), ('202-555-0102', 3), ('202-555-0103', 4),
('202-555-0104', 5), ('202-555-0105', 6), ('202-555-0106', 7), ('202-555-0107', 8),
('202-555-0108', 9), ('202-555-0109', 10), ('202-555-0110', 11), ('202-555-0111', 12),
('202-555-0112', 13), ('202-555-0113', 14), ('202-555-0114', 15), ('202-555-0115', 16),
('202-555-0116', 17), ('202-555-0117', 18), ('202-555-0118', 19), ('202-555-0119', 20);


-- Inserting dummy data into Room
INSERT INTO Room (Capacity, Department_ID) VALUES 
(2, 1), (1, 2), (1, 3), (2, 4), (3, 5),
(2, 6), (1, 7), (1, 8), (2, 9), (3, 10),
(2, 11), (1, 12), (1, 13), (2, 14), (3, 15),
(2, 16), (1, 17), (1, 18), (2, 19), (3, 20);


-- Inserting dummy data into Medicine

INSERT INTO Medicine (Medicine_name, Dosage, Type, Doctor_ID) VALUES 
('Acetaminophen', '500mg', 'Painkiller', 1), ('Ibuprofen', '200mg', 'Anti-inflammatory', 2),
('Amoxicillin', '500mg', 'Antibiotic', 3), ('Atorvastatin', '10mg', 'Cholesterol', 4),
('Lisinopril', '5mg', 'Hypertension', 5), ('Metformin', '1000mg', 'Diabetes', 6),
('Amlodipine', '10mg', 'Hypertension', 7), ('Metoprolol', '50mg', 'Hypertension', 8),
('Sildenafil', '50mg', 'Erectile Dysfunction', 9), ('Simvastatin', '20mg', 'Cholesterol', 10),
('Clopidogrel', '75mg', 'Blood Thinner', 11), ('Levothyroxine', '50mcg', 'Hypothyroidism', 12),
('Hydrochlorothiazide', '25mg', 'Diuretic', 13), ('Furosemide', '40mg', 'Diuretic', 14),
('Gabapentin', '300mg', 'Neuropathic Pain', 15), ('Ciprofloxacin', '500mg', 'Antibiotic', 16),
('Alprazolam', '0.5mg', 'Anxiety', 17), ('Loratadine', '10mg', 'Allergies', 18),
('Esomeprazole', '40mg', 'GERD', 19), ('Fluoxetine', '20mg', 'Depression', 20);


-- Inserting dummy data into Patient
INSERT INTO Patient (First_name, Last_name, Date_Of_Birth, Doctor_ID, Room_ID, Phone_number) VALUES 
('Michael', 'Scott', '1964-03-15', 1, 1, '202-555-0100'),
('Pam', 'Beesly', '1979-06-24', 2, 2, '202-555-0101'),
('Jim', 'Halpert', '1978-10-01', 3, 3, '202-555-0102'),
('Dwight', 'Schrute', '1970-01-20', 4, 4, '202-555-0103'),
('Andy', 'Bernard', '1973-07-22', 5, 5, '202-555-0104'),
('Stanley', 'Hudson', '1958-02-19', 6, 6, '202-555-0105'),
('Kevin', 'Malone', '1968-12-05', 7, 7, '202-555-0106'),
('Angela', 'Martin', '1974-11-25', 8, 8, '202-555-0107'),
('Oscar', 'Martinez', '1963-02-09', 9, 9, '202-555-0108'),
('Toby', 'Flenderson', '1965-06-22', 10, 10, '202-555-0109'),
('Phyllis', 'Vance', '1962-02-05', 11, 11, '202-555-0110'),
('Meredith', 'Palmer', '1959-11-12', 12, 12, '202-555-0111'),
('Creed', 'Bratton', '1943-09-08', 13, 13, '202-555-0112'),
('Kelly', 'Kapoor', '1980-02-20', 14, 14, '202-555-0113'),
('Ryan', 'Howard', '1979-05-05', 15, 15, '202-555-0114'),
('Darryl', 'Philbin', '1970-10-25', 16, 16, '202-555-0115'),
('Erin', 'Hannon', '1986-05-01', 17, 17, '202-555-0116'),
('Gabe', 'Lewis', '1982-03-10', 18, 18, '202-555-0117'),
('Robert', 'California', '1960-07-10', 19, 19, '202-555-0118'),
('Nellie', 'Bertram', '1973-10-20', 20, 20, '202-555-0119');

-- Inserting dummy data into Appointment
INSERT INTO Appointment (Doctor_ID, Patient_ID, Room_ID, Day, Start_time, End_time) VALUES 
(1, 1, 1, '2024-04-01', '08:00', '08:30'),
(2, 2, 2, '2024-04-01', '09:00', '09:30'),
(3, 3, 3, '2024-04-01', '10:00', '10:30'),
(4, 4, 4, '2024-04-01', '11:00', '11:30'),
(5, 5, 5, '2024-04-01', '12:00', '12:30'),
(6, 6, 6, '2024-04-01', '13:00', '13:30'),
(7, 7, 7, '2024-04-01', '14:00', '14:30'),
(8, 8, 8, '2024-04-01', '15:00', '15:30'),
(9, 9, 9, '2024-04-02', '08:00', '08:30'),
(10, 10, 10, '2024-04-02', '09:00', '09:30'),
(11, 11, 11, '2024-04-02', '10:00', '10:30'),
(12, 12, 12, '2024-04-02', '11:00', '11:30'),
(13, 13, 13, '2024-04-02', '12:00', '12:30'),
(14, 14, 14, '2024-04-02', '13:00', '13:30'),
(15, 15, 15, '2024-04-02', '14:00', '14:30'),
(16, 16, 16, '2024-04-02', '15:00', '15:30'),
(17, 17, 17, '2024-04-03', '08:00', '08:30'),
(18, 18, 18, '2024-04-03', '09:00', '09:30'),
(19, 19, 19, '2024-04-03', '10:00', '10:30'),
(20, 20, 20, '2024-04-03', '11:00', '11:30');

-- Inserting dummy data into Prescription
INSERT INTO Prescription (Medicine_ID, Patient_id, Prescription_info) VALUES 
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
(11, 11, 'Take 75mg by mouth once a day.'),
(12, 12, '100mcg daily in the morning.'),
(13, 13, '25mg by mouth once a day.'),
(14, 14, '40mg by mouth twice a day.'),
(15, 15, '300mg three times a day.'),
(16, 16, '500mg by mouth twice a day for 7 days.'),
(17, 17, '0.5mg by mouth at bedtime as needed.'),
(18, 18, '10mg by mouth once a day for allergies.'),
(19, 19, '40mg by mouth once a day before meals.'),
(20, 20, '20mg by mouth once a day in the morning.');
