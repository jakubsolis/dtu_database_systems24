-- PART 6: SQL Data Queries

-- QUERY 1: Find the patient’s information (patient ID, first and last name) and their corresponding
-- doctor (doctor ID) for patients who have been prescribed Antibiotic-Type medications.
SELECT Patient.Patient_ID, Patient.First_Name, Patient.Last_Name, 
Appointment.Doctor_ID, Medicine.Dosage
FROM Patient
NATURAL JOIN Prescription
NATURAL JOIN Medicine
NATURAL JOIN Appointment
WHERE Medicine.Type = 'Antibiotic';

-- QUERY 2: Find the number of rooms and the total capacity of each department
SELECT Department.Department_Name, 
COUNT(*) AS Department_Rooms, SUM(Room.Capacity) AS Department_Total_Capacity
FROM Department
NATURAL JOIN Specializes
NATURAL JOIN Appointment
NATURAL JOIN Room 
GROUP BY Department.Department_Name;

-- QUERY 3: Find the contact information for all patients visited by doctor 'Daniel Harris'
SELECT Patient.First_Name, Patient.Last_Name, Patient.phone_number
FROM Patient
WHERE Patient_ID IN (
    SELECT Appointment.Patient_ID
    FROM Appointment
    JOIN Doctor ON Appointment.Doctor_ID = Doctor.Doctor_ID
    WHERE Doctor.First_Name = 'Daniel' AND Doctor.Last_Name = 'Harris');

--------------------------------------------------------------------------------------------

-- PART 7: SQL PROGRAMMING

-- FUNCTION: Create a function that calculates the average age of patients in a specific department.
DELIMITER //
CREATE FUNCTION GetAverageAgeInDepartment(Department_ID INT)
RETURNS DECIMAL(5, 2)
BEGIN
	DECLARE Average_Age DECIMAL(5, 2);
	SELECT AVG(YEAR(CURRENT_DATE()) - YEAR(Date_of_birth)) INTO Average_Age
	FROM Patient NATURAL JOIN Occupies
    WHERE Occupies.Room_ID = Department_ID;
	RETURN Average_Age;
END //
DELIMITER ;

-- Query
SELECT GetAverageAgeInDepartment(8);
SELECT Department_ID, Department_Name, GetAverageAgeInDepartment(Department_ID) AS Average_Age
FROM Department;


-- PROCEDURE: Schedule appointment for a patient with a specific doctor, considering the doctor's
-- availability and specialty
DELIMITER //
CREATE PROCEDURE ScheduleAppointment(
    IN Scheduled_Patient_ID INT,
    IN Scheduled_Doctor_ID INT,
    IN Scheduled_Room_ID INT,
    IN Scheduled_Day DATE,
    IN Scheduled_Start_Time TIME,
    IN Sheduled_End_Time TIME)
BEGIN
    DECLARE Doctor_Available INT DEFAULT 0;
    
    SELECT COUNT(*)
    INTO Doctor_Available
    FROM Appointment
    WHERE Doctor_ID = Scheduled_Doctor_ID
    AND Day = Scheduled_Day
    AND ((Start_Time < Sheduled_End_Time AND End_Time > Scheduled_Start_Time));

    IF doctor_available = 0 THEN
        INSERT INTO Appointment (Day, Start_Time, End_Time, Doctor_ID, Patient_ID, Room_ID)
        VALUES (Scheduled_Day, Scheduled_Start_Time, Sheduled_End_Time, Scheduled_Doctor_ID, 
        Scheduled_Patient_ID, Scheduled_Room_ID);
        SELECT "Appointment scheduled successfully." AS Message;
    ELSE
        SELECT "Doctor is not available in the given time slot." AS Message;
    END IF;
END //
DELIMITER ;

-- Queries
SELECT*FROM Appointment;
CALL ScheduleAppointment(1, 2, 1, '2024-04-04', '09:00:00', '09:30:00');
SELECT*FROM Appointment;

-- TRIGGER: If an appointment is scheduled for a new patient, the trigger creates a new row in Patient
-- with the new ID provided.
DELIMITER //
CREATE TRIGGER CheckForNewPatient 
BEFORE INSERT ON Appointment
FOR EACH ROW
BEGIN
  DECLARE patient_exists INT;
  SELECT COUNT(*) INTO patient_exists FROM Patient WHERE Patient_ID = NEW.Patient_ID;

  IF patient_exists = 0 THEN
    INSERT INTO Patient (Patient_ID, First_Name, Last_Name, phone_number) 
    VALUES (NEW.Patient_ID, 'Add first name', 'Add last name', 'Add phone number');
  END IF;
END //
DELIMITER ;

-- Queries
SELECT*FROM Appointment;
CALL ScheduleAppointment(21, 19, 2, '2024-04-07', '10:00:00', '10:30:00');
SELECT*FROM Patient;

--------------------------------------------------------------------------------------------

-- PART 8: SQL TABLE MODIFICATIONS
UPDATE room
SET capacity =
  CASE
    WHEN capacity <= 3 THEN capacity + 1
    WHEN capacity >= 4 THEN capacity + 2
    ELSE capacity
  END
WHERE capacity > 0;

DELETE FROM appointment
WHERE DATE(Day) = '2024-04-02';
