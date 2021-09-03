/*UC1*/
Create Database AddressBookSystem

Use AddressBookSystem

/*UC2*/
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

/*UC3*/
Insert into AddressBook (FirstName,LastName,Address,City,State,Zip,PhoneNumber,Email) values('Bharath', 'Pasumarthi', 'Kunkalamarru', 'Karamchedu', 'AP', '523168', '1111111111', 'bharath@gmail.com')
Insert into AddressBook (FirstName,LastName,Address,City,State,Zip,PhoneNumber,Email) values('Sriram', 'Suragani', 'Parchur', 'Parchur', 'AP', '523169', '2222222222', 'sriram@gmail.com')
Insert into AddressBook (FirstName,LastName,Address,City,State,Zip,PhoneNumber,Email) values('Nagoor', 'Noorbasha', 'Nagulapalem', 'Parchur', 'AP', '523169', '3333333333', 'nagoor@gmail.com')
Insert into AddressBook (FirstName,LastName,Address,City,State,Zip,PhoneNumber,Email) values('Sai', 'Undavalli', 'Ameerpet', 'Hyderabad', 'TS', '500018', '4444444444', 'sai@gmail.com')
Insert into AddressBook (FirstName,LastName,Address,City,State,Zip,PhoneNumber,Email) values('Nagu', 'Naramamidi', 'Chagallu', 'WestGodavari', 'AP', '534342', '5555555555', 'nagu@gmail.com')
Insert into AddressBook (FirstName,LastName,Address,City,State,Zip,PhoneNumber,Email) values('Rajendra', 'Pasumarthi', 'Kunkalamarru', 'Karamchedu', 'AP', '523168', '6666666666', 'rajendra@gmail.com')

Select * From AddressBook

/*UC4*/
Update AddressBook Set Address='Karamchedu' Where FirstName='Bharath'

/*UC5*/
Delete from AddressBook Where FirstName='Nagu'

/*UC6*/
Select * From AddressBook Where City='Parchur' or State='TS'

/*UC7*/
Select Count(City) as 'NumberOfContacts' from AddressBook Where City='Parchur' Group by City
Select Count(State) as 'NumberOfContacts' from AddressBook Where State='AP' Group by State

/*UC8*/
/* ASC for Ascending order And DESC for Descending order */
Select * From AddressBook Where City='Parchur' Order by FirstName ASC

/*UC9*/
Alter Table AddressBook 
Add AddressBookName varchar(50), AddressBookType varchar(50)

Update AddressBook set AddressBookName='Family AddressBook', AddressBookType='Family' Where FirstName='Bharath'
Update AddressBook set AddressBookName='Family AddressBook', AddressBookType='Family' Where FirstName='Rajendra'
Update AddressBook set AddressBookName='Friend AddressBook', AddressBookType='Friend' Where FirstName='Sriram'
Update AddressBook set AddressBookName='Friend AddressBook', AddressBookType='Friend' Where FirstName='Nagoor'
Update AddressBook set AddressBookName='Professional AddressBook', AddressBookType='Professional' Where FirstName='Sai'

/*UC10*/
Select Count(AddressBookType)As 'NumberOfContacts' From AddressBook Where AddressBookType='Friend'

/*UC11*/
Insert into AddressBook values ('SaiLokesh', 'Motupalli', 'Nagulapalem', 'Parchur', 'AP', '523169', '7777777777', 'sailokesh@gmail.com', 'Family AddressBook', 'Family'),
('SaiLokesh', 'Motupalli', 'Nagulapalem', 'Parchur', 'AP', '523169', '7777777777', 'sailokesh@gmail.com', 'Friend AddressBook', 'Friend')

/*UC12*/
Create Table Address
(
AddressId int not null Identity(1,1) Primary key,
Address varchar(200) not null,
City varchar(50) not null,
State varchar(50) not null,
Zip bigint not null
)

Insert Into Address values
('Kunkalamarru','Karamchedu','AP','523168'),
('Nagulapalem','Parchur','AP','523169'),
('Parchur','Parchur','AP','523169'),
('Chagallu','WestGodavari','AP','534342'),
('Ameerpet','Hyderabad','TS','500018')

Select * From Address;

Create Table ContactType
(
ContactTypeId int not null Identity(1,1) Primary key,
ContactTypeName varchar(100) not null
)

Insert Into ContactType values
('Family'),
('Friends'),
('Profession')

select * from ContactType;

Create Table Contact
(
ContactId int not null Identity(1,1) primary key,
FirstName varchar(30) not null,
LastName varchar(30) not null,
PhoneNumber bigint not null,
Email varchar(100) not null,
AddressId int not null Foreign Key References Address(AddressId),
ContactTypeId int not null Foreign key References ContactType(ContactTypeId)
)

Insert Into Contact values
('Bharath','Pasumarthi','1111111111','bharath@gmail,com','1','1'),
('Nagoor','Noorbasha','2222222222','nagoor@gmail,com','2','2'),
('Sriram','Suragani','3333333333','sriram@gmail,com','3','2'),
('Nagu','Naramamidi','4444444444','nagu@gmail,com','4','3'),
('Sai','Undavalli','5555555555','sai@gmail,com','5','2')

Select * From Contact

Select * From Contact c, Address a, ContactType ct
Where c.AddressId=a.AddressId And c.ContactTypeId=ct.ContactTypeId

/*UC13*/
Select * From Contact
Join Address                                                          /*UC6*/
on Contact.AddressId=Address.AddressId
Where City='Parchur' or State='TS'

Select Count(FirstName) as 'NumberOfContacts' from Contact
Join Address 
on Contact.AddressId=Address.AddressId 
Where City='Parchur' Group by City
                                                                       /*UC7*/
Select Count(FirstName) as 'NumberOfContacts' from Contact
Join Address 
on Contact.AddressId=Address.AddressId
Where State='AP' Group by State

Select * From Contact 
Join Address 
on Contact.AddressId=Address.AddressId                                 /*UC8*/
Where City='Parchur' Order by FirstName ASC

Select Count(FirstName) as 'NumberOfContacts' from Contact
Join ContactType 
on Contact.ContactTypeId=ContactType.ContactTypeId                    /*UC10*/
Where ContactTypeName='Friends' Group by ContactTypeName