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