-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema vaseage
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema vaseage
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vaseage` DEFAULT CHARACTER SET utf8 ;
USE `vaseage` ;

-- -----------------------------------------------------
-- Table `vaseage`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vaseage`.`Employee` (
  `sales_associate_id` INT NOT NULL,
  `sales_associate_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`sales_associate_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vaseage`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vaseage`.`customer` (
  `customer_ID` INT NOT NULL,
  `customer_name` VARCHAR(45) NOT NULL,
  `customer_phone` VARCHAR(45) NOT NULL,
  `Employee_sales_associate_id` INT NOT NULL,
  PRIMARY KEY (`customer_ID`, `Employee_sales_associate_id`),
  INDEX `fk_customer_Employee1_idx` (`Employee_sales_associate_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vaseage`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vaseage`.`order` (
  `order_id` INT NOT NULL,
  `order_date` DATE NOT NULL,
  `number_of_item` VARCHAR(45) NOT NULL,
  `price` VARCHAR(45) NOT NULL,
  `sub_total_of_order` VARCHAR(45) NOT NULL,
  `customer_customer_ID` INT NOT NULL,
  `Employee_sales_associate_id` INT NOT NULL,
  PRIMARY KEY (`order_id`, `customer_customer_ID`, `Employee_sales_associate_id`),
  INDEX `fk_order_customer_idx` (`customer_customer_ID` ASC) VISIBLE,
  INDEX `fk_order_Employee1_idx` (`Employee_sales_associate_id` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

# Inseer data in to the table
USE vaseage;
SELECT * FROM vaseage.customer;
INSERT INTO customer (customer_ID, customer_name, customer_phone, Employee_sales_associate_id)
VALUES ('1001',	'Julio Leighton', '479-464-1914', '2001');
INSERT INTO customer (customer_ID, customer_name, customer_phone, Employee_sales_associate_id)
VALUES ('1002',	'Briggs Suller', '281-229-9554', '2002'), ('1003', 'Brockie O Dee', '677-502-3782', '2003'), ('1004', 'Ellene Grayshan', '424-844-4728', '2001'), ('1005', 'Selena Weson', '739-114-1478', '2004'), ('1006', 'Estelle Yakolev',	'751-333-2307',	'2002'), ('1007', 'Curran Blindt', '500-981-8448', '2002'), ('1008', 'Currie Padula', '143-214-3081', '2001');

SELECT * FROM vaseage.employee;
INSERT INTO employee (sales_associate_id, sales_associate_name)
VALUES ('2001',	'Asher Chantler'), ('2002',	'Antonietta Restill'), ('2003',	'Ed Wildblood'), ('2004', 'Claudius Seabert');

SELECT * FROM vaseage.order;
INSERT INTO vaseage.order (order_id, order_date, number_of_item, price, sub_total_of_order, customer_customer_ID, Employee_sales_associate_id)
VALUES ('3001',	'2021-12-14', '4',	'$1.94', '$7.76', '1001', '2001'), ('3002',	'2021-01-28', '4', '$3.52',	'$14.08', '1002', '2002'), ('3003',	'2021-03-15', '5', '$11.65', '$58.25', '1003', '2003'), ('3004', '2022-11-12', '10', '$1.01', '$10.10',	'1004',	'2001'), ('3005', '2021-08-14',	'10', '$1.62', '$16.20', '1005', '2004'), ('3006', '2022-09-06', '2', '$19.16', '$38.32', '1004', '2003'), ('3007', '2021-09-24', '7', '$16.33', '$114.31',	'1006',	'2002'), ('3008', '2022-01-18',	'6', '$4.19', '$25.14',	'1007',	'2002'), ('3009', '2021-08-02',	'5', '$8.31', '$41.55',	'1003',	'2003'), ('3010', '2021-02-04', '8', '$12.00', '$96.00', '1008', '2001');

#3.c. Add a new entry as a test case using your name as the customer’s name
INSERT INTO customer (customer_ID, customer_name, customer_phone, Employee_sales_associate_id)
VALUES ('1009',	'Dammika Pathirana', '613-123-4567', '2002');

#3.d. Add a new entry with a made up name for a sales associate. Order data can be made up as well
SELECT * FROM vaseage.employee;
INSERT INTO employee (sales_associate_id, sales_associate_name)
VALUES ('2005',	'Peter Sam');

SELECT * FROM vaseage.order;
INSERT INTO vaseage.order (order_id, order_date, number_of_item, price, sub_total_of_order, customer_customer_ID, Employee_sales_associate_id)
VALUES ('3011',	'2022-09-20', '4',	'$1.94', '$7.76', '1009', '2002');

# 4.Create a view that mimics the sample data list provided, the excel file. (with the calculated field)
CREATE VIEW vas AS
SELECT customer.customer_name, customer.customer_phone, employee.sales_associate_name, vaseage.order.order_date, vaseage.order.number_of_item, vaseage.order.price, vaseage.order.sub_total_of_order
FROM customer 
INNER JOIN vaseage.order
ON customer.customer_ID = vaseage.order.customer_customer_ID
INNER JOIN employee
ON employee.sales_associate_id = vaseage.order.Employee_sales_associate_id;



# 5. Create a stored procedure that can take a name in for a customer.
DELIMITER XX
CREATE PROCEDURE print_customer (IN customer_name VARCHAR (255))
BEGIN
SELECT customer.customer_name, customer.customer_phone, employee.sales_associate_name, vaseage.order.order_date, vaseage.order.number_of_item, vaseage.order.price, vaseage.order.sub_total_of_order
FROM customer 
INNER JOIN vaseage.order
ON customer.customer_ID = vaseage.order.customer_customer_ID
INNER JOIN employee
ON employee.sales_associate_id = vaseage.order.Employee_sales_associate_id
WHERE customer.customer_name;
END

# 6.Run a query to test your view 
SELECT * FROM vas;
SELECT * FROM VAS;

# 7.Run a query to test your stored procedure
CALL print_customer ("Dammika Pathirana");






