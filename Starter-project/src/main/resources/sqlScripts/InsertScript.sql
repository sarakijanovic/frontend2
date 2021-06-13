--INSERT SCRIPT PROJEKTNI ZADATAK 3, SARA KIJANOVIC IT 14/2018


select * from smer;
select * from projekat;
select * from grupa;
select * from student; 

--------------------------
--SMER PODACI 
INSERT INTO "smer"("id", "naziv", "oznaka")
VALUES (nextval('smer_seq'), 'Inženjerstvo informacionih sistema', 'IT');

INSERT INTO "smer"("id", "naziv", "oznaka")
VALUES (nextval('smer_seq'), 'Informacioni inženjering', 'IN');

INSERT INTO "smer"("id", "naziv", "oznaka")
VALUES (nextval('smer_seq'), 'Računarstvo i automatika', 'RA');

INSERT INTO "smer"("id", "naziv", "oznaka")
VALUES (nextval('smer_seq'), 'Primenjeno softversko inženjerstvo', 'PSI');

INSERT INTO "smer"("id", "naziv", "oznaka")
VALUES (nextval('smer_seq'), 'Inženjerski menadžment', 'IM');

INSERT INTO "smer"("id", "naziv", "oznaka")
VALUES (nextval('smer_seq'), 'Grafičko inženjerstvo i dizajn', 'GR');

INSERT INTO "smer"("id", "naziv", "oznaka")
VALUES (nextval('smer_seq'), 'Arhitektura', 'AI');

--PROJEKAT PODACI 
--IT
INSERT INTO "projekat"("id", "naziv", "oznaka", "opis")
VALUES(nextval('projekat_seq'), 'Razvoj višeslojnih aplikacija', 'RVA2021', 'RVA projekat 2021');
--in
INSERT INTO "projekat"("id", "naziv", "oznaka", "opis")
VALUES(nextval('projekat_seq'), 'Android aplikacija', 'MIT2021', 'razvoj android aplikacije');
--arhitektura
INSERT INTO "projekat"("id", "naziv", "oznaka", "opis")
VALUES(nextval('projekat_seq'), 'Veliki studio', 'Studio21', 'Realizacija plana izgradnje Beograda na vodi');
--RA
INSERT INTO "projekat"("id", "naziv", "oznaka", "opis")
VALUES(nextval('projekat_seq'), 'Algoritmi i strukture podataka', 'AISP2021', 'Algoritamska rešenja');
INSERT INTO "projekat"("id", "naziv", "oznaka", "opis")
VALUES(nextval('projekat_seq'), 'WPF aplikacija', 'WPF2021', 'WPF aplikacija na temu registracije automobila');
--grid
INSERT INTO "projekat"("id", "naziv", "oznaka", "opis")
VALUES(nextval('projekat_seq'),'Grafika', 'GR2021', 'Grafička prezentacija XY kompanije');
--menadzment
INSERT INTO "projekat"("id", "naziv", "oznaka", "opis")
VALUES(nextval('projekat_seq'), 'Biznis plan', 'Bplan2021', 'Realizacija biznis plana za odabrani projekat');

--grupa podaci
--it
INSERT INTO "grupa"("id", "oznaka", "smer")
VALUES (nextval('grupa_seq'), 'IT 1', 1); 
INSERT INTO "grupa"("id", "oznaka", "smer")
VALUES (nextval('grupa_seq'), 'IT 2', 1); 
--ra
INSERT INTO "grupa"("id", "oznaka", "smer")
VALUES (nextval('grupa_seq'), 'RA 1', 3); 
INSERT INTO "grupa"("id", "oznaka", "smer")
VALUES (nextval('grupa_seq'), 'RA 2', 3); 

--in
INSERT INTO "grupa"("id", "oznaka", "smer")
VALUES (nextval('grupa_seq'), 'IN 1', 2); 
INSERT INTO "grupa"("id", "oznaka", "smer")
VALUES (nextval('grupa_seq'), 'IN 2', 2); 

--psi 
INSERT INTO "grupa"("id", "oznaka", "smer")
VALUES (nextval('grupa_seq'), 'PSI 1', 4); 
INSERT INTO "grupa"("id", "oznaka", "smer")
VALUES (nextval('grupa_seq'), 'PSI 2', 4); 

--im
INSERT INTO "grupa"("id", "oznaka", "smer")
VALUES (nextval('grupa_seq'), 'IM 1', 5); 
INSERT INTO "grupa"("id", "oznaka", "smer")
VALUES (nextval('grupa_seq'), 'IM 2', 5); 

--grid
INSERT INTO "grupa"("id", "oznaka", "smer")
VALUES (nextval('grupa_seq'), 'GR 1', 6); 
INSERT INTO "grupa"("id", "oznaka", "smer")
VALUES (nextval('grupa_seq'), 'GR 2', 6); 



--ARHITEKTURA
INSERT INTO "grupa"("id", "oznaka", "smer")
VALUES (nextval('grupa_seq'), 'AI 1', 7); 
INSERT INTO "grupa"("id", "oznaka", "smer")
VALUES (nextval('grupa_seq'), 'AI 2', 7); 

--STUDENT PODACI
--it
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "grupa", "projekat")
VALUES (nextval('student_seq'), 'Sara', 'Kijanovic', 'IT14-2018', 1, 1);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "grupa", "projekat")
VALUES (nextval('student_seq'), 'Teodora', 'Perisin', 'IT10-2018', 2, 1);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "grupa", "projekat")
VALUES (nextval('student_seq'), 'Aleksa', 'Komosar', 'IT21-2018', 1, 2); 

INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "grupa", "projekat")
VALUES (nextval('student_seq'), 'Lana', 'Slovic', 'PSI23-2019', 7, 5);

INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "grupa", "projekat")
VALUES (nextval('student_seq'), 'Enes', 'Rovcanin', 'PSI59-2017', 8, 5);

INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "grupa", "projekat")
VALUES (nextval('student_seq'), 'David', 'Kijanovic', 'AI1-2018', 14, 3);

INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "grupa", "projekat")
VALUES (nextval('student_seq'), 'Vukasin', 'Perunicic', 'GR20-2019', 11, 6);

INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "grupa", "projekat")
VALUES (nextval('student_seq'), 'Slavica', 'Nikolic','IM15-2016', 9, 7);

INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "grupa", "projekat")
VALUES (nextval('student_seq'), 'Aleksandra', 'Mirkovic', 'IN1-2015', 5, 2);


--TEST PODACI 
INSERT INTO "smer"("id", "naziv", "oznaka")
VALUES (-100, 'test naziv', 'test oznaka');

INSERT INTO "projekat"("id", "naziv", "oznaka", "opis")
VALUES(-100, 'test', 'test','test');

INSERT INTO "grupa"("id", "oznaka", "smer")
VALUES (-100, 'test', 1); 

INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "grupa", "projekat")
VALUES (-100, 'test', 'test', 'test', 1, 1);

INSERT INTO "grupa"("id", "oznaka", "smer")
VALUES (955, 'test', -100);

--select * from student 






