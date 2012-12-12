CREATE TABLE [dbo].[JobSeeker]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [firstName] NCHAR(20) NULL, 
    [middleName] NCHAR(20) NULL, 
    [lastName] NCHAR(10) NULL, 
    [userName] NCHAR(10) NULL, 
    [email] NCHAR(10) NULL, 
    [currentAddress] NCHAR(30) NULL, 
    [currentState] NCHAR(10) NULL, 
    [zipCode] NCHAR(10) NULL, 
    [phone] NCHAR(10) NULL, 
    [nationality] NCHAR(10) NULL
)
