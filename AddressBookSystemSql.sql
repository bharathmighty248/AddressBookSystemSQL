Create Database AddressBookSystem

Use AddressBookSystem

Create Table AddressBook(
ContactId int identity(1,1) Primary Key,
FirstName varchar(20) not null,
LastName varchar(20) not null,
Address varchar(100) not null, 
City varchar(50) not null,
State varchar(200) not null,
Zip bigint not null ,
PhoneNumber bigint not null,
Email varchar(50)not null
)

Select * From AddressBook

Insert into AddressBook (FirstName,LastName,Address,City,State,Zip,PhoneNumber,Email) values('Bharath', 'Pasumarthi', 'Kunkalamarru', 'Karamchedu', 'AP', '523168', '1111111111', 'bharath@gmail.com')
Insert into AddressBook (FirstName,LastName,Address,City,State,Zip,PhoneNumber,Email) values('Sriram', 'Suragani', 'Parchur', 'Parchur', 'AP', '523169', '2222222222', 'sriram@gmail.com')
Insert into AddressBook (FirstName,LastName,Address,City,State,Zip,PhoneNumber,Email) values('Nagoor', 'Noorbasha', 'Nagulapalem', 'Parchur', 'AP', '523169', '3333333333', 'nagoor@gmail.com')
Insert into AddressBook (FirstName,LastName,Address,City,State,Zip,PhoneNumber,Email) values('Sai', 'Undavalli', 'Ameerpet', 'Hyderabad', 'TS', '500018', '4444444444', 'sai@gmail.com')
Insert into AddressBook (FirstName,LastName,Address,City,State,Zip,PhoneNumber,Email) values('Nagu', 'Naramamidi', 'Chagallu', 'WestGodavari', 'AP', '534342', '5555555555', 'nagu@gmail.com')
Insert into AddressBook (FirstName,LastName,Address,City,State,Zip,PhoneNumber,Email) values('Rajendra', 'Pasumarthi', 'Kunkalamarru', 'Karamchedu', 'AP', '523168', '6666666666', 'rajendra@gmail.com')

Select * From AddressBook

Update AddressBook Set Address='Karamchedu' Where FirstName='Bharath'

Delete from AddressBook Where FirstName='Nagu'
