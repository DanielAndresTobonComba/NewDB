

CREATE DATABASE MyGuitarShop;
USE MyGuitarShop;

-- create the tables for the database
CREATE TABLE Categories (
  CategoryID        INT            PRIMARY KEY   ,
  CategoryName      VARCHAR(255)   NOT NULL      UNIQUE
);

CREATE TABLE Products (
  ProductID         INT            PRIMARY KEY   ,
  CategoryID        INT            REFERENCES Categories (CategoryID), 
  ProductCode       VARCHAR(10)    NOT NULL      UNIQUE,
  ProductName       VARCHAR(255)   NOT NULL,
  Description       TEXT           NOT NULL,
  ListPrice         varchar(100)          NOT NULL,
  DiscountPercent   varchar(25)          NOT NULL      DEFAULT 0.00,
  DateAdded         DATETIME                     DEFAULT NULL
);

CREATE TABLE Customers (
  CustomerID           INT            PRIMARY KEY   ,
  EmailAddress         VARCHAR(255)   NOT NULL      UNIQUE,
  Password             VARCHAR(60)    NOT NULL,
  FirstName            VARCHAR(60)    NOT NULL,
  LastName             VARCHAR(60)    NOT NULL,
  ShippingAddressID    INT                          DEFAULT NULL,
  BillingAddressID     INT                          DEFAULT NULL
);

CREATE TABLE Addresses (
  AddressID          INT            PRIMARY KEY,
  CustomerID         INT            REFERENCES Customers (CustomerID),
  Line1              VARCHAR(60)    NOT NULL,
  Line2              VARCHAR(60)                  DEFAULT NULL,
  City               VARCHAR(40)    NOT NULL,
  State              VARCHAR(2)     NOT NULL,
  ZipCode            VARCHAR(10)    NOT NULL,
  Phone              VARCHAR(12)    NOT NULL,
  Disabled           INT            NOT NULL      DEFAULT 0
);

CREATE TABLE Orders (
  OrderID           INT            PRIMARY KEY ,
  CustomerID        INT            REFERENCES Customers (CustomerID),
  OrderDate         DATETIME       NOT NULL,
  ShipAmount        varchar(15)          NOT NULL,
  TaxAmount         varchar(15)          NOT NULL,
  ShipDate          DATETIME                    DEFAULT NULL,
  ShipAddressID     INT            NOT NULL,
  CardType          VARCHAR(50)    NOT NULL,
  CardNumber        CHAR(26)       NOT NULL,
  CardExpires       CHAR(10)        NOT NULL,
  BillingAddressID  INT            NOT NULL    
);

CREATE TABLE OrderItems (
  ItemID             INT            PRIMARY key,
  OrderID            INT            REFERENCES Orders (OrderID),
  ProductID          INT            REFERENCES Products (ProductID),
  ItemPrice          varchar(35)    NOT NULL,
  DiscountAmount     varchar(35)    NOT NULL,
  Quantity           INT            NOT NULL   
);

CREATE TABLE Administrators (
  AdminID           INT            PRIMARY KEY,
  EmailAddress      VARCHAR(255)   NOT NULL,
  Password          VARCHAR(255)   NOT NULL,
  FirstName         VARCHAR(255)   NOT NULL,
  LastName          VARCHAR(255)   NOT NULL
);

-- Insert data into the tables

INSERT INTO Categories (CategoryID, CategoryName) VALUES
(11111, 'Guitars'),
(22222, 'Basses'),
(33333, 'Drums'), 
(44444, 'Keyboards');

INSERT INTO Products (ProductID, CategoryID, ProductCode, ProductName, Description, ListPrice, DiscountPercent, DateAdded) VALUES
(199, 11111, 'strat', 'Fender Stratocaster', 'Electric guitar that changed the world. New features: thicker bridge, parchment pickguard.', '699.00', '30.00', '2011-10-30 09:32:40'),
(299, 11111, 'les_paul', 'Gibson Les Paul', 'Classic Les Paul design with humbucking pickups. Elegant and cutting tone.', '1199.00', '30.00', '2011-12-05 16:33:13'),
(399, 11111, 'sg', 'Gibson SG', 'Classic ''62 SG with enhanced neck joint for stability. Hot humbuckers.', '2517.00', '52.00', '2015-02-04 11:04:31'),
(499, 11111, 'fg700s', 'Yamaha FG700S', 'Solid top acoustic guitar for projection and tone. Rosewood body and fingerboard.', '489.99', '38.00', '2015-06-01 11:12:59'),
(599, 11111, 'washburn', 'Washburn D10S', 'Superbly crafted acoustic with spruce top and mahogany body. Rosewood fingerboard.', '299.00', '0.00', '2015-07-30 13:58:35'),
(699, 11111, 'rodriguez', 'Rodriguez Caballero 11', 'Handcrafted classical guitar with cedar top and bubinga sides. Exquisite details.', '415.00', '39.00', '2015-07-30 14:12:41'),
(799, 22222, 'precision', 'Fender Precision', 'Classic P-Bass design with alder body and split single-coil pickup.', '799.99', '30.00', '2015-06-01 11:29:35'),
(899, 22222, 'hofner', 'Hofner Icon', 'Legendary violin bass with spruce top and flamed maple body. Warm tone.', '499.99', '25.00', '2015-07-30 14:18:33'),
(999, 33333, 'ludwig', 'Ludwig 5-piece Drum Set with Cymbals', 'Ludwig drum set with Zildjian cymbal pack. Quality hardware and sound.', '699.99', '30.00', '2015-07-30 12:46:40'),
(1999, 33333, 'tama', 'Tama 5-Piece Drum Set with Cymbals', 'Affordable Tama drum kit with Meinl HCS cymbals. High-end features.', '799.99', '15.00', '2015-07-30 13:14:15');


INSERT INTO Customers (CustomerID, EmailAddress, Password, FirstName, LastName, ShippingAddressID, BillingAddressID) VALUES
(1, 'allan.sherwood@yahoo.com', '650215acec746f0e32bdfff387439eefc1358737', 'Allan', 'Sherwood', 11, 21),
(2, 'barryz@gmail.com', '3f563468d42a448cb1e56924529f6e7bbe529cc7', 'Barry', 'Zimmer', 31, 31),
(3, 'christineb@solarone.com', 'ed19f5c0833094026a2f1e9e6f08a35d26037066', 'Christine', 'Brown', 41, 41),
(4, 'david.goldstein@hotmail.com', 'b444ac06613fc8d63795be9ad0beaf55011936ac', 'David', 'Goldstein', 51, 61),
(5, 'erinv@gmail.com', '109f4b3c50d7b0df729d299bc6f8e9ef9066971f', 'Erin', 'Valentino', 71, 71),
(6, 'frankwilson@sbcglobal.net', '3ebfa301dc59196f18593c45e519287a23297589', 'Frank Lee', 'Wilson', 81, 81),
(7, 'gary_hernandez@yahoo.com', '1ff2b3704aede04eecb51e50ca698efd50a1379b', 'Gary', 'Hernandez', 91, 101),
(8, 'heatheresway@mac.com', '911ddc3b8f9a13b5499b6bc4638a2b4f3f68bf23', 'Heather', 'Esway', 111, 112);


INSERT INTO Addresses (AddressID, CustomerID, Line1, Line2, City, State, ZipCode, Phone, Disabled) VALUES
(11, 1, '100 East Ridgewood Ave.', '', 'Paramus', 'NJ', '07652', '201-653-4472', 0),
(21, 1, '21 Rosewood Rd.', '', 'Woodcliff Lake', 'NJ', '07677', '201-653-4472', 0),
(31, 2, '16285 Wendell St.', '', 'Omaha', 'NE', '68135', '402-896-2576', 0),
(41, 3, '19270 NW Cornell Rd.', '', 'Beaverton', 'OR', '97006', '503-654-1291', 0),
(51, 4, '186 Vermont St.', 'Apt. 2', 'San Francisco', 'CA', '94110', '415-292-6651', 0),
(61, 4, '1374 46th Ave.', '', 'San Francisco', 'CA', '94129', '415-292-6651', 0),
(71, 5, '6982 Palm Ave.', '', 'Fresno', 'CA', '93711', '559-431-2398', 0),
(81, 6, '23 Mountain View St.', '', 'Denver', 'CO', '80208', '303-912-3852', 0),
(91, 7, '7361 N. 41st St.', 'Apt. B', 'New York', 'NY', '10012', '212-335-2093', 0),
(101, 7, '3829 Broadway Ave.', 'Suite 2', 'New York', 'NY', '10012', '212-239-1208', 0),
(111, 8, '2381 Buena Vista St.', '', 'Los Angeles', 'CA', '90023', '213-772-5033', 0),
(112, 8, '291 W. Hollywood Blvd.', '', 'Los Angeles', 'CA', '90024', '213-391-2938', 0);



INSERT INTO Orders (OrderID, CustomerID, OrderDate, ShipAmount, TaxAmount, ShipDate, ShipAddressID, CardType, CardNumber, CardExpires, BillingAddressID) VALUES
(1000, 1, '2015-02-28 09:40:28', '5.00', '32.32', '2015-02-28 15:32:51', 1, 'Visa', '4111111111111111', '04/2015', 2),
(2000, 2, '2015-02-28 11:23:20', '5.00', '0.00', '2015-02-28 12:52:14', 3, 'Visa', '4012888888881881', '08/2016', 3),
(3000, 1, '2015-02-25 09:44:58', '10.00', '89.92', '2015-02-27 9:11:41', 1, 'Visa', '4111111111111111', '04/2015', 2),
(4000, 3, '2015-02-28 15:22:31', '5.00', '0.00', '2015-03-03 16:32:21', 4, 'American Express', '3782822463100005', '04/2013', 4),
(5000, 4, '2015-02-28 05:43:11', '5.00', '0.00', '2015-03-02 14:21:12', 5, 'Visa', '4111111111111111', '04/2016', 6),
(6000, 5, '2015-02-28 18:37:22', '5.00', '0.00', NULL, 7, 'Discover', '6011111111111117', '04/2016', 7),
(7000, 6, '2015-03-01 23:11:12', '15.00', '0.00', '2015-03-03 10:21:35', 8, 'MasterCard', '5555555555554444', '04/2016', 8),
(8000, 7, '2015-03-02 11:26:38', '5.00', '0.00', NULL, 9, 'Visa', '4012888888881881', '04/2016', 10),
(9000, 4, '2015-03-03 12:22:31', '5.00', '0.00', NULL, 5, 'Visa', '4111111111111111', '04/2016', 6);
INSERT INTO OrderItems (OrderID, ProductID, ItemPrice, DiscountAmount, Quantity) VALUES
(1000, 299, '1199.00', '359.70', 1),
(2000, 499, '489.99', '186.20', 1),
(3000, 399, '2517.00', '1308.84', 1),
(3000, 699, '415.00', '161.85', 1),
(4000, 299, '1199.00', '359.70', 2),
(5000, 599, '299.00', '0.00', 1),
(6000, 599, '299.00', '0.00', 1),
(7000, 199, '699.00', '209.70', 1),
(7000, 799, '799.99', '240.00', 1),
(7000, 999, '699.99', '210.00', 1),
(8000, 1999, '799.99', '120.00', 1),
(9000, 1999, '699.00', '209.70', 1);



INSERT INTO Administrators (AdminID, EmailAddress, Password, FirstName, LastName) VALUES
(1, 'admin@myguitarshop.com', '6a718fbd768c2378b511f8249b54897f940e9022', 'Admin', 'User'),
(2, 'joel@murach.com', '971e95957d3b74d70d79c20c94e9cd91b85f7aae', 'Joel', 'Murach'),
(3, 'mike@murach.com', '3f2975c819cefc686282456aeae3a137bf896ee8', 'Mike', 'Murach');

