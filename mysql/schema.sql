CREATE DATABASE IF NOT EXISTS AbyssiniaGrandHotel;
USE AbyssiniaGrandHotel; 
CREATE TABLE RoomType(
TypeID INT auto_increment PRIMARY KEY, 
TypaName varchar(50) NOT NULL, 
PricePerNight decimal(10, 2) NOT NULL, 
MaxOccupancy INT NOT NULL
); 
CREATE TABLE Guest( 
GuestID int auto_increment primary key,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL, 
Email varchar(100) UNIQUE, 
ID_Number varchar(50) UNIQUE NOT NULL
); 
CREATE TABLE GuestPhone (
    PhoneID INT AUTO_INCREMENT PRIMARY KEY,
    GuestID INT,
    PhoneNumber VARCHAR(20) NOT NULL,
    FOREIGN KEY (GuestID) REFERENCES Guest(GuestID) ON DELETE CASCADE
);

CREATE TABLE Room (
    RoomNumber INT PRIMARY KEY,
    TypeID INT,
    Floor INT,
    Status ENUM('Available', 'Occupied', 'Maintenance') DEFAULT 'Available',
    FOREIGN KEY (TypeID) REFERENCES RoomType(TypeID)
);

 ServiceUsage Table (Junction table
for Booking <-> Service)
CREATE TABLE ServiceUsage(
UsageID INT AUTO_INCREMENT
PRIMARY KEY,
BookingID INT,
ServiceID INT,
Quantity INT DEFAULT I,
ServiceDate DATE,
SubTotal DECIMAL (10, z),
FOREIGN KEY (BookingID) REFERENCES
Booking (BookingID) ON DELETE CASCADE,
FOREIGN KEY (ServiceID) REFERENCES
Service (ServiceID)
);

CREATE TABLE Payment (
PaymentID INT AUTO_INCREMENT
PRIMARY KEY,
BookingID INT,
Amount DECIMAL (10, 2) NOT NULL,
Method ENUM('Cash', 'Credit Card',
'Telebirr', 'Bank Transfer'),
PaymentDate TIMESTAMP DEFAULT
CURRENT_TIMESTAMP,
FOREIGN KEY (BookingID) REFERENCES
Booking (BookingID)
);
CREATE TABLE Booking (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    GuestID INT,
    RoomNumber INT,
    CheckIn DATE NOT NULL,
    CheckOut DATE NOT NULL,
    TotalBaseCost DECIMAL(10, 2),
    FOREIGN KEY (GuestID) REFERENCES Guest(GuestID),
    FOREIGN KEY (RoomNumber) REFERENCES Room(RoomNumber)
);
CREATE TABLE Service (
    ServiceID INT AUTO_INCREMENT PRIMARY KEY,
    ServiceName VARCHAR(100) NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL
);
