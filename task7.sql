1. Create Customers table:

    CREATE TABLE Customers (
            CustomerID INT PRIMARY KEY,
            Name TEXT,
            City TEXT
        );

-- Insert Sample Data:


    INSERT INTO Customers (CustomerID,Name,City)VALUES(1, 'Alice', 'New York');
    INSERT INTO Customers (CustomerID,Name,City)VALUES(2, 'Bob', 'Los Angeles');
    INSERT INTO Customers (CustomerID,Name,City)VALUES(3, 'Charlie', 'Chicago');

2. Stored Procedure – Get Customers by City:

    DELIMITER //

    CREATE PROCEDURE GetCustomersByCity(IN inputCity TEXT)
    BEGIN
        SELECT * FROM Customers
        WHERE City = inputCity;
    END //

    DELIMITER ;

--How to Call:

    CALL GetCustomersByCity('Chicago');

3.  Function – Count Customers in a City:

    DELIMITER //

    CREATE FUNCTION CountCustomersInCity(inputCity TEXT)
    RETURNS INT
    DETERMINISTIC
    BEGIN
        DECLARE customerCount INT;

        SELECT COUNT(*) INTO customerCount
        FROM Customers
        WHERE City = inputCity;

        RETURN customerCount;
    END //

    DELIMITER ;

--How to Use:

    SELECT CountCustomersInCity('New York');
