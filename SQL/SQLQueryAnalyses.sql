
---Select all coloums from dim ambulance
SELECT * FROM Dim_Ambulance;

---How many emergencies happened in your system
SELECT COUNT(*) AS total_requests
FROM Ambulance_Request;


---How fast ambulances respond on average
SELECT AVG(response_time) AS avg_response_time
FROM Ambulance_Request;


---Which clinics request ambulances the most
SELECT 
    c.clinic_name,
    COUNT(r.request_id) AS total_requests
FROM Ambulance_Request r
JOIN Dim_Clinic c ON r.clinic_id = c.clinic_id
GROUP BY c.clinic_name
ORDER BY total_requests DESC;


---Which ambulance is used the most
SELECT 
    a.registration_number,
    COUNT(r.request_id) AS total_requests
FROM Ambulance_Request r
JOIN Dim_Ambulance a ON r.ambulance_id = a.ambulance_id
GROUP BY a.registration_number
ORDER BY total_requests DESC;


----Which areas have the most emergencies
SELECT 
    l.town_village,
    COUNT(r.request_id) AS total_requests
FROM Ambulance_Request r
JOIN Dim_Location l ON r.location_id = l.location_id
GROUP BY l.town_village
ORDER BY total_requests DESC;


----What time emergencies happen most
SELECT 
    t.hour,
    COUNT(r.request_id) AS total_requests
FROM Ambulance_Request r
JOIN Dim_Time t ON r.time_id = t.time_id
GROUP BY t.hour
ORDER BY total_requests DESC;


----Focus only on serious emergencies
SELECT 
    r.request_id,
    p.name,
    r.response_time,
    r.status
FROM Ambulance_Request r
JOIN Dim_Patient p ON r.patient_id = p.patient_id
WHERE r.urgency_level = 'High';



----Which ambulance responds the fastest
SELECT 
    a.registration_number,
    AVG(r.response_time) AS avg_response_time
FROM Ambulance_Request r
JOIN Dim_Ambulance a ON r.ambulance_id = a.ambulance_id
GROUP BY a.registration_number
ORDER BY avg_response_time ASC;



