-- Create a new table called 'departments' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.departments', 'U') IS NOT NULL
DROP TABLE dbo.departments
GO
-- Create the table in the specified schema
CREATE TABLE dbo.departments
(
    department_Id INT NOT NULL PRIMARY KEY,
    department_name [NVARCHAR] (50) NOT NULL 

);
GO
-- Insert rows into table 'departments'
INSERT dbo.departments
( -- columns to insert data into
 [department_Id], [department_name]
)
VALUES
(1, 'Sales'),(2, 'Marketing'),(3, 'Finance'),(4, 'General Opeataion'),(5, 'Foundry')
-- add more rows here
GO
-- Create a new table called 'employees' in schema 'dbo'
-- Drop the table if it already exists

IF OBJECT_ID('dbo.employees', 'U') IS NOT NULL
DROP TABLE dbo.employees
GO
-- Create the table in the specified schema
CREATE TABLE dbo.employees
(
    employee_id INT NOT NULL PRIMARY KEY, -- primary key column
    employee_ssn INT NOT NULL,
    employee_lastname [NVARCHAR](50) NOT NULL,
    employee_firstname [NVARCHAR](50) NOT NULL,
    employee_jobtitle [NVARCHAR](50) NOT NULL,
    employee_departmentID INT NOT NULL FOREIGN KEY REFERENCES departments(department_Id),
    employee_birthdate date NOT NULL,
    -- specify more columns here
);
GO

-- Insert rows into table 'employees'
INSERT dbo.employees
( -- columns to insert data into
 [employee_id], [employee_ssn], [employee_lastname], [employee_firstname],[employee_jobtitle], [employee_departmentID], [employee_birthdate]
)
VALUES
( -- first row: values for the columns in the list above
 1, 010203, 'Obesekara', 'Gimhan' , 'Sales' , 01 , '1998-05-31' 
),
(2, 040506, 'Karunarathne', 'Dinuka', 'Manager', 05, '1977-06-24'),
(3, 070809, 'Padukoon', 'Deepika', 'Actress', 03, '1995-03-29'),
(4, 010407, 'Samaranayake', 'Sudath', 'Nurse', 02, '1997-06-18'),
(5, 020508, 'Siriwardane', 'Ushan', 'Clark', 04 , '1994-11-19')
-- add more rows here
GO
