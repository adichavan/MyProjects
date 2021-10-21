/*Create database furniture row*/
CREATE DATABASE furniture_row;

/* Use the database */
USE furniture_row;

/*Create the employee table*/
CREATE TABLE employee_T (
emp_id int(10) not null AUTO_INCREMENT,
emp_name varchar(25) not null,
emp_address varchar(50) not null,
supervisor int(10) not null,
CONSTRAINT emp_pk PRIMARY KEY (emp_id),
CONSTRAINT employee_fk FOREIGN KEY (supervisor) REFERENCES employee_T (emp_id) 
ON UPDATE CASCADE ON DELETE CASCADE);

/*Create the workcenter table*/
CREATE TABLE workcenter_T (
workcenter_id int(10) not null,
location varchar(50) not null,
CONSTRAINT workcenter_pk PRIMARY KEY (workcenter_id));

/*Create the productline table*/
CREATE TABLE productline_T (
productline_id int(10) not null,
productline_name varchar(20) not null,
CONSTRAINT productline_pk PRIMARY KEY (productline_id));

/*Create the rawmaterial table*/
CREATE TABLE rawmaterial_T (
material_id int(10) not null,
unit_measure varchar(10) not null,
unit_price float not null,
CONSTRAINT material_pk PRIMARY KEY (material_id));

/*Create the customer table*/
CREATE TABLE customer_T (
cust_id int(10) not null,
cust_name varchar(20) not null,
cust_address varchar(50),
CONSTRAINT cust_pk PRIMARY KEY (cust_id));

/*Create the vendor table*/
CREATE TABLE vendor_T (
vendor_id int(10) not null,
vendor_name varchar(20) not null,
vendor_address varchar(50),
CONSTRAINT vendor_pk PRIMARY KEY (vendor_id));

/*Create the salesterritory table*/
CREATE TABLE salesterritory_T (
territory_id int(10) not null,
CONSTRAINT territory_pk PRIMARY KEY (territory_id));

/*Create the salesperson table*/
CREATE TABLE salesperson_T (
salesperson_id int(10) not null,
salesperson_name varchar(20) not null,
salesperson_address varchar(50),
salesperson_phone int(15),
salesperson_fax int(15),
territory_id int(10) not null,
CONSTRAINT salesperson_pk PRIMARY KEY (salesperson_id),
CONSTRAINT salesperson_fk FOREIGN KEY (territory_id) REFERENCES salesterritory_T (territory_id)
ON UPDATE CASCADE ON DELETE CASCADE);

/*Create the worksin table*/
CREATE TABLE worksin_T (
emp_id int(10) not null,
workcenter_id int(10) not null,
CONSTRAINT worksin_fk1 FOREIGN KEY (emp_id) REFERENCES employee_T (emp_id) 
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT worksin_fk2 FOREIGN KEY (workcenter_id) REFERENCES workcenter_T (workcenter_id) 
ON UPDATE CASCADE ON DELETE CASCADE);

/*Create the product table*/
CREATE TABLE product_T (
prod_id int(10) not null,
prod_desc varchar(50),
unit_price double,
prod_finish varchar(20),
productline_id int(10) not null,
CONSTRAINT prod_pk PRIMARY KEY (prod_id),
CONSTRAINT prod_fk FOREIGN KEY (productline_id) REFERENCES productline_T (productline_id)
ON UPDATE CASCADE ON DELETE CASCADE);

/*Create the employeeskill table*/
CREATE TABLE empskill_T (
emp_id int(10) not null,
skill varchar(20),
CONSTRAINT empskill_fk FOREIGN KEY (emp_id) REFERENCES employee_T (emp_id)
ON UPDATE CASCADE ON DELETE CASCADE);

/*Create the manufacturedin table*/
CREATE TABLE manufacture_T (
workcenter_id int(10) not null,
prod_id int(10) not null,
CONSTRAINT manufacture_fk1 FOREIGN KEY (workcenter_id) REFERENCES workcenter_T (workcenter_id)
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT manufacture_fk2 FOREIGN KEY (prod_id) REFERENCES product_T (prod_id)
ON UPDATE CASCADE ON DELETE CASCADE);

/*Create the supplies table*/
CREATE TABLE supplies_T (
material_id int(10) not null,
vendor_id int(10) not null,
unit_price double,
CONSTRAINT supplies_fk1 FOREIGN KEY (material_id) REFERENCES rawmaterial_T (material_id)
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT supplies_fk2 FOREIGN KEY (vendor_id) REFERENCES vendor_T (vendor_id)
ON UPDATE CASCADE ON DELETE CASCADE);

/*Create the productmaterial table*/
CREATE TABLE prodmaterial_T (
prod_id int(10) not null,
material_id int(10) not null,
CONSTRAINT prodmaterial_fk1 FOREIGN KEY (prod_id) REFERENCES product_T (prod_id)
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT prodmaterial_fk2 FOREIGN KEY (material_id) REFERENCES rawmaterial_T (material_id)
ON UPDATE CASCADE ON DELETE CASCADE);

/*Create the order table*/
CREATE TABLE order_T (
order_id int(10) not null,
order_date date,
cust_id int(10) not null,
CONSTRAINT order_pk PRIMARY KEY (order_id),
CONSTRAINT order_fk1 FOREIGN KEY (cust_id) REFERENCES customer_T (cust_id)
ON UPDATE CASCADE ON DELETE CASCADE);

/*Create the productrequest table*/
CREATE TABLE prodrequest_T (
prod_id int(10) not null,
order_id int(10) not null,
quantity double,
CONSTRAINT prodrequest_fk1 FOREIGN KEY (prod_id) REFERENCES product_T (prod_id)
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT prodrequest_fk2 FOREIGN KEY (order_id) REFERENCES order_T (order_id)
ON UPDATE CASCADE ON DELETE CASCADE);

/*Create the customerbusiness table*/
CREATE TABLE custbusiness_T (
cust_id int(10) not null,
territory_id int(10) not null,
CONSTRAINT custbusiness_fk1 FOREIGN KEY (cust_id) REFERENCES customer_T (cust_id)
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT custbusiness_fk2 FOREIGN KEY (territory_id) REFERENCES salesterritory_T (territory_id)
ON UPDATE CASCADE ON DELETE CASCADE);

INSERT INTO employee_T (emp_id, emp_name, emp_address, supervisor) VALUES
(1, 'Lionel Messi', 'Barcelona, Spain', 1),
(2, 'Cristiano Ronaldo', 'Lisbon, Portugal', 2),
(3, 'Xavi', 'Barcelona, Spain', 1),
(4, 'Andres Iniesta', 'Barcelona, Spain', 2),
(5, 'Zlatan Ibrahimovic', 'Milan, Italy', 1),
(6, 'Neymar', 'Paris, France', 2),
(7, 'Kylian Mbappe', 'Paris, France', 1),
(8, 'Erling Haaland', 'Dortmund, Germany', 2),
(9, 'Gerard Pique', 'Barcelona, Spain', 1),
(10, 'Sergio Ramos', 'Madrid, Spain', 2),
(11, 'Carlos Puyol', 'Barcelona, Spain', 1),
(12, 'Mohammad Salah', 'London, UK', 2),
(13, 'Ter Stegen', 'Munich, Germany', 1),
(14, 'Iker Casillas', 'Madrid, Spain', 2),
(15, 'Luis Suarez', 'Madrid, Spain', 1),
(16, 'Antoine Griezmann', 'Paris, France', 2),
(17, 'Robert Lewandowski', 'Munich, Germany', 1),
(18, 'Thomas Muller', 'Munich, Germany', 2),
(19, 'Toni Kroos', 'Madrid, Spain', 1),
(20, 'Karim Benzema', 'Paris, France', 2);

INSERT INTO workcenter_T (workcenter_id, location) VALUES
(101,'Barcelona'),
(102,'Lisbon'),
(103,'Barcelona'),
(104,'Barcelona'),
(105,'Milan'),
(106,'Paris'),
(107,'Paris'),
(108,'Dortmund'),
(109,'Barcelona'),
(110,'Madrid'),
(111,'Barcelona'),
(112,'London'),
(113,'Munich'),
(114,'Madrid'),
(115,'Madrid'),
(116,'Paris'),
(117,'Munich'),
(118,'Munich'),
(119,'Madrid'),
(120,'Paris');

INSERT INTO productline_T (productline_id, productline_name) VALUES
(2001,'Chair'),
(2002,'Study Table'),
(2003,'Bed'),
(2004,'Wardrobe'),
(2005,'Stool'),
(2006,'Sofa'),
(2007,'Dining Table'),
(2008,'Stand'),
(2009,'Drawer'),
(2010,'Chair'),
(2011,'Study Table'),
(2012,'Bed'),
(2013,'Wardrobe'),
(2014,'Stool'),
(2015,'Sofa'),
(2016,'Dining Table'),
(2017,'Stand'),
(2018,'Drawer'),
(2019,'Chair'),
(2020,'Study Table');

INSERT INTO rawmaterial_T (material_id, unit_measure, unit_price) VALUES
(1001, 'pounds', 100 ),
(1002, 'feet', 200.5),
(1003, 'grams', 50.65),
(1004, 'cms', 60.8),
(1005, 'celsius', 80.5),
(1006, 'ounce', 40),
(1007, 'mm', 90.6),
(1008, 'tonne', 200.75),
(1009, 'sq metre', 30.5),
(1010, 'cubic m', 50),
(1011, 'pounds', 60.5),
(1012, 'feet', 70.5),
(1013, 'grams', 700),
(1014, 'ounce', 60.5),
(1015, 'litre', 90.5),
(1016, 'cubic m', 100),
(1017, 'sq metre', 200.5),
(1018, 'feet', 700),
(1019, 'mm', 50.5),
(1020, 'tonne', 80.75);

INSERT INTO customer_T (cust_id, cust_name, cust_address) VALUES
(2001, 'Tom Cruise', '8051 Shore Court Burbank, IL 60459'),
(2002,'Tom Hanks', '8891 North Mountainview Ave. Seattle, WA 98144'),
(2003,'Johny Depp', '637 Cypress Drive Granger, IN 46530'),
(2004,'Jim Carrey', '355 Pennsylvania Lane Charleston, SC 29406'),
(2005,'Leonardo DiCaprio', '7968 Longbranch Avenue Canal Winchester, OH 43110'),
(2006,'Brad Pitt', '778 Southampton Ave. Somerset, NJ 08873'),
(2007,'Morgan Freeman', '90 Sunnyslope Dr.Norristown, PA 19401'),
(2008,'Hugh Jackman', '277 Fulton Ave. Owings Mills, MD 21117'),
(2009,'Will Smith', '5 Rocky River St.Perkasie, PA 18944'),
(2010,'George Clooney', '7214 Lincoln St.Springfield Gardens, NY 11413'),
(2011,'Russell Crowe', '9490 S. East Ave.Paterson, NJ 07501'),
(2012,'Mark Wahlberg', '7870 Gates St.Lititz, PA 17543'),
(2013,'Pierce Brosnan', '530 Sugar St.Forest Hills, NY 11375'),
(2014,'Dwayne Johnson', '19 Paris Hill Dr.Shelbyville, TN 37160'),
(2015,'Jackie Chan', '31 East Alderwood St.Belleville, NJ 07109'),
(2016,'Adam Sandler', '7870 Gates St.Lititz, PA 17543'),
(2017,'Bradley Cooper', '530 Sugar St.Forest Hills, NY 11375'),
(2018,'Nicolas Cage', '31 East Alderwood St.Belleville, NJ 07109'),
(2019,'Keanu Reeves', '277 Fulton Ave.Owings Mills, MD 21117'),
(2020,'Robin Williams', '9490 S. East Ave.Paterson, NJ 07501');

INSERT INTO vendor_T (vendor_id, vendor_name, vendor_address) VALUES
(1, 'Order Pros', '7562 Rose Dr.Richmond Hill, NY 11418'),
(2, 'Sellafarm', '7217 Honey Creek Drive Defiance, OH 43512'),
(3, 'Middle Man', '87 William Court Green Bay, WI 54302'),
(4, 'Vitasale', '7136 Arnold Road Fort Washington, MD 20744'),
(5, 'Serva', '210 South Prince Ave. Middleton, WI 53562'),
(6, 'BWI Companies', '87 Canal Ave. Ozone Park, NY 11417'),
(7, 'Carboline', '69 Gates St.Albany, NY 12203'),
(8, 'D&H', '629 Kingston Court Atwater, CA 95301'),
(9, 'Eagle Distribution', '56 Wrangler Ave. Rossville, GA 30741'),
(10, 'Fresh Point', '3 Stillwater Ave. Wayne, NJ 07470'),
(11, 'Hydrologic', '347 Wrangler St.Naples, FL 34116'),
(12, 'Interwest', '72 La Sierra Road Teaneck, NJ 07666'),
(13, 'Richbay', '537 Marsh Avenue Englewood, NJ 07631'),
(14, 'Coastline Trading', '32 Circle St. Manchester Township, NJ 08759'),
(15, 'Fresh Point', '86 Logan Street Hollywood, FL 33020'),
(16, 'Globatech', '980 Valley View Street Belleville, NJ 07109'),
(17, 'Charter Supply', '35 Squaw Creek St. Oak Creek, WI 53154'),
(18, 'Perkinas', '20 Hill Field Drive Rockford, MI 49341'),
(19, 'Arrowhead', '14 E. Lincoln Rd. Gwynn Oak, MD 21207'),
(20, 'Transcon Trading', '199 Canal Road Algonquin, IL 60102');


INSERT INTO salesterritory_T (territory_id) VALUES
(10001),
(10002),
(10003),
(10004),
(10005),
(10006),
(10007),
(10008),
(10009),
(10010),
(10011),
(10012),
(10013),
(10014),
(10015),
(10016),
(10017),
(10018),
(10019),
(10020);


INSERT INTO salesperson_T (salesperson_id, salesperson_name, salesperson_address,
salesperson_phone, salesperson_fax, territory_id) VALUES
(1, 'Jimi Hendrix', '385 Van Dyke Dr.Phillipsburg, NJ 08865', 5023234, 1228881, 10001),
(2, 'Eric Clapton', '15 Westport St.Morrisville, PA 19067', 886685, 2228882, 10002),
(3, 'Steve Vai', '8538 Lyme Street Ridgecrest, CA 93555', 296401, 3228883, 10003),
(4, 'Joe Satriani', '9131 Trout Dr.Southaven, MS 38671', 432522, 4228884, 10004),
(5, 'Kurt Cobain', '9656 Sage Street Roy, UT 84067', 700200, 5228885, 10005),
(6, 'Angus Young', '6 Elizabeth Avenue Honolulu, HI 96815', 783733, 6228886, 10006),
(7, 'Ozzy Osbourne', '82 Young Street Garner, NC 27529', 544886, 7228887, 10007),
(8, 'Bryan Adams', '9352 Delaware Drive Tualatin, OR 97062', 543536, 8228888, 10008),
(9, 'James Blunt', '7136 Old Berkshire Drive Halethorpe, MD 21227', 485798, 9228889, 10009),
(10, 'James Hetfield', '144 West Dogwood Road Jacksonville, NC 28540', 737535, 1028880, 10010),
(11, 'Kirk Hammett', '925 Lake Forest St.Fresno, CA 93706', 451984, 1128881, 10011),
(12, 'Lars Ulrich', '134 Oakland Court Hoboken, NJ 07030', 702776, 1228882, 10012),
(13, 'Dave Mustaine', '898 South White Ave. Grosse Pointe, MI 48236', 799847, 1328883, 10013),
(14, 'Jeff Henneman', '549 North Glenridge Court Stratford, CT 06614', 490924, 1428884, 10014),
(15, 'Slash', '8254 John St.North Augusta, SC 29841', 8015090, 1528885, 10015),
(16, 'Chris Adler', '19 Catherine Ave. Mechanicsville, VA 23111', 6254841, 1628886, 10016),
(17, 'Mark Morton', '684 Logan Lane Sioux City, IA 51106', 9244234, 1728887, 10017),
(18, 'Axl Rose', '8 Golden Star Street Lancaster, NY 14086', 548824, 1828888, 10018),
(19, 'Randy Blythe', '90 Williams St.Wooster, OH 44691', 969691, 1928889, 10019),
(20, 'Steve Harris', '979 Ryan Street West Babylon, NY 11704', 3288148, 2028880, 10020);


INSERT INTO worksin_T (emp_id, workcenter_id) VALUES
(1, 101),
(2, 102),
(3, 103),
(4, 104),
(5, 105),
(6, 106),
(7, 107),
(8, 108),
(9, 109),
(10, 110),
(11, 111),
(12, 112),
(13, 113),
(14, 114),
(15, 115),
(16, 116),
(17, 117),
(18, 118),
(19, 119),
(20, 120);



INSERT INTO product_T (prod_id, prod_desc, unit_price, prod_finish, productline_id) VALUES
(301, 'Basic', 10, 'Unfinished', 2001),
(302, 'Regular', 30.5, 'Finished', 2002),
(303, 'Luxury', 200, 'Unfinished', 2003),
(304, 'Basic', 13.5, 'Finished', 2004),
(305, 'Regular', 50, 'Finished', 2005),
(306, 'Luxury', 500.75, 'Unfinished', 2006),
(307, 'Basic', 9.5, 'Finished', 2007),
(308, 'Regular', 60.5, 'Unfinished', 2008),
(309, 'Luxury', 575, 'Unfinished', 2009),
(310, 'Basic', 25.75, 'Finished', 2010),
(311, 'Regular', 50.75, 'Finished', 2011),
(312, 'Luxury', 400.25, 'Unfinished', 2012),
(313, 'Basic', 24, 'Finished', 2013),
(314, 'Regular', 70, 'Finished', 2014),
(315, 'Luxury', 500.5, 'Unfinished', 2015),
(316, 'Basic', 17.5, 'Unfinished', 2016),
(317, 'Regular', 80.5, 'Unfinished', 2017),
(318, 'Luxury', 375, 'Finished', 2018),
(319, 'Basic', 20.75, 'Finished', 2019),
(320, 'Luxury', 675, 'Finished', 2020);



INSERT INTO empskill_T (emp_id, skill) VALUES
(1,'Striker'),
(2,'Defender'),
(3,'Goalkeeper'),
(4,'Midfielder'),
(5,'Winger'),
(6,'Forward'),
(7,'Striker'),
(8,'Defender'),
(9,'Goalkeeper'),
(10,'Midfielder'),
(11,'Winger'),
(12,'Forward'),
(13,'Striker'),
(14,'Defender'),
(15,'Goalkeeper'),
(16,'Midfielder'),
(17,'Winger'),
(18,'Forward'),
(19,'Striker'),
(20,'Defender');


INSERT INTO manufacture_T (workcenter_id, prod_id) VALUES
(101, 301),
(102, 302),
(103, 303),
(104, 304),
(105, 305),
(106, 306),
(107, 307),
(108, 308),
(109, 309),
(110, 310),
(111, 311),
(112, 312),
(113, 313),
(114, 314),
(115, 315),
(116, 316),
(117, 317),
(118, 318),
(119, 319),
(120, 320);


INSERT INTO supplies_T (material_id, vendor_id, unit_price) VALUES
(1001, 1, 50),
(1002, 2, 40.5),
(1003, 3, 100.75),
(1004, 4, 30),
(1005, 5, 55.5),
(1006, 6, 45.5),
(1007, 7, 500),
(1008, 8, 10),
(1009, 9, 15.5),
(1010, 10, 13.5),
(1011, 11, 9),
(1012, 12, 10.5),
(1013, 13, 22),
(1014, 14, 30),
(1015, 15, 50),
(1016, 16, 60.5),
(1017, 17, 80),
(1018, 18, 90.5),
(1019, 19, 75),
(1020, 20, 50.75);


INSERT INTO prodmaterial_T (prod_id, material_id) VALUES
(301, 1001),
(302, 1002),
(303, 1003),
(304, 1004),
(305, 1005),
(306, 1006),
(307, 1007),
(308, 1008),
(309, 1009),
(310, 1010),
(311, 1011),
(312, 1012),
(313, 1013),
(314, 1014),
(315, 1015),
(316, 1016),
(317, 1017),
(318, 1018),
(319, 1019),
(320, 1020);


INSERT INTO order_T (order_id, order_date, cust_id) VALUES
(401, '2021-01-01', 2001),
(402, '2021-01-02', 2002),
(403, '2021-01-03', 2003),
(404, '2021-01-04', 2004),
(405, '2021-01-05', 2005),
(406, '2021-01-06', 2006),
(407, '2021-01-07', 2007),
(408, '2021-01-08', 2008),
(409, '2021-01-09', 2009),
(410, '2021-01-10', 2010),
(411, '2021-01-11', 2011),
(412, '2021-01-12', 2012),
(413, '2021-01-13', 2013),
(414, '2021-01-14', 2014),
(415, '2021-01-15', 2015),
(416, '2021-01-16', 2016),
(417, '2021-01-17', 2017),
(418, '2021-01-18', 2018),
(419, '2021-01-19', 2019),
(420, '2021-01-20', 2020);



INSERT INTO prodrequest_T (prod_id, order_id, quantity) VALUES
(301, 401, 10),
(302, 402, 20.5),
(303, 403, 15),
(304, 404, 15.5),
(305, 405, 13.75),
(306, 406, 30),
(307, 407, 25.75),
(308, 408, 25),
(309, 409, 100),
(310, 410, 200),
(311, 411, 20.5),
(312, 412, 50.5),
(313, 413, 40),
(314, 414, 90),
(315, 415, 80.5),
(316, 416, 40),
(317, 417, 45),
(318, 418, 47.5),
(319, 419, 50),
(320, 420, 30.5);



INSERT INTO custbusiness_T (cust_id, territory_id) VALUES
(2001, 10001),
(2002, 10002),
(2003, 10003),
(2004, 10004),
(2005, 10005),
(2006, 10006),
(2007, 10007),
(2008, 10008),
(2009, 10009),
(2010, 10010),
(2011, 10011),
(2012, 10012),
(2013, 10013),
(2014, 10014),
(2015, 10015),
(2016, 10016),
(2017, 10017),
(2018, 10018),
(2019, 10019),
(2020, 10020);


/*Q1*/
SELECT 'employee_T' as Employee_Table, COUNT(*) FROM employee_T;
SELECT 'workcenter_T' as WorkCenter_Table, COUNT(*) FROM workcenter_T;
SELECT 'productline_T' as ProductLine_Table, COUNT(*) FROM productline_T;
SELECT 'rawmaterial_T' as RawMaterial_Table, COUNT(*) FROM rawmaterial_T;
SELECT 'customer_T' as Customer_Table, COUNT(*) FROM customer_T;
SELECT 'vendor_T' as Vendor_Table, COUNT(*) FROM vendor_T;
SELECT 'salesterritory_T' as SalesTerritory_Table, COUNT(*) FROM salesterritory_T;
SELECT 'salesperson_T' as SalesPerson_Table, COUNT(*) FROM salesperson_T;
SELECT 'worksin_T' as WorksIn_Table, COUNT(*) FROM worksin_T;
SELECT 'product_T' as Product_Table, COUNT(*) FROM product_T;
SELECT 'empskill_T' as EmployeeSkill_Table, COUNT(*) FROM empskill_T;
SELECT 'manufacture_T' as Manufacture_Table, COUNT(*) FROM manufacture_T;
SELECT 'supplies_T' as Supplies_Table, COUNT(*) FROM supplies_T;
SELECT 'prodmaterial_T' as ProductMaterial_Table, COUNT(*) FROM prodmaterial_T;
SELECT 'order_T' as Order_Table, COUNT(*) FROM order_T;
SELECT 'prodrequest_T' as ProductRequest_Table, COUNT(*) FROM prodrequest_T;
SELECT 'custbusiness_T' as CustomerBusiness_Table, COUNT(*) FROM custbusiness_T;

/*Q2*/
SELECT * FROM product_T CROSS JOIN customer_T
CROSS JOIN employee_T
CROSS JOIN workcenter_T;

/*Q3*/
SELECT customer_T.cust_id, customer_T.cust_name, customer_T.cust_address,
product_T.prod_desc, salesterritory_T.territory_id
FROM customer_T, product_T, order_T, prodrequest_T, salesterritory_T, custbusiness_T
WHERE customer_T.cust_id = order_T.cust_id
AND order_T.order_id = prodrequest_T.order_id
AND prodrequest_T.prod_id = product_T.prod_id
AND salesterritory_T.territory_id = custbusiness_T.territory_id
AND custbusiness_T.cust_id = customer_T.cust_id
AND product_T.prod_desc IN ('Basic', 'Luxury') AND salesterritory_T.territory_id in (10003,10005);

/*Q4*/
SELECT e.emp_name, e.emp_id, e.emp_address, e.supervisor, wc.location FROM employee_T as e
INNER JOIN worksin_T as w ON e.emp_id = w.emp_id
INNER JOIN workcenter_T as wc ON w.workcenter_id = wc.workcenter_id
AND e.emp_name LIKE 'J%'
AND wc.location IN ('Barcelona', 'Munich');

UPDATE employee_T
SET emp_name = 'Jurgen Klopp' WHERE emp_id = 17;

/*Q5*/
SELECT salesperson_T.salesperson_name, salesterritory_T.territory_id
FROM salesperson_T NATURAL JOIN salesterritory_T
WHERE salesterritory_T.territory_id IN (10010, 10005, 10007);

/*Q6*/
SELECT * FROM productline_T
LEFT JOIN product_T
ON productline_T.productline_id = product_T.productline_id;

/*Q7*/
SELECT material_id FROM rawmaterial_T
UNION
SELECT material_id FROM supplies_T;

/*Q8*/
SELECT cust_id FROM order_T
UNION ALL
SELECT cust_id FROM customer_T;

/*Q9*/
SELECT emp_id FROM employee_T
WHERE EXISTS
(SELECT emp_id FROM empskill_T
WHERE empskill_T.emp_id = employee_T.emp_id);

/*Q10*/
CREATE VIEW cust_info AS
(SELECT customer_T.* , workcenter_T.location
FROM customer_T NATURAL JOIN order_T NATURAL JOIN prodrequest_T NATURAL JOIN product_T
NATURAL JOIN manufacture_T NATURAL JOIN workcenter_T
WHERE workcenter_T.location IN ('Barcelona', 'Madrid'));

SELECT * FROM cust_info;

/*Q11*/
DELIMITER //
CREATE PROCEDURE prod_desc_x ( IN x_count int(10))
BEGIN
SELECT * FROM product_T
WHERE prod_id IN
(
SELECT prod_id FROM
prodrequest_T
GROUP BY prod_id
HAVING count(prod_id) > x_count
);
END //
DELIMITER ;

CALL prod_desc_x (0);







