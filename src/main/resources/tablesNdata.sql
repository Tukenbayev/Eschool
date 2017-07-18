DROP TABLE IF EXISTS schools;

CREATE TABLE schools (
	id INT(11) NOT NULL AUTO_INCREMENT,
    login VARCHAR(55) NOT NULL,
    password VARCHAR(100) NOT NULL,
    PRIMARY KEY (id));
    
DROP TABLE IF EXISTS students;

CREATE TABLE students (
	student_id INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    class VARCHAR(3) NOT NULL,
    school_id INT(11) NOT NULL,
    PRIMARY KEY (student_id),
    FOREIGN KEY (school_id) REFERENCES schools(id));
    
    
LOCK TABLES schools WRITE;
INSERT INTO schools (login,password) VALUES (
	'eschool@gmail.com', 'password');
UNLOCK TABLES;

LOCK TABLES students WRITE;
INSERT INTO students (name, class, school_id) VALUES 
	('Steven Farell','11A',1),
    ('Michael Covey', '11B',1),
    ('Simon Steel', '11B',1),
    ('Rorshah Louer', '11B',1),
    ('Steven McQueen', '11B',1),
    ('Roman Cortney', '11B',1),
    ('Sam J.Jenk', '11B',1),
    ('Michael Phelps', '11B',1);
UNLOCK TABLES;


    
    
    

    
    
