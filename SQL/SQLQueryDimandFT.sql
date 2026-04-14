---Create DATABASE

CREATE DATABASE Ambulance_Request

USE Ambulance_Request;


---Create Dim Ambulance
CREATE TABLE Dim_Ambulance (
    ambulance_id INT PRIMARY KEY,
    registration_number VARCHAR(20),
    availability_status VARCHAR(20),
    driver_name VARCHAR(100),
    vehicle_type VARCHAR(50)
);

----Create the Dim Patient
CREATE TABLE Dim_Patient(
	patient_id INT PRIMARY KEY,
	name VARCHAR(50),
	gender VARCHAR(500),
	contact_detail VARCHAR(100),
	physcical_address VARCHAR (500)
);


----Create the Dim Time
CREATE TABLE Dim_Time(
	time_id INT PRIMARY KEY,
	hour INT,
	date INT,
	month INT,
	year INT
);


----Create the Dim Clinic
CREATE TABLE Dim_Clinic(
	clinic_id INT PRIMARY KEY,
	clinic_name VARCHAR(50),
	location VARCHAR(500),
	contact_details VARCHAR(100)
);


----Create the Dim Location
CREATE TABLE Dim_Location (
    location_id INT PRIMARY KEY,
    province VARCHAR(50),
    district VARCHAR(50),
    town_village VARCHAR(100),
    
);

---Create Fact Tables

CREATE TABLE Ambulance_Request (
    request_id INT PRIMARY KEY,

    patient_id INT,
    clinic_id INT,
    ambulance_id INT,
    time_id INT,
    location_id INT,

    urgency_level VARCHAR(20),
    status VARCHAR(20),
    response_time INT,

    FOREIGN KEY (patient_id) REFERENCES Dim_Patient(patient_id),
    FOREIGN KEY (clinic_id) REFERENCES Dim_Clinic(clinic_id),
    FOREIGN KEY (ambulance_id) REFERENCES Dim_Ambulance(ambulance_id),
    FOREIGN KEY (time_id) REFERENCES Dim_Time (time_id),
    FOREIGN KEY (location_id) REFERENCES Dim_Location(location_id)
);



-----INSERT = dataset (real rows)

INSERT INTO Dim_Ambulance VALUES
(1, 'GP-101', 'Available', 'Thabo Mokoena', 'Basic Life Support'),
(2, 'GP-102', 'Busy', 'James Khumalo', 'Advanced Life Support'),
(3, 'GP-103', 'Available', 'Peter Mahlangu', 'Basic Life Support');

INSERT INTO Dim_Patient VALUES
(1, 'John Mokoena', 'Male', '0712345678', 'Mamelodi, Pretoria'),
(2, 'Lerato Dlamini', 'Female', '0723456789', 'Soshanguve, Pretoria'),
(3, 'Sipho Nkosi', 'Male', '0734567890', 'Soweto, Johannesburg');

INSERT INTO Dim_Time VALUES
(1, 9, 10, 4, 2026),
(2, 14, 10, 4, 2026),
(3, 18, 10, 4, 2026),
(4, 8, 11, 4, 2026);

INSERT INTO Dim_Clinic VALUES
(1, 'Mamelodi Clinic', 'Mamelodi, Pretoria', '0125551001'),
(2, 'Soshanguve Health Centre', 'Soshanguve, Pretoria', '0125552002');

INSERT INTO Dim_Location VALUES
(1, 'Gauteng', 'Tshwane', 'Mamelodi'),
(2, 'Gauteng', 'Tshwane', 'Soshanguve'),
(3, 'Gauteng', 'Johannesburg', 'Soweto');

INSERT INTO Ambulance_Request VALUES
(1, 1, 1, 1, 1, 1, 'High', 'Completed', 12),
(2, 2, 2, 2, 2, 2, 'Medium', 'Completed', 18),
(3, 3, 1, 3, 3, 3, 'High', 'En Route', 0);