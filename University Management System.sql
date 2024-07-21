
CREATE TABLE User (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100),
    user_mobile VARCHAR(15),
    user_email VARCHAR(100),
    user_address VARCHAR(255)
);

CREATE TABLE Login (
    login_id INT PRIMARY KEY,
    login_username VARCHAR(50),
    user_password VARCHAR(50),
    login_role_id INT,
    FOREIGN KEY (login_role_id) REFERENCES Roles(role_id)
);

CREATE TABLE Roles (
    role_id INT PRIMARY KEY,
    role_name VARCHAR(50),
    role_desc VARCHAR(255)
);

CREATE TABLE Permission (
    per_id INT PRIMARY KEY,
    per_name VARCHAR(100),
    per_module VARCHAR(100),
    per_role_id INT,
    FOREIGN KEY (per_role_id) REFERENCES Roles(role_id)
);

CREATE TABLE Course (
    crs_id INT PRIMARY KEY,
    crs_name VARCHAR(100),
    crs_desc VARCHAR(255),
    crs_type VARCHAR(50)
);

CREATE TABLE Student (
    stu_id INT PRIMARY KEY,
    stu_name VARCHAR(100),
    stu_pass VARCHAR(50),
    stu_mobile VARCHAR(15),
    stu_add VARCHAR(255),
    stu_email VARCHAR(100)
);

CREATE TABLE College (
    col_id INT PRIMARY KEY,
    col_name VARCHAR(100),
    col_desc VARCHAR(255),
    col_type VARCHAR(50)
);

CREATE TABLE Registration (
    reg_id INT PRIMARY KEY,
    reg_stu_id INT,
    reg_date DATE,
    reg_type VARCHAR(50),
    FOREIGN KEY (reg_stu_id) REFERENCES Student(stu_id)
);

CREATE TABLE UserRole (
    user_id INT,
    role_id INT,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (role_id) REFERENCES Roles(role_id)
);

CREATE TABLE StudentCourse (
    stu_id INT,
    crs_id INT,
    PRIMARY KEY (stu_id, crs_id),
    FOREIGN KEY (stu_id) REFERENCES Student(stu_id),
    FOREIGN KEY (crs_id) REFERENCES Course(crs_id)
);

CREATE TABLE CollegeCourse (
    col_id INT,
    crs_id INT,
    PRIMARY KEY (col_id, crs_id),
    FOREIGN KEY (col_id) REFERENCES College(col_id),
    FOREIGN KEY (crs_id) REFERENCES Course(crs_id)
);

CREATE TABLE UserPermission (
    user_id INT,
    per_id INT,
    PRIMARY KEY (user_id, per_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (per_id) REFERENCES Permission(per_id)
);