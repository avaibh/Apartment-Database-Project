Q1: Find lastname, firstname, phone number of all persons who is both a tenant and an owner and has more than one bank accounts. 
Also display the apartmentID, street, city and state where they own apartments.

SELECT lastname, firstname, phone, aID as apartmentID, street, city, state
FROM (SELECT B.pID, lastname, firstname, phone
FROM Apartments.bank B 
JOIN Apartments.person P on B.pID = P.pID
WHERE B.pID in (SELECT distinct ownerID FROM Apartments.lease 
WHERE ownerID in (SELECT tenantID FROM Apartments.lease)) 
GROUP BY B.pID having count(*) > 1) t1
JOIN (SELECT aID, ownerID, street, city, state 
FROM Apartments.building 
JOIN Apartments.apartment using(bID)) t2
WHERE t1.pID = t2.ownerID; 


/* Following query tries to find intentional mistake in the database. */
Q2: Find leaseID, apartmentID, rent and lease end date of all the apartments whose lease is expired 
(and thus the database needs to be updated to reflect this). Also find the contact information of the owner and 
the recent tenant (to send them an email if they want to extend the lease). Order it by end date.

SELECT L.leaseID, DATE_ADD(inDate, INTERVAL term month) as EndDate, A.aID, A.rent, 
P1.email OwnerEmail, P2.email TenantEmail
FROM Apartments.lease L
JOIN Apartments.apartment A using(leaseID) 
JOIN Apartments.person P1 on P1.pID = L.ownerID
JOIN Apartments.person P2 on P2.pID = L.tenantID
WHERE DATE_ADD(inDate, INTERVAL term month) < CURDATE()
ORDER BY EndDate;
