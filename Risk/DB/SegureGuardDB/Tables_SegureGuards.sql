CREATE TABLE Roles (
    RoleID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    RoleType VARCHAR(25) NOT NULL,
    Permissions VARCHAR(50) NOT NULL
);

CREATE TABLE People (
    PersonID INTEGER PRIMARY KEY,  -- Cedula de la persona
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
	password_People  VARCHAR(30) NOT NULL,
    Phone VARCHAR(30) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Address_People VARCHAR(100) NOT NULL,
    BirthDate DATE NOT NULL
);

CREATE TABLE Employees (
    EmployeeID INTEGER GENERATED ALWAYS AS IDENTITY
        (START WITH 100 INCREMENT BY 1) PRIMARY KEY, 
    PersonID INTEGER,
    RoleID INTEGER,
    Email VARCHAR(100) NOT NULL UNIQUE, -- Correo coorporativo
    EmploymentStatus VARCHAR(30) NOT NULL,
    CONSTRAINT fk_Person FOREIGN KEY(PersonID) REFERENCES People(PersonID),
    CONSTRAINT fk_Role FOREIGN KEY(RoleID) REFERENCES Roles(RoleID)
);

CREATE TABLE Departments (
    DepartmentID INTEGER GENERATED ALWAYS AS IDENTITY 
        (START WITH 100 INCREMENT BY 5) PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL,
    Description_Departments TEXT,
    EmployeeID INTEGER,  
    CONSTRAINT fk_Employee FOREIGN KEY(EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Entities (
    EntityID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    EntityName VARCHAR(100) NOT NULL,
    EntityAddress VARCHAR(50) NOT NULL,
    EntityPhone VARCHAR(25) NOT NULL,
    RegistrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    MainActivity VARCHAR(50),
    EntityStatus VARCHAR(20),
    PersonID INTEGER,  -- Persona responsable de la identidad
    CONSTRAINT fk_Person FOREIGN KEY(PersonID) REFERENCES People(PersonID)
);

CREATE TABLE Assets (
    AssetID INTEGER GENERATED ALWAYS AS IDENTITY
        (START WITH 100 INCREMENT BY 1) PRIMARY KEY,
    AssetType VARCHAR(50) NOT NULL,
    AssetStatus VARCHAR(50) NOT NULL,
    AssetQuantity INTEGER DEFAULT 1,
    Description_Assets TEXT,
    Brand VARCHAR(30) NOT NULL,
    SerialNumber VARCHAR(30) NOT NULL,
    HardwareDetails VARCHAR(30) NOT NULL,
    SoftwareDetails VARCHAR(30),
    Location_Asset VARCHAR(30) NOT NULL,
    AssetCost DECIMAL(10, 2) NOT NULL,
    EntityID INTEGER,
    CONSTRAINT fk_Entity FOREIGN KEY(EntityID) REFERENCES Entities(EntityID)
);

CREATE TABLE Regulations (
    RegulationID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    RegulationType VARCHAR(30) NOT NULL,
    DescriptionRegulation TEXT,
    EnactmentDate DATE NOT NULL,  -- Fecha de la norma
    StatusRegulation VARCHAR(20) NOT NULL CHECK (StatusRegulation IN ('Vigente', 'Derogada')),
    AssetID INTEGER,
    CONSTRAINT fk_Asset FOREIGN KEY(AssetID) REFERENCES Assets(AssetID)
);

CREATE TABLE Risks (
    RiskID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    RiskType VARCHAR(50),
    Description_Risks TEXT
);

CREATE TABLE ActionPlans (
    PlanID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    PlanType VARCHAR(30) NOT NULL,
    DescriptionAction TEXT,
    CreationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdateDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    StatusAction VARCHAR(20) NOT NULL CHECK (StatusAction IN ('En Proceso', 'Finalizado')),
    EntityID INTEGER,
    AssetID INTEGER,
    EmployeeID INTEGER,
    RiskID INTEGER,
    CONSTRAINT fk_Entity FOREIGN KEY(EntityID) REFERENCES Entities(EntityID),
    CONSTRAINT fk_Asset FOREIGN KEY(AssetID) REFERENCES Assets(AssetID),
    CONSTRAINT fk_Employee FOREIGN KEY(EmployeeID) REFERENCES Employees(EmployeeID),
    CONSTRAINT fk_Risk FOREIGN KEY(RiskID) REFERENCES Risks(RiskID)
);

CREATE TABLE Events (
    EventID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    EventType VARCHAR(30) NOT NULL,
    DescriptionEvents TEXT,
    EntityID INTEGER,
    AssetID INTEGER,
    RiskID INTEGER,
    EventDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_Entity FOREIGN KEY(EntityID) REFERENCES Entities(EntityID),
    CONSTRAINT fk_Asset FOREIGN KEY(AssetID) REFERENCES Assets(AssetID),
    CONSTRAINT fk_Risk FOREIGN KEY(RiskID) REFERENCES Risks(RiskID)
);

CREATE TABLE Notifications (
    NotificationID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    CommunicationChannel VARCHAR(100) NOT NULL,
    DescriptionNotifocations TEXT,
    EventID INTEGER,
    CONSTRAINT fk_Event FOREIGN KEY(EventID) REFERENCES Events(EventID)
);

CREATE TABLE Tests (
    TestID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    TestType VARCHAR(30) NOT NULL,
    DescriptionTests TEXT,
    StartDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    EndDate DATE,
    StatusTests VARCHAR(20) NOT NULL CHECK (StatusTests IN ('En Revisión', 'En Proceso', 'Completado')),
    EmployeeID INTEGER,
    CONSTRAINT fk_Employee FOREIGN KEY(EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE History (
    HistoryID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    AffectedTable VARCHAR(50) NOT NULL,
    Operation VARCHAR(20) NOT NULL,  
    OperationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    EmployeeID INTEGER, 
    OldValue TEXT,  
    NewValue TEXT,  
    PrimaryKeyAffected INTEGER,  
    CONSTRAINT fk_Employee FOREIGN KEY(EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE AuditLogs (
    AuditID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ActionAudit VARCHAR(50) NOT NULL,        
    Entity VARCHAR(50) NOT NULL,       
    TimestampAudit TIMESTAMP NOT NULL,      
    PersonID INTEGER,      
    FirstName VARCHAR(100) NOT NULL,    
    Class VARCHAR(255),                
    IPAddress VARCHAR(45),             
    UserAgent VARCHAR(255),
	CONSTRAINT fk_Person FOREIGN KEY(PersonID) REFERENCES People(PersonID)             
);
