#Question 1
#Write an SQL query to transform this table into 1NF, 
#ensuring that each row represents a single product for an order

  CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(255),
    Product VARCHAR(255)
  );

  INSERT INTO ProductDetail (OrderID, CustomerName, Product)
  VALUES
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');


#Question 2
#Write an SQL query to transform this table into 2NF by removing 
#partial dependencies. Ensure that each non-key column fully depends on the entire primary key.

  -- Create Customers table (removes partial dependency)
  CREATE TABLE Customers (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
  );

  -- Insert data into Customers table
  INSERT INTO Customers (OrderID, CustomerName)
  VALUES
    (101, 'John Doe'),
    (102, 'Jane Smith'),
    (103, 'Emily Clark');

  -- Create OrderDetails table (ensures full dependency on OrderID and Product)
  CREATE TABLE OrderDetails (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Customers(OrderID)
  );

  -- Insert data into OrderDetails table
  INSERT INTO OrderDetails (OrderID, Product, Quantity)
  VALUES
    (101, 'Laptop', 2),
    (101, 'Mouse', 1),
    (102, 'Tablet', 3),
    (102, 'Keyboard', 1),
    (102, 'Mouse', 2),
    (103, 'Phone', 1);
