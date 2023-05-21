CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    birth_day DATE,
    sex VARCHAR(1),
    salary INT,
    super_id INT,
    branch_id INT
);

CREATE TABLE branch (
    branch_id INT PRIMARY KEY, 
    branch_name VARCHAR(40),
    manager_id INT,
    manager_start_date DATE,
    FOREIGN KEY(manager_id) REFERENCES employee(employee_id) ON DELETE SET NULL
);

ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(employee_id)
ON DELETE SET NULL;

CREATE TABLE client (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(40),
    branch_id INT,
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE works_with (
    employee_id INT,
    client_id INT,
    total_sales INT,
    PRIMARY KEY(employee_id, client_id),
    FOREIGN KEY(employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE,
    FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
    );

    SELECT * FROM works_with;

CREATE TABLE branch_supplier (
    branch_id INT,
    supplier_name VARCHAR(40),
    supplier_type VARCHAR(40),
    PRIMARY KEY(branch_id, supplier_name),
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
    );