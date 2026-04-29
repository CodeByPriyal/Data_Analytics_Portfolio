-- ============================================
-- PROJECT 3: SALES DATA ANALYSIS
-- Tool: MS SQL Server
-- Author: Data Analyst Portfolio Project
-- ============================================

-- STEP 1: CREATE DATABASE
CREATE DATABASE SalesAnalysisDB;
GO
USE SalesAnalysisDB;
GO

-- STEP 2: CREATE TABLES
Create Table Customers(
 CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Segment VARCHAR(50),
    City VARCHAR(100),
    State VARCHAR(100),
    Region VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(150),
    Category VARCHAR(50),
    SubCategory VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID VARCHAR(20) PRIMARY KEY,
    OrderDate DATE,
    ShipDate DATE,
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    ShipMode VARCHAR(50)
);

CREATE TABLE OrderDetails (
    DetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID VARCHAR(20) FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(4,2),
    Profit DECIMAL(10,2)
);
GO

-- STEP 3: INSERT CUSTOMERS DATA
INSERT INTO Customers VALUES
(1, 'Aarav Shah', 'Consumer', 'Mumbai', 'Maharashtra', 'West'),
(2, 'Priya Mehta', 'Corporate', 'Delhi', 'Delhi', 'North'),
(3, 'Rohan Verma', 'Home Office', 'Bangalore', 'Karnataka', 'South'),
(4, 'Sneha Joshi', 'Consumer', 'Chennai', 'Tamil Nadu', 'South'),
(5, 'Karan Patel', 'Corporate', 'Ahmedabad', 'Gujarat', 'West'),
(6, 'Ananya Singh', 'Consumer', 'Kolkata', 'West Bengal', 'East'),
(7, 'Vikram Nair', 'Home Office', 'Hyderabad', 'Telangana', 'South'),
(8, 'Pooja Sharma', 'Corporate', 'Pune', 'Maharashtra', 'West'),
(9, 'Amit Kumar', 'Consumer', 'Jaipur', 'Rajasthan', 'North'),
(10, 'Divya Rao', 'Corporate', 'Lucknow', 'Uttar Pradesh', 'North'),
(11, 'Rahul Gupta', 'Consumer', 'Bhopal', 'Madhya Pradesh', 'West'),
(12, 'Nisha Agarwal', 'Home Office', 'Patna', 'Bihar', 'East'),
(13, 'Suresh Reddy', 'Corporate', 'Visakhapatnam', 'Andhra Pradesh', 'South'),
(14, 'Meera Pillai', 'Consumer', 'Kochi', 'Kerala', 'South'),
(15, 'Deepak Tiwari', 'Home Office', 'Nagpur', 'Maharashtra', 'West'),
(16, 'Kavya Iyer', 'Consumer', 'Coimbatore', 'Tamil Nadu', 'South'),
(17, 'Arjun Malhotra', 'Corporate', 'Chandigarh', 'Punjab', 'North'),
(18, 'Ritu Saxena', 'Consumer', 'Agra', 'Uttar Pradesh', 'North'),
(19, 'Manish Jain', 'Home Office', 'Surat', 'Gujarat', 'West'),
(20, 'Swati Desai', 'Corporate', 'Indore', 'Madhya Pradesh', 'West');
GO

-- STEP 4: INSERT PRODUCTS DATA
INSERT INTO Products VALUES
(1, 'Executive Chair', 'Furniture', 'Chairs'),
(2, 'Office Desk', 'Furniture', 'Tables'),
(3, 'Wood Bookcase', 'Furniture', 'Bookcases'),
(4, 'Samsung Galaxy Phone', 'Technology', 'Phones'),
(5, 'iPhone 14', 'Technology', 'Phones'),
(6, 'USB Hub', 'Technology', 'Accessories'),
(7, 'Laser Printer', 'Technology', 'Machines'),
(8, 'Laser Copier', 'Technology', 'Copiers'),
(9, 'A4 Paper Pack', 'Office Supplies', 'Paper'),
(10, 'Ring Binder', 'Office Supplies', 'Binders'),
(11, 'Filing Cabinet', 'Office Supplies', 'Storage'),
(12, 'Gel Pen Set', 'Office Supplies', 'Pens'),
(13, 'Sticky Notes Pack', 'Office Supplies', 'Paper'),
(14, 'Standing Desk', 'Furniture', 'Tables'),
(15, 'Wireless Mouse', 'Technology', 'Accessories'),
(16, 'Mechanical Keyboard', 'Technology', 'Accessories'),
(17, 'Conference Table', 'Furniture', 'Tables'),
(18, 'Address Labels', 'Office Supplies', 'Labels'),
(19, 'Storage Box Set', 'Office Supplies', 'Storage'),
(20, 'Mini Bookcase', 'Furniture', 'Bookcases');
GO

-- STEP 5: INSERT ORDERS DATA
INSERT INTO Orders VALUES
('ORD-1001', '2023-01-15', '2023-01-19', 1, 'Standard Class'),
('ORD-1002', '2023-01-22', '2023-01-26', 2, 'Second Class'),
('ORD-1003', '2023-02-05', '2023-02-08', 3, 'First Class'),
('ORD-1004', '2023-02-18', '2023-02-22', 4, 'Standard Class'),
('ORD-1005', '2023-03-10', '2023-03-13', 5, 'Same Day'),
('ORD-1006', '2023-03-25', '2023-03-29', 6, 'Standard Class'),
('ORD-1007', '2023-04-08', '2023-04-12', 7, 'Second Class'),
('ORD-1008', '2023-04-20', '2023-04-23', 8, 'First Class'),
('ORD-1009', '2023-05-05', '2023-05-09', 9, 'Standard Class'),
('ORD-1010', '2023-05-18', '2023-05-21', 10, 'Same Day'),
('ORD-1011', '2023-06-02', '2023-06-06', 11, 'Standard Class'),
('ORD-1012', '2023-06-15', '2023-06-19', 12, 'Second Class'),
('ORD-1013', '2023-07-08', '2023-07-11', 13, 'First Class'),
('ORD-1014', '2023-07-22', '2023-07-26', 14, 'Standard Class'),
('ORD-1015', '2023-08-10', '2023-08-13', 15, 'Same Day'),
('ORD-1016', '2023-08-28', '2023-09-01', 16, 'Standard Class'),
('ORD-1017', '2023-09-12', '2023-09-16', 17, 'Second Class'),
('ORD-1018', '2023-09-25', '2023-09-28', 18, 'First Class'),
('ORD-1019', '2023-10-10', '2023-10-14', 19, 'Standard Class'),
('ORD-1020', '2023-10-22', '2023-10-25', 20, 'Same Day'),
('ORD-1021', '2023-11-05', '2023-11-09', 1, 'Standard Class'),
('ORD-1022', '2023-11-18', '2023-11-22', 3, 'Second Class'),
('ORD-1023', '2023-12-02', '2023-12-06', 5, 'First Class'),
('ORD-1024', '2023-12-15', '2023-12-19', 7, 'Standard Class'),
('ORD-1025', '2024-01-08', '2024-01-12', 9, 'Same Day'),
('ORD-1026', '2024-01-20', '2024-01-24', 11, 'Standard Class'),
('ORD-1027', '2024-02-05', '2024-02-09', 13, 'Second Class'),
('ORD-1028', '2024-02-18', '2024-02-22', 15, 'First Class'),
('ORD-1029', '2024-03-08', '2024-03-11', 17, 'Standard Class'),
('ORD-1030', '2024-03-22', '2024-03-25', 19, 'Same Day');
GO

-- STEP 6: INSERT ORDER DETAILS
INSERT INTO OrderDetails (OrderID, ProductID, Sales, Quantity, Discount, Profit) VALUES
('ORD-1001', 1, 4500.00, 2, 0.10, 900.00),
('ORD-1001', 9, 850.00, 5, 0.05, 212.50),
('ORD-1002', 4, 18000.00, 1, 0.00, 3600.00),
('ORD-1002', 6, 1200.00, 2, 0.10, 240.00),
('ORD-1003', 7, 25000.00, 1, 0.05, 4375.00),
('ORD-1003', 10, 450.00, 3, 0.00, 135.00),
('ORD-1004', 2, 12000.00, 1, 0.15, 1800.00),
('ORD-1004', 12, 320.00, 4, 0.00, 96.00),
('ORD-1005', 5, 65000.00, 1, 0.00, 13000.00),
('ORD-1005', 15, 1800.00, 1, 0.10, 360.00),
('ORD-1006', 11, 5500.00, 1, 0.05, 962.50),
('ORD-1006', 13, 280.00, 6, 0.00, 84.00),
('ORD-1007', 3, 8500.00, 1, 0.10, 1487.50),
('ORD-1007', 18, 150.00, 10, 0.00, 45.00),
('ORD-1008', 8, 35000.00, 1, 0.05, 6125.00),
('ORD-1008', 16, 2200.00, 1, 0.00, 550.00),
('ORD-1009', 14, 22000.00, 1, 0.10, 3850.00),
('ORD-1009', 19, 1200.00, 2, 0.05, 228.00),
('ORD-1010', 4, 17500.00, 1, 0.05, 3237.50),
('ORD-1010', 6, 1100.00, 1, 0.00, 275.00),
('ORD-1011', 1, 4200.00, 1, 0.00, 1050.00),
('ORD-1011', 9, 780.00, 4, 0.05, 148.20),
('ORD-1012', 20, 3800.00, 2, 0.10, 684.00),
('ORD-1012', 12, 290.00, 3, 0.00, 87.00),
('ORD-1013', 5, 62000.00, 1, 0.00, 12400.00),
('ORD-1013', 15, 1750.00, 1, 0.05, 306.25),
('ORD-1014', 17, 45000.00, 1, 0.10, 7875.00),
('ORD-1014', 10, 420.00, 2, 0.00, 126.00),
('ORD-1015', 7, 24000.00, 1, 0.05, 4200.00),
('ORD-1015', 13, 260.00, 5, 0.00, 78.00),
('ORD-1016', 2, 11500.00, 1, 0.00, 2875.00),
('ORD-1016', 18, 140.00, 8, 0.05, 26.60),
('ORD-1017', 8, 33000.00, 1, 0.10, 5775.00),
('ORD-1017', 16, 2100.00, 1, 0.00, 525.00),
('ORD-1018', 3, 9000.00, 1, 0.05, 1575.00),
('ORD-1018', 11, 5200.00, 1, 0.10, 910.00),
('ORD-1019', 14, 21000.00, 1, 0.00, 5250.00),
('ORD-1019', 6, 1050.00, 1, 0.05, 199.50),
('ORD-1020', 5, 63000.00, 1, 0.05, 11025.00),
('ORD-1020', 9, 820.00, 5, 0.00, 205.00),
('ORD-1021', 4, 16500.00, 1, 0.10, 2887.50),
('ORD-1021', 12, 310.00, 4, 0.00, 93.00),
('ORD-1022', 1, 4800.00, 2, 0.05, 912.00),
('ORD-1022', 19, 1300.00, 2, 0.10, 234.00),
('ORD-1023', 7, 26000.00, 1, 0.00, 6500.00),
('ORD-1023', 15, 1900.00, 1, 0.05, 332.50),
('ORD-1024', 17, 47000.00, 1, 0.05, 8225.00),
('ORD-1024', 13, 270.00, 6, 0.00, 81.00),
('ORD-1025', 5, 64000.00, 1, 0.00, 12800.00),
('ORD-1025', 16, 2300.00, 1, 0.10, 414.00),
('ORD-1026', 2, 13000.00, 1, 0.05, 2275.00),
('ORD-1026', 10, 480.00, 3, 0.00, 144.00),
('ORD-1027', 8, 36000.00, 1, 0.00, 9000.00),
('ORD-1027', 18, 160.00, 10, 0.05, 30.40),
('ORD-1028', 3, 9500.00, 1, 0.10, 1662.50),
('ORD-1028', 11, 5800.00, 1, 0.05, 1015.00),
('ORD-1029', 14, 23000.00, 1, 0.05, 4025.00),
('ORD-1029', 6, 1150.00, 2, 0.00, 287.50),
('ORD-1030', 4, 19000.00, 1, 0.10, 3325.00),
('ORD-1030', 9, 900.00, 6, 0.00, 225.00);
GO

-- ============================================
-- ANALYSIS QUERIES — PRACTICE THESE!
-- ============================================

-- Q1: TOTAL SALES, PROFIT AND ORDERS
SELECT 
    COUNT(DISTINCT o.OrderID) AS Total_Orders,
    ROUND(SUM(od.Sales), 2) AS Total_Sales,
    ROUND(SUM(od.Profit), 2) AS Total_Profit,
    ROUND((SUM(od.Profit) / SUM(od.Sales)) * 100, 2) AS Profit_Margin_Pct
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID;

-- Q2: SALES BY CATEGORY
SELECT 
    p.Category,
    COUNT(DISTINCT o.OrderID) AS Total_Orders,
    ROUND(SUM(od.Sales), 2) AS Total_Sales,
    ROUND(SUM(od.Profit), 2) AS Total_Profit
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
JOIN Orders o ON od.OrderID = o.OrderID
GROUP BY p.Category
ORDER BY Total_Sales DESC;

-- Q3: SALES BY REGION
SELECT 
    c.Region,
    COUNT(DISTINCT o.OrderID) AS Total_Orders,
    ROUND(SUM(od.Sales), 2) AS Total_Sales,
    ROUND(SUM(od.Profit), 2) AS Total_Profit
FROM OrderDetails od
JOIN Orders o ON od.OrderID = o.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.Region
ORDER BY Total_Sales DESC;

-- Q4: TOP 5 CUSTOMERS BY SALES
SELECT TOP 5
    c.CustomerName,
    c.Segment,
    c.Region,
    ROUND(SUM(od.Sales), 2) AS Total_Sales,
    ROUND(SUM(od.Profit), 2) AS Total_Profit
FROM OrderDetails od
JOIN Orders o ON od.OrderID = o.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerName, c.Segment, c.Region
ORDER BY Total_Sales DESC;

-- Q5: TOP 5 PRODUCTS BY SALES
SELECT TOP 5
    p.ProductName,
    p.Category,
    ROUND(SUM(od.Sales), 2) AS Total_Sales,
    SUM(od.Quantity) AS Total_Quantity,
    ROUND(SUM(od.Profit), 2) AS Total_Profit
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName, p.Category
ORDER BY Total_Sales DESC;

-- Q6: MONTHLY SALES TREND
SELECT 
    YEAR(o.OrderDate) AS Year,
    MONTH(o.OrderDate) AS Month_Number,
    DATENAME(MONTH, o.OrderDate) AS Month_Name,
    ROUND(SUM(od.Sales), 2) AS Monthly_Sales,
    ROUND(SUM(od.Profit), 2) AS Monthly_Profit
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate), DATENAME(MONTH, o.OrderDate)
ORDER BY Year, Month_Number;

-- Q7: SALES BY CUSTOMER SEGMENT
SELECT 
    c.Segment,
    COUNT(DISTINCT o.OrderID) AS Total_Orders,
    ROUND(SUM(od.Sales), 2) AS Total_Sales,
    ROUND(AVG(od.Sales), 2) AS Avg_Order_Value
FROM OrderDetails od
JOIN Orders o ON od.OrderID = o.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.Segment
ORDER BY Total_Sales DESC;

-- Q8: PROFIT MARGIN BY CATEGORY
SELECT 
    p.Category,
    ROUND(SUM(od.Sales), 2) AS Total_Sales,
    ROUND(SUM(od.Profit), 2) AS Total_Profit,
    ROUND((SUM(od.Profit) / SUM(od.Sales)) * 100, 2) AS Profit_Margin_Pct
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY Profit_Margin_Pct DESC;

-- Q9: SHIPPING MODE ANALYSIS
SELECT 
    o.ShipMode,
    COUNT(DISTINCT o.OrderID) AS Total_Orders,
    ROUND(SUM(od.Sales), 2) AS Total_Sales,
    AVG(DATEDIFF(DAY, o.OrderDate, o.ShipDate)) AS Avg_Shipping_Days
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY o.ShipMode
ORDER BY Total_Orders DESC;

-- Q10: STATE WISE SALES PERFORMANCE
SELECT 
    c.State,
    c.Region,
    COUNT(DISTINCT o.OrderID) AS Total_Orders,
    ROUND(SUM(od.Sales), 2) AS Total_Sales,
    ROUND(SUM(od.Profit), 2) AS Total_Profit
FROM OrderDetails od
JOIN Orders o ON od.OrderID = o.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.State, c.Region
ORDER BY Total_Sales DESC;
GO

Select Count(*) As Total_Customers from Customers;
Select Count(*) As Total_Products from Products;
Select Count(*) AS Total_Orders from Orders;
Select Count(*) As Total_OrderDetails from OrderDetails;