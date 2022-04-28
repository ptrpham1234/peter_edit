DROP DATABASE IF EXISTS COMPANY;
CREATE DATABASE COMPANY;
USE COMPANY;


DROP TABLE IF EXISTS MANAGER;
CREATE TABLE MANAGER (
    manager_ID CHAR(10) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    department VARCHAR(20),
    pay DECIMAL(10 , 2 ),
    ssn CHAR(9),
    middle_name VARCHAR(20),
    CONSTRAINT pk_manager PRIMARY KEY (manager_ID)
);

DROP TABLE IF EXISTS STORE;
CREATE TABLE STORE (
    store_ID CHAR(5) NOT NULL,
    manager_ID CHAR(10),
    phone_number CHAR(10),
    CONSTRAINT pk_store PRIMARY KEY (store_ID),
    CONSTRAINT fk_store_manager FOREIGN KEY (manager_ID)
        REFERENCES MANAGER (manager_ID)
);

DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
    employee_ID CHAR(10) NOT NULL,
    ssn CHAR(9),
    email VARCHAR(50),
    phone_number CHAR(10),
    manager_ID CHAR(10),
    pay DECIMAL(10 , 2 ),
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    middle_name VARCHAR(20),
    address VARCHAR(50),
    CONSTRAINT pk_employee PRIMARY KEY (employee_ID),
    CONSTRAINT fk_emp_manager FOREIGN KEY (manager_ID)
        REFERENCES MANAGER (manager_ID)
);

DROP TABLE IF EXISTS Users;
CREATE TABLE Users (
    customer_ID CHAR(10) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    phone_num CHAR(10),
    reward_points INT,
    address CHAR(50),
    CONSTRAINT pk_user PRIMARY KEY (customer_ID),
    CONSTRAINT uk_address UNIQUE KEY (address)
);

DROP TABLE IF EXISTS Tracking;
CREATE TABLE Tracking (
    tracking_ID CHAR(10) NOT NULL,
    depart_time TIME,
    arrive_time TIME,
    destination CHAR(50) NOT NULL,
    weight DECIMAL(10 , 2 ),
    length DECIMAL(10 , 2 ),
    width DECIMAL(10 , 2 ),
    container_ID CHAR(10),
    item_ID CHAR(10),
    customer_ID CHAR(10),
    CONSTRAINT pk_tracking PRIMARY KEY (tracking_ID),
    CONSTRAINT fk_destination FOREIGN KEY (destination)
        REFERENCES Users (address)
);

DROP TABLE IF EXISTS Brand;
CREATE TABLE Brand (
    brand_ID CHAR(10) NOT NULL,
    brand_name VARCHAR(20),
    CONSTRAINT pk_brand PRIMARY KEY (brand_ID)
);

DROP TABLE IF EXISTS Items;
CREATE TABLE Items (
    item_ID CHAR(10) NOT NULL,
    cost DECIMAL(10 , 2 ),
    item_type VARCHAR(20),
    brand_ID CHAR(10),
    CONSTRAINT pk_item PRIMARY KEY (item_ID),
    CONSTRAINT fk_brand FOREIGN KEY (brand_ID)
        REFERENCES Brand (brand_ID)
);

DROP TABLE IF EXISTS Purchases;
CREATE TABLE Purchases (
    purchase_ID CHAR(10) NOT NULL,
    item_ID CHAR(10) NOT NULL,
    amount DECIMAL(10 , 2 ),
    points_earned INT,
    tracking_ID CHAR(10),
    customer_ID CHAR(10),
    store_ID CHAR(5),
    CONSTRAINT pk_purchase PRIMARY KEY (purchase_ID),
    CONSTRAINT fk_item FOREIGN KEY (item_ID)
        REFERENCES Items (item_ID),
    CONSTRAINT fk_store FOREIGN KEY (store_ID)
        REFERENCES Store (store_ID),
    CONSTRAINT fk_customer FOREIGN KEY (customer_ID)
        REFERENCES Users (customer_ID)
);

-- separator

INSERT INTO MANAGER VALUES
('7066636290', 'Jason', 'Smith', 'Store', '50.72', '518277758', 'Ray'),
('2119709289','Omer','Rubhani','Janitorial','27.60','984649826','John'),
('8856474475','Nate','Parrish','Childrens','17.25','809715585','Lee'),
('3237528806','Michael','Kessler','Mens','28.26','974863016','Allen'),
('7022483073','Nir','Gilgur','Shoes','30.77','665310543','Peter'),
('9104932308','James','Brown','Womens','25.28','621965046','David');

INSERT INTO STORE VALUES('12345', '7066636290', '6204689678');

INSERT INTO EMPLOYEE VALUES 
('4941732246','391470494','rnucciotti0@twitter.com','3749907418','2119709289','9.95','Vaughan','Nucciotti','Reinhold','240 Packers Trail'),
('6632723087','193255248','acleall1@statcounter.com','1295937662','2119709289','8.51','Abraham','Cleall','Adler','918 Manley Crossing'),
('1005135750','441386029','gmatanin2@simplemachines.org','6383061371','2119709289','12.68','Fanechka','Matanin','Gabbey','63643 Carpenter Lane'),
('7772735652','882873412','lbotterell3@google.nl','0966947105','8856474475','9.08','Aryn','Botterell','Lira','262 Harper Center'),
('8286492992','492351026','jace4@google.co.jp','8700046167','8856474475','9.05','Brent','Ace','Jacob','85646 Lakewood Court'),
('8319107238','671830559','sdebold5@patch.com','3739372621','8856474475','13.54','Archibald','Debold','Siffre','73845 Hallows Terrace'),
('4532161982','108168716','shardacre6@wisc.edu','1975153987','3237528806','10.23','Claudianus','Hardacre','Sarina','3571 Bartelt Street'),
('5698010739','269803604','jclubley7@webnode.com','3547615329','3237528806','14.11','Curcio','Clubley','Judie','65 Glendale Alley'),
('4153013526','174347782','dhaville8@edublogs.org','4641704545','3237528806','13.79','Janetta','Haville','Dru','70010 Monument Crossing'),
('3106242158','372707090','jmattholie9@illinois.edu','6080122675','7022483073','9.94','Markus','Mattholie','Jobey','93 Manufacturers Alley'),
('3681516074','195411547','mgreydona@github.io','5242768451','7022483073','12.71','Alasteir','Greydon','Milena','3 Gina Hill'),
('1466736122','147593197','rsemirasb@storify.com','3428515249','7022483073','8.71','Gene','Semiras','Randall','204 Fisk Lane'),
('8301127845','663465505','kshearmurc@mapquest.com','7705888996','9104932308','9.37','Emanuele','Shearmur','Konstantin','168 Johnson Avenue'),
('7042122757','279054667','myvond@zimbio.com','3310615767','9104932308','13.25','Abbey','Yvon','Morena','4277 Linden Lane'),
('3548057937','961454503','dbesse@lycos.com','6998867345','9104932308','8.23','Sidonnie','Bess','Drucie','26 Hazelcrest Junction');

INSERT INTO USERS VALUES 
('6604725132','Derward','Hoofe','2760202574','616','3 Union Lane'),
('0290577461','Clarette','Randell','7278655637','249','8 Morningstar Terrace'),
('0310096669','Alfonso','Muglestone','9439606697','930','79790 Schmedeman Center'),
('6823578230','Horacio','Joicey','0329822341','445','7818 Ruskin Drive'),
('2629080114','Hollyanne','Davenhill','4440309215','543','50 Nobel Circle'),
('9291939234', 'Sisely', 'Goom', '2871716560', '46', '8 Fallview Circle'),
('2379462638', 'Lamont', 'Segeswoeth', '5666123022', '02', '4777 Washington Parkway'),
('2809625729', 'Marsiella', 'Stallon', '3923597219', '344', '75137 Veith Court'),
('3105629384', 'Alejandra', 'Dunsford', '8506856180', '13908', '3 Burrows Terrace'),
('2297527547', 'Deni', 'Dionsetti', '9701078905', '85', '57 Trailsway Crossing'),
('1190437865', 'Caryl', 'Ballston', '5972379936', '80731', '92 Jana Court'),
('5400368866', 'Angela', 'Shreve', '6329543167', '1', '2781 Orin Road'),
('3674270280', 'Maggy', 'Pellingar', '2013194474', '14797', '4290 Reindahl Point'),
('3203610731', 'Ricard', 'Grishelyov', '6005670065', '642', '01182 Mallard Crossing'),
('7935954667', 'Antonina', 'Colley', '7063503745', '47269', '77447 Walton Crossing'),
('3831842872', 'Pat', 'Farans', '5622448926', '41038', '88986 Portage Pass'),
('8046818410', 'Rebecca', 'Norley', '1961467269', '2', '32 Clemons Center'),
('5744505276', 'Cody', 'Blindmann', '4397878522', '615', '67 Cody Trail'),
('1556318478', 'Burnard', 'Rotham', '5956496358', '54', '22891 Bowman Pass'),
('1687194757', 'Gregor', 'Casely', '6587967180', '9035', '9064 Lyons Street'),
('8255043007', 'Danila', 'Dunsmore', '4985171653', '74760', '868 Vernon Junction'),
('1445370923', 'Lillis', 'McKean', '7028434010', '8626', '9 Grover Alley'),
('4741649550', 'Adelina', 'Shills', '6112537669', '2', '9935 Pleasure Street'),
('6358635482', 'Windham', 'Hammant', '3301644047', '3', '8393 Corscot Street'),
('7769357542', 'Tod', 'Ribbens', '8542337759', '05908', '577 Kings Crossing'),
('2355249283', 'Charita', 'Hightown', '4572108765', '56', '73005 Schmedeman Park'),
('8355247379', 'Del', 'House', '7815412739', '85', '801 Village Avenue'),
('5929420611', 'Lula', 'Dumper', '8011596452', '7809', '82189 Cascade Circle'),
('1458497500', 'Ethelbert', 'Balhatchet', '2697375061', '139', '7 Starling Alley'),
('9015208192', 'Norbert', 'Scaife', '3156373830', '35', '3446 Maple Court'),
('8205207930', 'Dede', 'Deverale', '1105341620', '2', '5 Dawn Lane'),
('5574244598', 'Nowell', 'Horlick', '7242249129', '970', '10439 Dennis Plaza'),
('1059039929', 'Marmaduke', 'De Coursey', '4568088736', '0358', '2501 Harbort Way'),
('1024564365', 'Stace', 'Pratley', '6122156800', '9243', '22932 Monterey Hill'),
('8668967754', 'Edi', 'Crate', '6866664640', '12445', '4981 Rieder Circle'),
('4869522900', 'Amitie', 'Tuckwell', '5821599784', '47', '42 Center Junction'),
('7430032687', 'Stirling', 'Cookes', '5885256760', '014', '9031 Del Sol Avenue'),
('3241435466', 'Abdel', 'Grigoliis', '9341376449', '444', '361 Hudson Hill'),
('5723601544', 'Jackie', 'Poles', '9706243851', '33', '53548 Mendota Terrace'),
('4840369118', 'Sherlocke', 'Humm', '2421833802', '97', '32520 Harper Crossing'),
('5847746625', 'Chic', 'Tritten', '8763773237', '939', '0 Huxley Terrace'),
('7448601364', 'Fenelia', 'Girdler', '4944213522', '34', '0 Lillian Pass'),
('1703317616', 'Marijn', 'Ganny', '1399426744', '44', '66076 Cardinal Hill'),
('8490421264', 'Frederik', 'Smartman', '6359478448', '76908', '8 Michigan Drive'),
('1650035298', 'Garnet', 'Guiet', '6905567696', '787', '7241 Laurel Point'),
('6817174758', 'Clayborn', 'Tudhope', '6099205761', '97993', '41209 Schiller Alley'),
('2418984481', 'Teri', 'Bairnsfather', '7995875198', '08', '6409 Melody Drive'),
('3511720390', 'Hadley', 'Ashbe', '9731484569', '3', '39853 Laurel Lane'),
('7356460730', 'Irvin', 'Dye', '7351061416', '5', '443 Brown Parkway'),
('7782278609', 'Audrey', 'Siseland', '8507739058', '24', '707 Crest Line Terrace'),
('6872546633', 'Karalynn', 'Vasey', '2034129978', '98042', '7809 Coleman Pass'),
('9411715512', 'Raddie', 'Traite', '7234627957', '48179', '26 Atwood Drive'),
('1922004557', 'Catha', 'Glavin', '7376620739', '2828', '9 Crowley Plaza'),
('6145717308', 'Quinn', 'Wager', '3998553745', '41408', '0 Chive Street'),
('4706538976', 'Rik', 'Gonet', '2218459286', '26', '631 Mcguire Road'),
('8882237274', 'Bald', 'Duffet', '7765373830', '26', '01348 Aberg Drive'),
('1960960930', 'Cooper', 'Groucock', '1584521654', '72089', '05 Ramsey Crossing'),
('1193050635', 'Genevra', 'Luxon', '8939323742', '1192', '730 5th Center'),
('5380012761', 'Mikkel', 'Spilsted', '3482143030', '0879', '9 Judy Place'),
('5667011217', 'Clarissa', 'Kernocke', '4799276475', '1', '05581 Onsgard Plaza'),
('2773971123', 'Correy', 'Deelay', '7124403928', '25557', '94 Ridge Oak Circle'),
('8448095410', 'Esther', 'Goodday', '5709762356', '3', '78087 Eastwood Lane'),
('8753172077', 'Frank', 'MacQuaker', '5043056643', '66', '652 Green Court'),
('7726600278', 'Bonnie', 'O''Gaven', '7285143905', '153', '7 Mitchell Hill'),
('9863032908', 'Nobie', 'Sumers', '2132937236', '6', '00420 Fulton Court'),
('4093410218', 'Sean', 'Cufley', '5289496108', '19303', '300 Monterey Park'),
('7568826472', 'Noby', 'Costy', '4922046633', '83', '90 Schurz Avenue'),
('9235518266', 'Mohammed', 'Wingar', '5795219375', '0', '1538 Springview Circle'),
('7046422931', 'Rani', 'Ashforth', '5775591286', '44319', '416 Mcguire Alley'),
('1721538748', 'Parrnell', 'Turney', '1189568044', '75321', '82038 Canary Parkway'),
('8109879389', 'Benni', 'Davidovits', '2979624603', '960', '436 Dunning Center'),
('4124984322', 'Cort', 'Blackaller', '7774857834', '3', '88599 Kim Point'),
('3279463957', 'Vasily', 'Lymbourne', '7613699358', '34338', '4 Arapahoe Avenue'),
('2674795645', 'Rebekkah', 'Crombie', '7113087030', '411', '42707 Raven Place'),
('8477465037', 'Tessie', 'Cheeld', '8978653557', '54657', '9 Tennyson Road'),
('6090569120', 'Shannah', 'Ondricek', '5978379332', '5314', '0 Steensland Circle'),
('1133321885', 'Selene', 'Beverstock', '9846736076', '65186', '15849 Northland Place'),
('5035880572', 'Andria', 'Jancey', '6316608159', '89322', '470 Oak Point'),
('2066462485', 'Nanice', 'Fritchly', '8079249165', '5', '2869 Jenna Court'),
('8650676186', 'Costa', 'Mateescu', '1137838001', '529', '381 Autumn Leaf Park'),
('8528287118', 'Hayward', 'Yele', '4473343229', '84334', '784 3rd Street'),
('4335021459', 'Udale', 'Amos', '2442733820', '647', '0748 Nova Court'),
('2019334154', 'Iorgo', 'Fillingham', '7763424851', '36938', '2737 Northport Park'),
('5156214487', 'Orlan', 'Jennings', '6173282353', '3', '1715 Aberg Terrace'),
('6416748263', 'Camala', 'Chestle', '8401984636', '9', '7294 Tomscot Way'),
('5533243043', 'Garrik', 'Croom', '9198006688', '28127', '4 Cody Pass'),
('2302835777', 'Marc', 'Castiello', '8988358745', '703', '12 Kensington Road'),
('4601826631', 'Jameson', 'Di Biasi', '7669200571', '80339', '39654 Hallows Center'),
('8012745929', 'Cash', 'Kinleyside', '8835371146', '4592', '002 Montana Drive'),
('9965567176', 'Seamus', 'Astridge', '1987743514', '3', '5704 Boyd Pass'),
('5407526790', 'Erica', 'Skyme', '8121398258', '2472', '3740 Straubel Point'),
('3040937911', 'Alexei', 'Tilson', '8276276225', '617', '9646 Sutherland Trail'),
('6028135317', 'Reinhard', 'Caudray', '3703422517', '4214', '22 Raven Point'),
('7533827153', 'Siffre', 'Enden', '8633749433', '79', '79 Blaine Crossing'),
('4163539959', 'Conan', 'Bramsen', '6479833492', '98447', '3 Carioca Street'),
('2206327963', 'Sabrina', 'McGrath', '2826823768', '7', '90924 Fremont Trail'),
('4159505366', 'Brendon', 'Orrow', '9606759026', '9029', '9764 Comanche Place'),
('6623572609', 'Avigdor', 'Fust', '7224774097', '79244', '391 Hagan Trail'),
('6210072445', 'Dov', 'Parfett', '7171140540', '7433', '90240 Schlimgen Crossing'),
('4361680053', 'Randene', 'Astell', '2255822124', '1', '14764 Utah Way'),
('4769347431', 'Celisse', 'Antonijevic', '3695277016', '9188', '7 Banding Pass'),
('9686658579', 'Towny', 'Corking', '2187255878', '75', '01 Mayfield Place'),
('6804007477', 'Hermine', 'Fuge', '9823836499', '86154', '414 Caliangt Crossing'),
('5853031485', 'Alric', 'Croxton', '6017682180', '94442', '133 Corscot Way'),
('9059631397', 'Dwight', 'Eckersall', '7437884663', '78939', '70 4th Pass');

insert into Tracking values ('Sy2HuRUFX2', '2021-06-04 22:42:52', '2021-07-17 03:42:02', '7294 Tomscot Way', 13.86, 44.82, 49.12, 'sSKieYoccM', 7138517899, '6416748263'),
('KcnSVy13UM', '2022-01-31 13:37:13', '2021-06-08 00:03:42', '7241 Laurel Point', 17.44, 18.64, 32.35, 'wB8cDMHh6f', 1696928366, '1650035298'),
('NwipxdRJVM', '2022-02-08 05:25:11', '2021-09-22 15:52:59', '3 Union Lane', 35.36, 43.54, 42.29, 'Lar6WXvNLy', 5268792434, '6604725132'),
('ESg15ulza2', '2021-06-13 07:29:35', '2022-02-21 19:52:39', '01182 Mallard Crossing', 8.38, 11.94, 17.84, 'Nnvc4YiaXv', 2071129437, '3203610731'),
('wVcb3FuU66', '2022-04-22 01:55:04', '2022-01-18 02:33:20', '32 Clemons Center', 5.35, 4.12, 22.01, 'Pq4O3tMRhY', 6337558729, '8046818410'),
('ALOfVoCNCQ', '2021-11-09 09:41:53', '2022-04-10 02:12:18', '53548 Mendota Terrace', 22.38, 47.01, 38.32, 'ARq4CCHnHQ', 8333212393, '5723601544'),
('ytLE1oGtp6', '2021-05-16 06:19:08', '2022-04-25 09:51:17', '05 Ramsey Crossing', 33.21, 10.65, 49.96, 'Ut8rWX9n2X', 4301072480, '1960960930'),
('Do7Y6TMjOD', '2022-01-30 02:30:06', '2021-11-25 13:52:18', '9 Tennyson Road', 32.68, 44.57, 1.78, 'eSWz41XTeM', 5701435996, '8477465037'),
('Wp0mxqKbI2', '2021-09-15 01:05:10', '2021-11-02 00:36:25', '3740 Straubel Point', 39.78, 16.19, 46.54, 'aNqlzyoQSf', 9625451414, '5407526790'),
('9Gm1dJBQY7', '2021-12-19 03:47:24', '2021-09-24 19:40:02', '391 Hagan Trail', 27.67, 44.62, 3.24, 'IiVOk91tiy', 9870256558, '6623572609');


insert into brand values 
(1847828588, 'Schmitt Inc'),
(6584662294, 'Collier and Schultz'),
(3026087388, 'Douglas Group'),
(3862438533, 'Rosenbaum-Corwin'),
(6929649207, 'Rohan and Hackett'),
(2119654589, 'Larson Inc'),
(6561644045, 'Hand Inc'),
(2625280924, 'Stroman LLC'),
(4115060737, 'Davis and Sons'),
(7469574971, 'Thompson-MacGyver');

insert into Items values 
(3707232671, 18.27, 'Baby', 1847828588),
(3454166092, 268.28, 'Games', 1847828588),
(8660764238, 450.65, 'Clothing', 3026087388),
(4681087101, 418.62, 'Home', 1847828588),
(5159103470, 392.06, 'Shoes', 1847828588),
(6156728892, 36.3, 'Games', 3026087388),
(3018776604, 136.96, 'Clothing', 3026087388),
(6127671158, 434.1, 'Kids', 1847828588),
(9615093992, 75.66, 'Garden', 6929649207),
(9125947316, 139.61, 'Health', 6929649207),
(5850041484, 1.14, 'Electronics', 4115060737),
(1657158655, 273.25, 'Industrial', 1847828588),
(8214768679, 232.33, 'Clothing', 1847828588),
(8214788679, 108.82, 'Shoes', 1847828588),
(1824286070, 17.68, 'Industrial', 1847828588),
(6195740861, 7.27, 'Clothing', 6929649207),
(2990767662, 315.28, 'Health', 6929649207),
(7597641937, 487.61, 'Clothing', 1847828588),
(9119522841, 209.5, 'Industrial', 7469574971),
(8814788679, 54.6, 'Toys', 6929649207),
(5440060190, 154.31, 'Clothing', 7469574971),
(9623443159, 218.35, 'Home', 2119654589),
(4201760855, 70.34, 'Games', 3026087388),
(9531355856, 52.01, 'Home', 2119654589),
(6384978638, 335.51, 'Sports', 3026087388),
(3899493156, 152.09, 'Toys', 3026087388),
(1214788679, 408.62, 'Shoes', 3026087388),
(6565218350, 402.67, 'Shoes', 2119654589),
(4896698958, 463.51, 'Electronics', 6929649207),
(3696492335, 212.6, 'Shoes', 2119654589),
(4683351245, 411.41, 'Clothing', 6929649207),
(6320759218, 242.17, 'Shoes', 6929649207),
(1314988779, 90.26, 'Electronics', 6929649207),
(8926123332, 138.03, 'Clothing', 4115060737),
(4289133341, 100.5, 'Home', 6929649207);


insert into Purchases values
(6239485307, 8214788679, 52.29, 14, 'Sy2HuRUFX2', '6416748263', 12345),
(7752829660, 8214788679, 89.56, 1, 'KcnSVy13UM', '1650035298', 12345),
(9907479924, 8214788679, 47.26, 17, 'NwipxdRJVM', '6604725132', 12345),
(2784128329, 8214788679, 63.97, 20, 'ESg15ulza2', '3203610731', 12345),
(9681529911, 8214788679, 87.56, 23, 'wVcb3FuU66', '8046818410', 12345),
(9331467664, 9125947316, 54.02, 13, 'ALOfVoCNCQ', '5723601544', 12345),
(4145410290, 9125947316, 54.07, 13, 'ytLE1oGtp6', '1960960930', 12345),
(5352534114, 4683351245, 97.5, 39, 'Do7Y6TMjOD', '8477465037', 12345),
(5242677941, 4289133341, 88.23, 14, 'Wp0mxqKbI2', '5407526790', 12345),
(2713228727, 8214788679, 31.32, 14, '9Gm1dJBQY7', '6623572609', 12345);


SELECT 
    *
FROM
    STORE;
SELECT 
    *
FROM
    MANAGER;
SELECT 
    *
FROM
    EMPLOYEE;
SELECT 
    *
FROM
    USERS;
SELECT 
    *
FROM
    Tracking;

