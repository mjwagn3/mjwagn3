-- your code goes here
CREATE TABLE Person (
    name varchar(30),
    id int check(id>99 AND id<1000),
    age int check(age>=0),
    primary key(id),
    unique(name)
    
);
INSERT INTO Person(name,id,age)VALUES('Michael Joseph Wagner',100 + (Select Count(*) from Person),24);
INSERT INTO Person(name,id,age)VALUES('John Charles Wagner',100 + (Select Count(*) from Person),24);
INSERT INTO Person(name,id,age)VALUES('Annie Carol Wagner',100 + (Select Count(*) from Person),24);
INSERT INTO Person(name,id,age)VALUES('Danny William Wagner',100 + (Select Count(*) from Person),23);
INSERT INTO Person(name,id,age)VALUES('Sam Miller',100 + (Select Count(*) from Person),22);
INSERT INTO Person(name,id,age)VALUES('Lisa Ann Thompson Wagner',100 + (Select Count(*) from Person),56);
INSERT INTO Person(name,id,age)VALUES('Daniel Joseph Wagner',100 + (Select Count(*) from Person),58);
INSERT INTO Person(name,id,age)VALUES('Amasi Taifio',100 + (Select Count(*) from Person),60);
INSERT INTO Person(name,id,age)VALUES('Carolyn Gibbs Jacobsen',100 + (Select Count(*) from Person),91);
INSERT INTO Person(name,id,age)VALUES('Robert Jacobsen',100 + (Select Count(*) from Person),92);
INSERT INTO Person(name,id,age)VALUES('Bill Jenson',100+(Select Count(*) from Person),67);
INSERT INTO Person(name,id,age)VALUES('Mattew Ganson',100+(Select Count(*) from Person),26);

CREATE TABLE Job(
    job_title varchar(30),
    id int check(id>99 AND id<1000),
    is_complete Boolean default false,
    primary key(id)
    
);
--100
INSERT INTO Job(job_title,id)VALUES('Mop Floors',100+(Select Count(*) from Job));
--101
Insert INTO Job(job_title,id)VALUES('Sweep Floors',100+(Select Count(*)from Job));
--102
INSERT INTO Job(job_title,id)VALUES('Take Trash',100+(Select Count(*)from Job));
--103
Insert INTO Job(job_title,id)VALUES('Clean Bathroom',100+(Select Count(*)from Job));
--104
Insert INTO Job(job_title,id)VALUES('Restock Bathroom',100+(Select Count(*)from Job));
--105
Insert Into Job(job_title,id)VALUES('Clean Tables and Chairs',100+(Select Count(*)from Job));
--106
Insert Into Job(job_title,id)VALUES('Clean Dishes',100+(Select Count(*) from Job));
--107
Insert Into Job(job_title,id)VALUES('Throw out garabage',100+(Select Count(*)from Job));
--108
Insert Into Job(job_title,id)VALUES('Empty Register',100+(Select Count(*)from Job));
--109
Insert Into Job(job_title,id)VALUES('Inspect Inventory',100+(Select Count(*)from Job));
--110
Insert Into Job(job_title,id)VALUES('Reorder Inventory',100+(Select Count(*)from Job));
--111
Insert Into Job(job_title,id)VALUES('Make Food',100+(Select Count(*)from Job));
--112
Insert INTO Job(job_title,id)VALUES('Man Register',100+(Select Count(*)from Job));

CREATE TABLE currentJob(
    personID int,
    jobID int,
    foreign key(personID) references Person(id),
    foreign key(jobID) references Job(id)
);

Insert Into currentJob(personID,jobID)values(100,100);
Insert Into currentJob(personID,jobID)values(100,101);
Insert Into currentJob(personID,jobID)values(100,102);
Insert Into currentJob(personID,jobID)values(100,105);

Insert Into currentJob(personID,jobID)values(101,100);
Insert Into currentJob(personID,jobID)values(101,101);
Insert Into currentJob(personID,jobID)values(101,102);
Insert Into currentJob(personID,jobID)values(101,105);

Insert Into currentJob(personID,jobID)values(102,103);
Insert Into currentJob(personID,jobID)values(102,104);

Insert Into currentJob(personID,jobID)values(103,103);
Insert Into currentJob(personID,jobID)values(103,104);

Insert Into currentJob(personID,jobID)values(104,108);
Insert Into currentJob(personID,jobID)values(104,109);
Insert Into currentJob(personID,jobID)values(104,110);

Insert Into currentJob(personID,jobID)values(105,108);
Insert Into currentJob(personID,jobID)values(105,109);
Insert into currentJob(personID,jobID)values(105,110);

Insert Into currentJob(personID,jobID)values(106,112);

Insert Into currentJob(personID,jobID)values(108,111);

Insert Into currentJob(personID,jobID)values(107,106);
Insert Into currentJob(personID,jobID)values(107,107);



Select round(avg(p.age),0)
from Person p
join currentJob c
where c.personID = p.id;
Select p.name as personName, j.job_title as jobName
From Person p
Join currentJob c
Join Job j
where j.id = c.jobID AND c.personID = p.id;















