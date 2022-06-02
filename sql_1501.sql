Drop database if exists php_project;
CREATE DATABASE IF NOT EXISTS  php_project;
use php_project;




-- creating table 
-- creating person table 1
CREATE TABLE IF NOT EXISTS `person`(
 `id` INT AUTO_INCREMENT,
`name` VARCHAR(85) NOT NULL,
`email` VARCHAR(150) NOT NULL UNIQUE,
`dob` DATE NOT NULL,
`city` VARCHAR(100) NOT NULL,
`state` VARCHAR(100) NOT NULL,
`country` VARCHAR(100) NOT NULL,
`pin_code` VARCHAR(100) NOT NULL,
`phone_num` VARCHAR(50) NOT NULL UNIQUE,
`password` VARCHAR(85) NOT NULL,
PRIMARY KEY person_pk(`id`)
);

insert into person (`name`,`email`,`dob`,`city`,`state`,`country`,`pin_code`,`phone_num`,`password`)
values("gurpinder","singh9464274057@gmail.com","2000-11-15","s","s","s","144059","234234232","password@123");

-- creating subscription table 6
CREATE TABLE IF NOT EXISTS `subscription_plans`(
	`id` INT AUTO_INCREMENT,
    `title` VARCHAR (85),
	`description` VARCHAR(255),
    `price` INT,
    `book_issue_limit` INT,
    `issue_days` INT,
    `time_period` INT, 
    PRIMARY KEY subcription_pk (`id`)
);


-- creating user table 2
CREATE TABLE IF NOT EXISTS `subscribers`(
`id` INT auto_increment,
`person_id` INT not null unique,
FOREIGN KEY user_fk (`person_id`) REFERENCES `person`(`id`),
PRIMARY KEY user_pk(`id`)
);


drop table `subscribes_to`;
create table `subscribes_to`(
	`id` int auto_increment,
    `subscription_plan_id` int not null,
    `subscriber_id` int not null,
	`purchase_date` date,
    FOREIGN KEY `subscriber_fk`(`subscriber_id`) REFERENCES `subscribers`(`id`),
    FOREIGN KEY `subscription_plans` (`subscription_plan_id`) REFERENCES `subscription_plans`(`id`),
    primary key `subscribes_to_pk`(id)
);



-- creating staff_members table 3
CREATE TABLE IF NOT EXISTS `staff_members`(
`id` 	INT auto_increment,
`person_id` Int not null unique,
`salary` INT NOT NULL,
`is_admin` INT ,
FOREIGN KEY person_fk (`person_id`) REFERENCES `person`(`id`),
PRIMARY KEY staff_member_pk(`id`)

);

-- creating publisher table 8
CREATE TABLE IF NOT EXISTS publishers(
`id` INT AUTO_INCREMENT,
`name` VARCHAR(85) not null unique,
`contact_info` VARCHAR(200),
PRIMARY KEY publisher_pk(`id`)
);
 

-- creating categories table 10
CREATE TABLE IF NOT EXISTS categories(
`id` INT AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL unique,
`desc` VARCHAR(255),  
PRIMARY KEY category_pk(`id`)
);



-- creating author table 9
CREATE TABLE IF NOT EXISTS authors(
`id` INT AUTO_INCREMENT,
`name` VARCHAR(85)  NOT NULL UNIQUE,
`contact_info` VARCHAR(200),
PRIMARY KEY author_pk(`id`)
);



-- creating  book table 7
CREATE TABLE IF NOT EXISTS books(
`accession_no` INT AUTO_INCREMENT,
`title` VARCHAR(85) NOT NULL,
`condition` ENUM('best','good','bad'),  
`page_count` INT NOT NULL,
`year_of_publication` DATE NOT NULL,
`language` varchar(50) NOT NULL,
`volume` INT not null,
`publisher_id` INT NOT NULL,
`category_id` INT NOT NULL,
`author_id` INT NOT NULL,
FOREIGN KEY book_publisher_fk(`publisher_id`) references publishers(`id`),
FOREIGN KEY book_category_fk(`category_id`) references categories(`id`),
FOREIGN KEY book_author_fk(`author_id`) references authors(`id`),
PRIMARY KEY book_pk(`accession_no`)
);





-- creating borrow_books table 11
CREATE TABLE IF NOT EXISTS borrow_books(
`id` INT AUTO_INCREMENT,
`issue_date` DATE NOT NULL,
`return date` DATE,
`expected_return_date` DATE NOT NULL,
`book_id` int,
`subscriber_id` int,
foreign key book_borrow_books_fk (`book_id`) references `books`(`accession_no`),
foreign key user_borrow_books_fk (`subscriber_id`) references `subscribers`(`id`),
PRIMARY KEY borrow_books_pk(`id`)
);


-- Retrieving data from tables
SELECT * FROM PERSON;
SELECT * FROM STAFF_MEMBERS;
SELECT * FROM subscribers;
SELECT * FROM BOOKS;
SELECT * FROM BORROW_BOOKS;
SELECT * FROM AUTHORS;
SELECT * FROM CATEGORIES;
select * from categories;
update categories set name = 'name', `desc` = 'description' where id = 5;
SELECT * FROM PUBLISHERS;
select * from subscription_plans;
select * from subscribes_to;




-- DROPING TABLES
DROP TABLE IF EXISTS PERSON;
DROP TABLE IF EXISTS STAFF_MEMBERS;
DROP TABLE IF EXISTS CUSTOMERS;
DROP TABLE IF EXISTS BOOKS;
DROP TABLE IF EXISTS BORROW_BOOKS;
DROP TABLE IF EXISTS AUTHORS;
DROP TABLE IF EXISTS CATEGORIES;
DROP TABLE IF EXISTS PUBLISHERS;
DROP TABLE IF EXISTS SUBSCRIPTIONS;


-- DELETING DATA FROM TABLES
DELETE FROM PERSON;
DELETE FROM STAFF_MEMBERS;
DELETE FROM CUSTOMERS;
DELETE FROM BOOKS;
DELETE FROM BORROW_BOOKS;
DELETE FROM AUTHORS;
DELETE FROM CATEGORIES;
DELETE FROM PUBLISHERS;
DELETE FROM ROLES;
DELETE FROM SUBSCRIPTIONS;
show tables;

select last_insert_id() from books;
DELETE FROM CUSTOMERS WHERE id = 1;
delete from person where id = 1;
use php_project;
show tables;

select * from books;


select sp.issue_days as issue_days from subscribers s inner join subscribes_to st on s.id = st.subscriber_id inner join subscription_plans sp on sp.id = st.subscription_plan_id where s.id = 1;

alter table subscription_plans drop column description; 
alter table subscription_plans add column isActive ENUM('0','1') not null default("1");
