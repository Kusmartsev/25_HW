--Таблица employees
--    Создать таблицу employees
--      id. serial,  primary key, employee_name. Varchar(50), not null
--    Наполнить таблицу employee 70 строками

create table employees(
  id serial primary key, 
  employee_name varchar(50) not null
  );
  
 select * from employees;
 
insert into employees(employee_name)
values
('Karen Jordan'),
('Jennifer Hunt'),
('Colleen Montgomery'),
('Martha Wright'),
('Phillip Reed'),
('Michael Smith'),
('Rachel Mason'),
('Barbara Mitchell'),
('Rachel Reid'),
('Kim Clarke'),
('Bonnie Erickson'),
('Richard Terry'),
('William Cole'),
('Michael Williams'),
('Debra Johnson'),
('Christina Collins'),
('Antonio Harrison'),
('Sandra Barnes'),
('John Turner'),
('Sharon Hunter'),
('Monica Hughes'),
('Patricia Castro'),
('Nancy Austin'),
('Arlene Perkins'),
('Michael Burns'),
('Lisa Carlson'),
('Beatrice Edwards'),
('Tamara Reed'),
('Ruth Jenkins'),
('Lucille Barnes'),
('Glen Chapman'),
('Harold Evans'),
('Freddie Thomas'),
('Marc Cox'),
('Donald Williams'),
('Janet Moody'),
('Emma Morgan'),
('Elaine McCormick'),
('Thomas Lopez'),
('Alicia James'),
('Kevin Weber'),
('Todd Harrison'),
('Carmen Cannon'),
('Martha Myers'),
('Robert Bailey'),
('Judy Martin'),
('Pamela Rivera'),
('Margaret Rodriguez'),
('Albert Roberts'),
('Willie Wagner'),
('Debbie Mitchell'),
('Judy Luna'),
('Sarah Strickland'),
('Raymond Morton'),
('Ken Sanchez'),
('Ryan Perez'),
('Herbert Townsend'),
('Louise Kim'),
('Jason Johnson'),
('Brittany Chapman'),
('April Fuller'),
('Anne Smith'),
('Randy Cox'),
('Amy Cross'),
('Cindy Alexander'),
('Robert Ruiz'),
('Florence Moody'),
('Felix Johnson'),
('Kim Williams'),
('Julie Smith');

select * from employees;

-- drop table employees;

-- Таблица salary

--  Создать таблицу salary
--    id. Serial  primary key,
--    monthly_salary. Int, not null
-- Наполнить таблицу salary 15 строками:

create table salary(id serial primary key,
monthly_salary int not null);


--drop table salary;

select * from salary;

insert into salary(monthly_salary) 
values
(1000),
(1100),
(1200),
(1300),
(1400),
(1500),
(1600),
(1700),
(1800),
(1900),
(2000),
(2100),
(2200),
(2300),
(2400);

select * from salary;

--Таблица employee_salary

--Создать таблицу employee_salary
-- id. Serial  primary key,
-- employee_id. Int, not null, unique
-- salary_id. Int, not null
--Наполнить таблицу employee_salary 40 строками:
-- в 10 строк из 40 вставить несуществующие employee_id
create table employee_salary(
id serial primary key,
employee_id int not null unique,
salary_id int not null);

select * from employee_salary;

insert into employee_salary(employee_id, salary_id)
values
(1, 1),
(85, 2),
(2, 13),
(69, 4),
(81, 14),
(68, 3),
(5, 5),
(66, 2),
(90, 7),
(65, 1),
(8, 5),
(63, 10),
(10, 4),
(61, 2),
(12, 10),
(71, 11),
(14, 3),
(57, 11),
(72, 12),
(56, 6),
(73, 2),
(51, 9),
(17, 8),
(74, 5),
(19, 3),
(47, 12),
(80, 2),
(45, 14),
(82, 8),
(48, 2),
(24, 9),
(44, 13),
(25, 4),
(43, 6),
(83, 7),
(41, 9),
(29, 14),
(40, 8),
(31, 3),
(39, 6);

--drop table employee_salary;
select * from employee_salary;

--Таблица roles

--Создать таблицу roles
-- id. Serial  primary key,
-- role_name. int, not null, unique
-- Поменять тип столба role_name с int на varchar(30)
-- Наполнить таблицу roles 20 строками:

create table roles(id serial primary key, 
role_name int not null unique)

select * from roles;

alter table roles
alter column role_name type varchar(30);
 
insert into roles(role_name)
values 
('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior Java developer'),
('Middle Java developer'),
('Senior Java developer'),
('Junior JavaScript developer'),
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Junior Manual QA engineer'),
('Middle Manual QA engineer'),
('Senior Manual QA engineer'),
('Project Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales manager'),
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer');

--Таблица roles_employee

-- Создать таблицу roles_employee
-- id. Serial  primary key,
-- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
-- Наполнить таблицу roles_employee 40 строками:

create table roles_employee(
id serial primary key, 
employee_id int not null unique,
role_id int not null,
foreign key (employee_id)
references employees(id),
foreign key (role_id)
references roles(id));

select * from roles_employee;

insert into roles_employee(employee_id, role_id)
values
(1, 1),
(5, 2),
(7, 11),
(9, 18),
(11, 14),
(12, 17),
(15, 5),
(17, 1),
(19, 6),
(21, 13),
(24, 5),
(26, 9),
(28, 5),
(30, 3),
(32, 10),
(34, 4),
(37, 3),
(3, 11),
(40, 12),
(39, 6),
(38, 16),
(36, 10),
(35, 8),
(33, 6),
(31, 20),
(29, 12),
(27, 5),
(25, 14),
(23, 8),
(22, 1),
(20, 9),
(18, 7),
(16, 4),
(14, 6),
(13, 8),
(10, 9),
(8, 15),
(6, 7),
(4, 19),
(2, 6);


--=======================================2_ДЗ_SQL============================

--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select E.employee_name, S.monthly_salary
from employee_salary ES
join employees E on ES.employee_id=E.id
join salary S on ES.salary_id=S.id;

 --2. Вывести всех работников у которых ЗП меньше 2000.

select E.employee_name, S.monthly_salary 
from employee_salary ES
join employees E on ES.employee_id=E.id
join salary S on ES.salary_id=S.id
where S.monthly_salary < 2000;

 --3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select E.employee_name, S.monthly_salary 
from employee_salary ES
left join employees E on ES.employee_id=E.id
join salary S on ES.salary_id=S.id
where E.employee_name is null;

 --4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select E.employee_name, S.monthly_salary 
from employee_salary ES
left join employees E on ES.employee_id=E.id
join salary S on ES.salary_id=S.id
where E.employee_name is null and S.monthly_salary < 2000;

 --5. Найти всех работников кому не начислена ЗП.

select E.employee_name, S.monthly_salary
from employee_salary ES
left join employees E on ES.employee_id=E.id
join salary S on ES.salary_id=S.id
where E.employee_name is null;

 --6. Вывести всех работников с названиями их должности.

select E.employee_name, R.role_name
from roles_employee RE
join employees E on RE.employee_id=E.id
join roles R on RE.role_id=R.id;

 --7. Вывести имена и должность только Java разработчиков.

select E.employee_name, R.role_name
from roles_employee RE
join employees E on RE.employee_id=E.id
join roles R on RE.role_id=R.id
where R.role_name like '% Java %';

 --8. Вывести имена и должность только Python разработчиков.

select E.employee_name, R.role_name
from roles_employee RE
join employees E on RE.employee_id=E.id
join roles R on RE.role_id=R.id
where R.role_name like '% Python %';

 --9. Вывести имена и должность всех QA инженеров.

select E.employee_name, R.role_name
from roles_employee RE
join employees E on RE.employee_id=E.id
join roles R on RE.role_id=R.id
where R.role_name like '%QA engineer%';

 --10. Вывести имена и должность ручных QA инженеров.

select E.employee_name, R.role_name
from roles_employee RE
join employees E on RE.employee_id=E.id
join roles R on RE.role_id=r.id
where R.role_name like '%Manual QA engineer%';

 --11. Вывести имена и должность автоматизаторов QA

select E.employee_name, R.role_name
from roles_employee RE
join employees E on RE.employee_id=E.id
join roles R on RE.role_id=R.id
where R.role_name like '%Automation QA engineer%';

 --12. Вывести имена и зарплаты Junior специалистов

select E.employee_name, R.role_name, S.monthly_salary
from roles_employee RE
left join employee_salary ES on RE.employee_id=ES.employee_id
join roles R on RE.role_id=R.id
join employees E on RE.employee_id=E.id
join salary S on ES.salary_id=S.id
where role_name like '%Junior%' and monthly_salary is not null;

 --13. Вывести имена и зарплаты Middle специалистов

select E.employee_name, R.role_name, S.monthly_salary
from roles_employee RE
left join employee_salary ES on RE.employee_id=ES.employee_id
join roles R on RE.role_id=R.id
join employees E on RE.employee_id=E.id
join salary S on ES.salary_id=S.id
where role_name like '%Middle %' and monthly_salary is not null;

 --14. Вывести имена и зарплаты Senior специалистов

select E.employee_name, R.role_name, S.monthly_salary
from roles_employee RE
left join employee_salary ES on RE.employee_id=ES.employee_id
join roles R on RE.role_id=R.id
join employees E on RE.employee_id=E.id
join salary S on ES.salary_id=S.id
where role_name like '%Senior %' and monthly_salary is not null;

 --15. Вывести зарплаты Java разработчиков

select R.role_name, S.monthly_salary
from roles_employee RE
left join employee_salary ES on RE.employee_id=ES.employee_id
join roles R on RE.role_id=R.id
join employees E on RE.employee_id=E.id
join salary S on ES.salary_id=S.id
where role_name like '%Java %' and monthly_salary is not null;

 --16. Вывести зарплаты Python разработчиков

select R.role_name, S.monthly_salary
from roles_employee RE
left join employee_salary ES on RE.employee_id=ES.employee_id
join roles R on RE.role_id=R.id
join employees E on RE.employee_id=E.id
join salary S on ES.salary_id=S.id
where role_name like '%Python %' and monthly_salary is not null;

 --17. Вывести имена и зарплаты Junior Python разработчиков

select E.employee_name, R.role_name, S.monthly_salary
from roles_employee RE
left join employee_salary ES on RE.employee_id=ES.employee_id
left join roles R on RE.role_id=R.id
left join employees E on RE.employee_id=E.id
left join salary S on ES.salary_id=S.id
where R.role_name like '%Junior%' and R.role_name like '%Python%' and S.monthly_salary is not null;

 --18. Вывести имена и зарплаты Middle JS разработчиков

select R.role_name, E.employee_name, S.monthly_salary
from roles_employee RE
left join employee_salary ES on RE.employee_id=ES.employee_id
left join roles R on RE.role_id=R.id
left join employees E on RE.employee_id=E.id
left join salary S on ES.salary_id=S.id
where R.role_name like '%Middle %' and R.role_name like '%JavaScript%' and S.monthly_salary is not null;

 --19. Вывести имена и зарплаты Senior Java разработчиков

select R.role_name, E.employee_name, S.monthly_salary
from roles_employee RE
left join employee_salary ES on RE.employee_id=ES.employee_id
join roles R on RE.role_id=R.id
join employees E on RE.employee_id=E.id
join salary S on ES.salary_id=S.id
where R.role_name like '%Senior%' and R.role_name like '%Java developer%' and S.monthly_salary is not null;

 --20. Вывести зарплаты Junior QA инженеров

select R.role_name, S.monthly_salary
from roles_employee RE
left join employee_salary ES on RE.employee_id=ES.employee_id
join roles R on RE.role_id=R.id
join employees E on RE.employee_id=E.id
join salary S on ES.salary_id=S.id
where R.role_name like '%Junior%' and R.role_name like '%QA engineer%' and S.monthly_salary is not null;

 --21. Вывести среднюю зарплату всех Junior специалистов

select avg(S.monthly_salary)
from roles_employee RE
left join employee_salary ES on RE.employee_id=ES.employee_id
left join roles R on RE.role_id=R.id
left join employees E on RE.employee_id=E.id
left join salary S on ES.salary_id=S.id
where R.role_name like '%Junior%' and S.monthly_salary is not null;

 --22. Вывести сумму зарплат JS разработчиков

select sum(S.monthly_salary)
from roles_employee RE
left join employee_salary ES on RE.employee_id=ES.employee_id
left join roles R on RE.role_id=R.id
left join employees E on RE.employee_id=E.id
left join salary S on ES.salary_id=S.id
where R.role_name like '%JavaSkript%' and S.monthly_salary is not null;

 --23. Вывести минимальную ЗП QA инженеров

select min(S.monthly_salary)
from roles_employee RE
left join employee_salary ES on RE.employee_id=ES.employee_id
left join roles R on RE.role_id=R.id
left join employees E on RE.employee_id=E.id
left join salary S on ES.salary_id=S.id
where R.role_name like '%QA engineer %' and S.monthly_salary is not null;

 --24. Вывести максимальную ЗП QA инженеров

select max(S.monthly_salary)
from roles_employee RE
left join employee_salary ES on RE.employee_id=ES.employee_id
left join roles R on RE.role_id=R.id
left join employees E on RE.employee_id=E.id
left join salary S on ES.salary_id=S.id
where R.role_name like '%QA engineer %' and S.monthly_salary is not null;

 --25. Вывести количество QA инженеров

select count(R.role_name)
from roles_employee RE
left join employee_salary ES on RE.employee_id=ES.employee_id
left join roles R on RE.role_id=R.id
left join employees E on RE.employee_id=E.id
where role_name like '%QA engineer%';

 --26. Вывести количество Middle специалистов.

select count(R.role_name)
from roles_employee RE
left join employee_salary ES on RE.employee_id=ES.employee_id
join roles R on RE.role_id=R.id
join employees E on RE.employee_id=E.id
where R.role_name like '%Middle %';

 --27. Вывести количество разработчиков

select count(R.role_name)
from roles_employee RE
left join employee_salary ES on RE.employee_id=ES.employee_id
join roles R on RE.role_id=R.id
join employees E on RE.employee_id=E.id
where R.role_name like '% developer%';

 --28. Вывести фонд (сумму) зарплаты разработчиков.

select sum(S.monthly_salary)
from roles_employee RE
left join employee_salary ES on RE.employee_id=ES.employee_id
join roles R on RE.role_id=R.id
join employees E on RE.employee_id=E.id
join salary S on ES.salary_id=S.id
where S.monthly_salary is not null;

 --29. Вывести имена, должности и ЗП всех специалистов по возрастанию

select E.employee_name, R.role_name, S.monthly_salary
from roles_employee RE
left join employee_salary ES on RE.employee_id=ES.employee_id
join roles R on RE.role_id=R.id
join employees E on RE.employee_id=E.id
join salary S on ES.salary_id=S.id
where S.monthly_salary is not null
order by S.monthly_salary asc;

 --30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

select E.employee_name, R.role_name, S.monthly_salary
from roles_employee RE
left join employee_salary ES on RE.employee_id=ES.employee_id
join roles R on RE.role_id=R.id
join employees E on RE.employee_id=E.id
join salary S on ES.salary_id=S.id
where S.monthly_salary between 1700 and 2300 and S.monthly_salary is not null
order by S.monthly_salary asc;

 --31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select E.employee_name, R.role_name, S.monthly_salary
from roles_employee RE
left join employee_salary ES on RE.employee_id=ES.employee_id
join roles R on RE.role_id=R.id
join employees E on RE.employee_id=E.id
join salary S on ES.salary_id=S.id
where S.monthly_salary < 2300 and S.monthly_salary is not null
order by S.monthly_salary asc;

 --32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

select E.employee_name, R.role_name, S.monthly_salary
from roles_employee RE
left join employee_salary ES on RE.employee_id=ES.employee_id
join roles R on RE.role_id=R.id
join employees E on RE.employee_id=E.id
join salary S on ES.salary_id=S.id
where S.monthly_salary in(1100, 1500, 2000) and S.monthly_salary is not null
order by S.monthly_salary asc;
