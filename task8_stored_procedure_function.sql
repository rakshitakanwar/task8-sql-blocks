-- Table Creation (if not already created)
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

-- Sample Data Insertion
INSERT INTO employees (name, department, salary) VALUES
('Amit', 'Sales', 30000),
('Sara', 'Sales', 35000),
('Ravi', 'HR', 28000),
('Neha', 'IT', 40000);

-- Change delimiter for stored procedure and function
DELIMITER //

-- ✅ Stored Procedure: Increase salary of employees in a department
CREATE PROCEDURE IncreaseSalaryByDept(
    IN dept_name VARCHAR(50),
    IN percent_increase DECIMAL(5,2)
)
BEGIN
    UPDATE employees
    SET salary = salary + (salary * percent_increase / 100)
    WHERE department = dept_name;
END //

-- ✅ Function: Get Annual Salary from monthly salary
CREATE FUNCTION GetAnnualSalary(monthly_salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN monthly_salary * 12;
END //

-- Reset delimiter
DELIMITER ;

-- ✅ Example usage of the stored procedure
-- CALL IncreaseSalaryByDept('Sales', 10);

-- ✅ Example usage of the function
-- SELECT name, department, salary, GetAnnualSalary(salary) AS annual_salary FROM employees;
