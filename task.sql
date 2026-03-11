-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction (here)
INSERT INTO Order(CustomerID, Date) VALUE (1, "2023-01-01");
-- Start the transaction
START TRANSACTION;

-- And some data should be created inside the transaction
INSERT INTO OrderItems(OrderID, ProductID, Count) VALUE (1, 1, 0);
UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = 1 and Name = 'AwersomeProduct';
UPDATE OrderItems SET Count = Count + 1 WHERE OrderID = 1 and ProductID = 1;
COMMIT; 