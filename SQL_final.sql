CREATE DATABASE DuAn2_Test
go


IF OBJECT_ID('Status') IS NOT NULL
	DROP TABLE Status
GO
CREATE TABLE Status
(
	ID					int identity(1,1) not null,
	Status				Nvarchar(50) not null,
	CONSTRAINT PK_Status PRIMARY KEY(ID),	
)

IF OBJECT_ID('Customer') IS NOT NULL
	DROP TABLE Customer
GO
CREATE TABLE Customer
(
	Phone				VARCHAR(12)  not null,
	Password			VARCHAR(250) not null,
	FullName			NVARCHAR(50) not null,
	Email				NVARCHAR(50) not null,
	Address				NVARCHAR(50) not null,
	BirthdayBaby		date,
	Note				NVARCHAR(250) not null,
	CONSTRAINT PK_Customer PRIMARY KEY(Phone),
)
insert into Customer(Phone,Password,FullName,Email,Address,BirthdayBaby,Note) values('0962064263',N'123',N'Lê Sỹ Chính','chinhlsph@gmail.com',N'126 Nguyễn Đổng Chi','08/07/2000','Hello CHÍNH');
insert into Customer(Phone,Password,FullName,Email,Address,BirthdayBaby,Note) values('0123456789',N'123',N'Nguyễn Hoàng Anh','giap@gamil.com',N'126 Hoàng Cầu','09/07/2000','Hello Anh');
insert into Customer(Phone,Password,FullName,Email,Address,BirthdayBaby,Note) values('0987654321',N'123',N'Nguyễn Duy Quân','Quan@gmail.com',N'Khương Trung','05/07/2000','Hello Quân');
select * from Customer

IF OBJECT_ID('Shift') IS NOT NULL
	DROP TABLE Shift
GO
CREATE TABLE Shift
(
	ID					int identity(1,1) not null,
	NameShift			Nvarchar(50) not null,
	TimeSlot			Nvarchar(50) not null,
	CONSTRAINT PK_Shift PRIMARY KEY(ID),
)
IF OBJECT_ID('Recruitment') IS NOT NULL
	DROP TABLE Recruitment
GO
CREATE TABLE Recruitment
(
	ID					int identity(1,1) not null,
	StaffName			NVARCHAR(50) NOT NULL,
	BirthDay			date,
	Gender				Bit not null,
	Phone				VARCHAR(12) not null,
	Email				NVARCHAR(50) NOT NULL,
	Address				NVARCHAR(100) NOT NULL,
	HomeTown			NVARCHAR(100) NOT NULL,
	Images				NVARCHAR(100) NOT NULL,
	PeopleID			NVARCHAR(100) NOT NULL,
	AcountNumberBank	NVARCHAR(100) NOT NULL,
	Experience			NVARCHAR(50) NULL,
	Degree				NVARCHAR(50) NULL,
	Role				NVARCHAR(50) NOT NULL,
	Note				NVARCHAR(250) NULL,
	CONSTRAINT PK_Recruitment PRIMARY KEY(ID),
)
insert into Recruitment(StaffName,BirthDay,Gender,Phone,Email,Address,HomeTown,Images,PeopleID,AcountNumberBank,Experience,Degree,Role,Note) values(N'Cao Trọng Giap','08/07/2000',1,'0987654323','Giapct@gmail.com',N'126 Nguyễn Đổng Chi',N'Nghệ An','anh1.jpg','03547285618','09172476154325',N'3 năm',N'Chứng chỉ chăm sóc trẻ em',N'Nhân viên chăm sóc','hello');
insert into Recruitment(StaffName,BirthDay,Gender,Phone,Email,Address,HomeTown,Images,PeopleID,AcountNumberBank,Experience,Degree,Role,Note) values(N'Lê Văn Luyện','08/07/2003',1,'0987654323','Luyenct@gmail.com',N'126 Nguyễn Đổng Chi',N'Nghệ An','anh1.jpg','03547285618','09172476154325',N'3 năm',N'Chứng chỉ chăm sóc trẻ em',N'Nhân viên chăm sóc','hello');
select * from Recruitment
IF OBJECT_ID('Staff') IS NOT NULL
	DROP TABLE Staff
GO
CREATE TABLE Staff
(
	Username			VARCHAR(50) not null,
	Password			VARCHAR(250) not null,
	Recruitment_ID		int not null,
	StaffName			NVARCHAR(50) NOT NULL,
	BirthDay			date,
	Gender				BIT not null,
	Phone				VARCHAR(12) not null,
	Email				NVARCHAR(50) NOT NULL,
	Address				NVARCHAR(100) NOT NULL,
	HomeTown			NVARCHAR(100) NOT NULL,
	Images				NVARCHAR(100) NOT NULL,
	PeopleID			NVARCHAR(100),
	AcountNumberBank	NVARCHAR(100),
	Experience			NVARCHAR(50) NULL,
	Degree				NVARCHAR(50) NULL,
	Role				NVARCHAR(50) NOT NULL,
	Note				NVARCHAR(250)NULL,
	CONSTRAINT PK_Staff PRIMARY KEY(Username),
	FOREIGN KEY(Recruitment_ID) REFERENCES Recruitment,
)
insert into Staff(Username,Password,Recruitment_ID,StaffName,BirthDay,Gender,Phone,Email,Address,HomeTown,Images,PeopleID,AcountNumberBank,Experience,Degree,Role,Note) values('chinhls1234','123', 1,N'Cao Trọng Giap','08/07/2000',1,'0987654323','Giapct@gmail.com',N'126 Nguyễn Đổng Chi',N'Nghệ An','anh1.jpg','03547285618','09172476154325',N'3 năm',N'Chứng chỉ chăm sóc trẻ em',N'Nhân viên chăm sóc','hello');
select * from Staff 

IF OBJECT_ID('Oders') IS NOT NULL
	DROP TABLE Oders
GO
CREATE TABLE Oders
(
	ID					int identity(1,1) not null,
	Phone_Customer		varchar(12) not null,
	Date				DATE,
	ID_Shift			int not null,
	CONSTRAINT PK_Oders PRIMARY KEY(ID),	
	FOREIGN KEY(Phone_Customer) REFERENCES Customer,
	FOREIGN KEY(ID_Shift) REFERENCES Shift,
)


IF OBJECT_ID('OrderDetail') IS NOT NULL
	DROP TABLE OrderDetail
GO
CREATE TABLE OrderDetail
(
	ID					int identity(1,1) not null,
	ID_Order            int not null,
	Username			VARCHAR(50) not null,
	StaffName			NVARCHAR(50) NOT NULL,
	Phone				varchar(12)  not null,
	CustomerName		NVARCHAR(50) not null,
	Address				NVARCHAR(50) not null,
	Date				date,
	TimeSlot			Nvarchar(50) not null,
	ServiceName			NVARCHAR(50) not null,
	Price				NVARCHAR(50) not null,
	ID_Status			int not null,
	Status				NVARCHAR(50) NOT NULL,
	CONSTRAINT PK_OrderDetail PRIMARY KEY(ID),
	FOREIGN KEY(ID_Order) REFERENCES Oders,
	FOREIGN KEY(Phone) REFERENCES Customer,
	FOREIGN KEY(Username) REFERENCES Staff,
	FOREIGN KEY(ID_Status) REFERENCES Status,
)
IF OBJECT_ID('History') IS NOT NULL
	DROP TABLE History
GO
CREATE TABLE History
(
	ID					int identity(1,1) not null,
	ReferenceId			int,
	Username			VARCHAR(50) not null,
	StaffName			NVARCHAR(50) NOT NULL,
	Phone				varchar(12)  not null,
	CustomerName		NVARCHAR(50) not null,
	Address				NVARCHAR(50) not null,
	Date				date,
	TimeSlot			Nvarchar(50) not null,
	ServiceName			NVARCHAR(50) not null,
	Price				NVARCHAR(50) not null,
	ID_Status			int not null,
	Status				NVARCHAR(50) NOT NULL,
	InsertUsername		VARCHAR(50) not null,
	UpdatedUsername VARCHAR(50) not null,
	DeleteUsername VARCHAR(50) not null,
	CONSTRAINT PK_History PRIMARY KEY(ID),
)


IF OBJECT_ID('CaregiverSchedule') IS NOT NULL
	DROP TABLE CaregiverSchedule
GO
CREATE TABLE CaregiverSchedule
(
	ID					int identity(1,1) not null,
	Date				date not null,
	ID_Shift			int not null,
	NameShift			Nvarchar(50) not null,
	Username			VARCHAR(50) not null,
	CONSTRAINT PK_CaregiverSchedule PRIMARY KEY(ID),
	FOREIGN KEY(ID_Shift) REFERENCES Shift,
	FOREIGN KEY(Username) REFERENCES Staff,
)

IF OBJECT_ID('VacationSchedule') IS NOT NULL
	DROP TABLE VacationSchedule
GO
CREATE TABLE VacationSchedule
(
	ID					int identity(1,1) not null,
	Holiday				date not null,
	CONSTRAINT PK_VacationSchedule PRIMARY KEY(ID),
)

IF OBJECT_ID('Comment') IS NOT NULL
	DROP TABLE Comment
GO
CREATE TABLE Comment
(
	ID					int identity(1,1) not null,
	Comment				Nvarchar(max) null,
	CONSTRAINT PK_Comment PRIMARY KEY(ID),
)


