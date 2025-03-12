create table company( Company_name varchar(100),
Address  varchar(100),
Telephone_number varchar(100),
email varchar(100),
constraint primcompany primary key(Company_name));

create table Medecines( Medecine_Id int,
selling_price float,
Amount int,
med_name varchar(100),
exp_date datetime,
Company_name varchar(100),
Amount_produced float,
Buying_price float,

constraint primmedecines primary key(Medecine_Id),
constraint foreignk foreign key(Company_name) references company(Company_name)
);

create table Patient ( SSN int,
Patient_Name varchar(100),
Address varchar(100),
Insuranceexpdate datetime,


constraint primpat primary key(SSN)
);

create table Doctor ( SSN int,
email varchar(100),
Doctor_Name varchar(100),
Tel_number varchar(100),
Address varchar(100),


constraint primpat primary key(SSN)
);


CREATE TABLE `staff` (
  `staff_SSN` int NOT NULL,
  `salary` float DEFAULT NULL,
  `Staff_Name` varchar(100) DEFAULT NULL,
  `Tel_number` varchar(100) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`staff_SSN`)
);


create table Pharmacists ( Pharmacists_SSN int,
email varchar(100),
yearofexp int,
grade_date datetime,
constraint foreign key (Pharmacists_SSN) references staff (staff_SSN),
constraint primpat primary key(Pharmacists_SSN)
);

CREATE TABLE Assistant_Pharmacists (
    Pharmacists_SSN INT,
    startinterndate DATETIME,
    endinterndate DATETIME,
    college VARCHAR(100),
    CONSTRAINT forphar FOREIGN KEY (Pharmacists_SSN) REFERENCES staff (staff_SSN),
    CONSTRAINT primpat PRIMARY KEY (Pharmacists_SSN)
);



create table Patient_allergies ( Patient_SSN int,
allergies varchar(100),
telephone_number VARCHAR(15),
constraint forpattel foreign key (Patient_SSN) references patient (SSN),
constraint primpat primary key(Patient_SSN,telephone_number)
);


create table prescribes
(DoctorSSN int,
 medecineSSN int,
PatientSSN int,
numberofdosage int,
bonus int,
constraint forkeyper foreign key (DoctorSSN) references doctor(SSN),
constraint forkey2per foreign key (medecineSSN) references medecines (Medecine_Id),
constraint forkey3per foreign key (PatientSSN) references patient (SSN),
constraint primkyper primary key(DoctorSSN,medecineSSN,PatientSSN));

create table buys
(MedecineID int,
 staffSSN int,
PatientSSN int,
discount float,
bonus int,
constraint forkeybuy foreign key (staffSSN) references staff(staff_SSN),
constraint forkey2buy foreign key (MedecineID) references medecines (Medecine_Id),
constraint forkey3buy foreign key (PatientSSN) references patient (SSN),
constraint primkybuy primary key(staffSSN,MedecineID,PatientSSN));





CREATE TABLE `patient_telephonenumber` (
  `Patient_SSN` int NOT NULL,
  `telephone_number` varchar(100) NOT NULL,
  PRIMARY KEY (`Patient_SSN`,`telephone_number`),
  CONSTRAINT `fk_patient_telephonenumber` FOREIGN KEY (`Patient_SSN`) REFERENCES `patient` (`SSN`)
) ;

INSERT INTO company (Company_name, Address, Telephone_number, email) 
VALUES
('PharmaCorp', '123 Main St', '123-456-7890', 'contact@pharmacorp.com'),
('MediTech', '456 Oak Rd', '987-654-3210', 'info@meditech.com'),
('HealthPlus', '789 Pine Blvd', '555-123-4567', 'support@healthplus.com'),
('CurePharma', '101 Maple Ave', '444-777-8888', 'sales@curepharma.com');

INSERT INTO Medecines (Medecine_Id, selling_price, Amount, med_name, exp_date, Company_name, Amount_produced, Buying_price) 
VALUES
(1, 10.5, 50, 'Aspirin', '2025-12-31', 'PharmaCorp', 1000, 5.0),
(2, 20.0, 30, 'Paracetamol', '2026-06-30', 'MediTech', 500, 12.0),
(3, 15.0, 100, 'Ibuprofen', '2027-02-28', 'HealthPlus', 2000, 8.0),
(4, 25.0, 60, 'Amoxicillin', '2025-11-15', 'CurePharma', 1500, 18.0);

INSERT INTO Patient (SSN, Patient_Name, Address, Insuranceexpdate) 
VALUES
(1001, 'Ahmed Ali', '123 Main St', '2025-06-30'),
(1002, 'Mona Hassan', '456 Oak Rd', '2026-12-31'),
(1003, 'Sara Khaled', '789 Pine Blvd', '2027-03-15'),
(1004, 'Mohamed Fawzy', '101 Maple Ave', '2025-11-01');

INSERT INTO Doctor (SSN, email, Doctor_Name, Tel_number, Address) 
VALUES
(2001, 'dr.ahmed@clinic.com', 'Dr. Ahmed', '555-999-3333', 'Hospital A'),
(2002, 'dr.mona@health.com', 'Dr. Mona', '555-888-4444', 'Clinic B'),
(2003, 'dr.sara@care.com', 'Dr. Sara', '555-777-5555', 'Health Center C'),
(2004, 'dr.mohamed@med.com', 'Dr. Mohamed', '555-666-7777', 'Clinic D');

INSERT INTO staff (staff_SSN, salary, Staff_Name, Tel_number, Address) 
VALUES
(4001, 5000.0, 'John Doe', '555-123-6789', '123 Elm St'),
(4002, 4500.0, 'Jane Smith', '555-234-7890', '456 Oak St'),
(4003, 5500.0, 'Alex Johnson', '555-345-8901', '789 Pine St'),
(4004, 6000.0, 'Emily Davis', '555-456-9012', '101 Maple Ave');


INSERT INTO staff (staff_SSN, salary, Staff_Name, Tel_number, Address) 
VALUES
(4005,5000.0, 'John Doe', '555-123-6789', '123 Elm St'),
(4006,4500.0, 'Jane Smith', '555-234-7890', '456 Oak St'),
(4007,5500.0, 'Alex Johnson', '555-345-8901', '789 Pine St'),
(4008,6000.0, 'Emily Davis', '555-456-9012', '101 Maple Ave');

INSERT INTO Assistant_Pharmacists (Pharmacists_SSN, startinterndate, endinterndate, college) 
VALUES
(4001, '2023-06-01', '2023-12-01', 'University of Cairo'),
(4002, '2023-03-01', '2023-09-01', 'Alexandria University'),
(4003, '2023-01-01', '2023-07-01', 'Ain Shams University'),
(4004, '2023-05-01', '2023-11-01', 'Mansoura University');

INSERT INTO Pharmacists (Pharmacists_SSN, email, yearofexp, grade_date) 
VALUES
(4005, 'pharma1@company.com', 5, '2020-01-01'),
(4006, 'pharma2@company.com', 3, '2021-02-15'),
(4007, 'pharma3@company.com', 7, '2019-03-20'),
(4008, 'pharma4@company.com', 4, '2022-06-10');

INSERT INTO Patient_allergies (Patient_SSN, allergies) 
VALUES
(1001, 'Peanuts'),
(1002, 'Dust'),
(1003, 'Pollen'),
(1004, 'Shellfish');

INSERT INTO patient_telephonenumber (Patient_SSN, telephone_number) 
VALUES
(1001, '555-111-1234'),
(1002, '555-222-2345'),
(1003, '555-333-3456'),
(1004, '555-444-4567');


INSERT INTO prescribes (DoctorSSN, medecineSSN, PatientSSN, numberofdosage, bonus) 
VALUES
(2001, 1, 1001, 2, 10),
(2002, 2, 1002, 3, 15),
(2003, 3, 1003, 1, 20),
(2004, 4, 1004, 4, 25);

INSERT INTO buys (MedecineID, staffSSN, PatientSSN, discount, bonus) 
VALUES
(1, 4001, 1001, 0.1, 5),
(2, 4002, 1002, 0.15, 7),
(3, 4003, 1003, 0.2, 10),
(4, 4004, 1004, 0.25, 12);