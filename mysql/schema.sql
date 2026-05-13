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
