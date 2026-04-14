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