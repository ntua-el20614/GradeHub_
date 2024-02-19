-- Create the database if it doesn't exist
DROP DATABASE IF EXISTS students;
CREATE DATABASE IF NOT EXISTS students;

-- Switch to the students database
USE students;

-- Create the tables
CREATE TABLE student (
  student_id INT PRIMARY KEY AUTO_INCREMENT,
  school INT,
  name VARCHAR(255),
  username VARCHAR(255) UNIQUE,
  password VARCHAR(255),
  birthday date,
  email VARCHAR(255),
  last_login VARCHAR(255),
  privacy BOOL
  -- FOREIGN KEY (school) REFERENCES schools(school_id) -- Change the reference here
);


CREATE TABLE schools(
  school_id INT PRIMARY KEY AUTO_INCREMENT,
  school_name CHAR(255),
  link_odigos_spoudwn CHAR(255),
  link_gia_programma CHAR(255),
  link_mathimata_sxolis CHAR(255)
  );
 

CREATE TABLE course (
  school_id INT,
  course_id INT PRIMARY KEY AUTO_INCREMENT,
  semester INT,
  flow VARCHAR(255),
  name VARCHAR(255),
  optional BOOL,
  ECTS CHAR(255) DEFAULT '',
  INDEX (semester) -- Add an index on the 'semester' column
  -- FOREIGN KEY (school_id) REFERENCES student(school)

);

CREATE TABLE subject_user (
  student_id INT,
  course_id INT,
  semester INT,
  grade VARCHAR(255),
  pending bool DEFAULT False,
  going bool,
  PRIMARY KEY (student_id, course_id),
  FOREIGN KEY (student_id) REFERENCES student(student_id),
  FOREIGN KEY (semester) REFERENCES course(semester),
  FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE friendship (
  friendship_id INT PRIMARY KEY AUTO_INCREMENT,
  user1_id INT,
  user2_id INT,
  status VARCHAR(255),
  FOREIGN KEY (user1_id) REFERENCES student(student_id),
  FOREIGN KEY (user2_id) REFERENCES student(student_id)
);









-- ECE NTUA
INSERT INTO schools (school_id,school_name, link_odigos_spoudwn, link_gia_programma, link_mathimata_sxolis) VALUES (1,"ECE - NTUA",'https://www.ece.ntua.gr/media/688/%CE%9F%CE%B4%CE%B7%CE%B3%CF%8C%CF%82%20%CE%A3%CF%80%CE%BF%CF%85%CE%B4%CF%8E%CE%BD%202022-2023.pdf','https://www.ece.ntua.gr/uploads/announcements/8t9Vs4RP/Orologio%20Programma_Xeimerino_SHMMY_2023-24_v20231005.pdf','https://helios.ntua.gr/');

INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 1, 1, 'K', 'Μαθηματική Ανάλυση 1', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 2, 1, 'K', 'Προγραμματισμός Ηλεκτρονικών Υπολογιστών', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 3, 1, 'K', 'Λογική Σχεδίαση Ψηφικών Συστημάτων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 4, 1, 'K', 'Φυσική 1 (Μηχανική)', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 5, 1, 'K', 'Γραμμική Άλγεβρα', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 6, 1, 'K', 'Ιστορία των Επιστημονικών και Φιλοσοφικών Ιδεών', True);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 7, 1, 'K', 'Φιλοσοφία', True);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 8, 1, 'K', 'Κοινωνιολογία της Επιστήμης και της Τεχνολογίας', True);

INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 9, 2, 'K', 'Μαθηματική Ανάλυση (Συναρτήσεις Πολλών Μεταβλητών)', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 10, 2, 'K', 'Προγραμματιστικές Τεχνικές', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 11, 2, 'K', 'Διαφορικές Εξισώσεις', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 12, 2, 'K', 'Δομή Και Ηλεκτρικές Ιδιότητες των Υλικών', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 13, 2, 'K', 'Ανάλυση Γραμμικών Κυκλωμάτων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 14, 2, 'K', 'Τεχνική Μηχανική', True);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 15, 2, 'K', 'Μηχανική (Κινηματική-Δυναμική του Στερεού Σώματος)', True);

INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 16, 3, 'K', 'Εισαγωγικό Εργαστήριο Ηλεκτρονικής και Τηλεπικοινωνιών', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 17, 3, 'K', 'Ηλεκτρικές Μετρήσεις', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 18, 3, 'K', 'Θεμελιώδη Θέματα Επιστήμης των Υπολογιστών', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 19, 3, 'K', 'Θεωρία Πιθανοτήτων και Στατιστική', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 20, 3, 'K', 'Σήματα και Συστήματα', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 21, 3, 'K', 'Οργάνωση και Διοίκηση: Θεωρία Και Πρακτική', True);

INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 22, 4, 'K', 'Αγγλική Γλώσσα', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 23, 4, 'K', 'Δίκτυα Επικοινωνιών', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 24, 4, 'K', 'Ηλεκτρομαγνητικά Πεδία Α', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 25, 4, 'K', 'Ηλεκτρονική I', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 26, 4, 'K', 'Κυματική και Κβαντική Φυσική', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 27, 4, 'K', 'Στοχαστικά Συστήματα και Επικοινωνίες', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 28, 4, 'K', 'Μιγαδικές Συναρτήσεις', True);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 29, 4, 'K', 'Αριθμητική Ανάλυση', True);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 30, 4, 'K', 'Διακριτά Μαθηματικά', True);

INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 31, 5, 'K', 'Αρχιτεκτονική Υπολογιστών', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 32, 5, 'K', 'Βιομηχανική Ηλεκτρονική', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 33, 5, 'K', 'Εισαγωγή στα Συστήματα Ηλεκτρικής Ενέργειας (ΣΗΕ)', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 34, 5, 'K', 'Εισαγωγή στις Τηλεπικοινωνίες', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 35, 5, 'K', 'Εισαγωγή στον Αυτόματο Έλεγχο', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 36, 5, 'K', 'Ηλεκτρομαγνητικά Πεδία B', False);

INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 37, 6, 'Μ', 'Ανάλυση Πινάκων και Εφαρμογές', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 38, 6, 'Μ', 'Αριθμητικές Μέθοδοι Διαφορικών Εξισώσεων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 39, 6, 'Λ', 'Βάσεις Δεδομένων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 40, 6, 'Λ', 'Γλώσσες Προγραμματισμού Ι', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 41, 6, 'Η', 'Διατάξεις Ημιαγωγών', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 42, 6, 'Ι', 'Εισαγωγή στη Βιοφωτονική και Κυτταρική Μηχανική', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 43, 6, 'Ι', 'Εισαγωγή στη Βιοϊατρική Μηχανική', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 44, 6, 'Ι', 'Εργαστήριο Βιοϊατρικής Τεχνολογίας', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 45, 6, 'Υ', 'Εργαστήριο Ψηφιακών Συστημάτων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 46, 6, 'Ν', 'Εφαρμογές των Ιοντιζουσών Ακτινοβολιών στην Ιατρική και τη Βιολογία', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 47, 6, 'Ε', 'Εφαρμοσμένη Θερμοδυναμική Καθαρών Ουσιών', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 48, 6, 'Ν', 'Εφαρμοσμένος και Υπολογιστικός Ηλεκτρομαγνητισμός', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 49, 6, 'Ζ', 'Ηλεκτρικές Μηχανές Ι', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 50, 6, 'Ε', 'Ηλεκτρική Οικονομία', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 51, 6, 'Η', 'Ηλεκτρονική II', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 52, 6, 'Ζ', 'Ηλεκτρονική Ισχύος Ι', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 53, 6, 'K', 'Θεωρία Δικτύων και Κυκλωμάτων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 54, 6, 'Υ', 'Λειτουργικά Συστήματα Υπολογιστών', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 55, 6, 'Μ', 'Μαθηματική Λογική', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 56, 6, 'Τ', 'Μικροκύματα', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 57, 6, 'Ο', 'Οικονομική Ανάλυση Επιχειρήσεων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 58, 6, 'Τ', 'Οπτική Επιστήμη και Τεχνολογία', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 59, 6, 'Ε', 'Παραγωγή Ηλεκτρικής Ενέργειας', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 60, 6, 'Μ', 'Στατιστική Ανάλυση Δεδομένων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 61, 6, 'Μ', 'Στοχαστικές Διαδικασίες', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 62, 6, 'Δ', 'Συστήματα Αναμονής', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 63, 6, 'Τ', 'Συστήματα Διαμόρφωσης, Μετάδοσης και Μεταγωγής', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 64, 6, 'Ο', 'Συστήματα Διοίκησης', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 65, 6, 'Υ', 'Συστήματα Μικροϋπολογιστών', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 66, 6, 'Σ', 'Σχεδίαση Συστημάτων Αυτόματου Ελέγχου', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 67, 6, 'Λ', 'Τεχνητή Νοημοσύνη', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 68, 6, 'Ζ', 'Τεχνολογία Φωτισμού', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 69, 6, 'Ν', 'Τεχνολογική Οικονομική', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 70, 6, 'Φ', 'Φυσική Συμπυκνωμένης Ύλης', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 71, 6, 'Φ', 'Φυσική και Τεχνολογία των Λέιζερ', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 72, 6, 'Δ', 'Ψηφιακές Επικοινωνίες Ι', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 73, 6, 'Σ', 'Ψηφιακή Επεξεργασία Σήματος', False);

INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 74, 7, 'Μ', 'Άλγεβρα και Εφαρμογές', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 75, 7, 'Λ', 'Αλγόριθμοι και Πολυπλοκότητα', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 76, 7, 'Υ', 'Αλληλεπίδραση Ανθρώπου - Υπολογιστή', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 77, 7, 'Ε', 'Ανάλυση ΣΗΕ (Μόνιμη Κατάσταση Λειτουργίας)', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 78, 7, 'Ι', 'Βιοϊατρική Οργανολογία και Τεχνικές', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 79, 7, 'Δ', 'Δίκτυα Υπολογιστών', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 80, 7, 'Τ', 'Διάδοση σε Ιονισμένα Μέσα', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 81, 7, 'Ο', 'Διοίκηση Παραγωγής και Συστημάτων Υπηρεσιών', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 82, 7, 'Η', 'Εισαγωγή στη Σχεδίαση Συστημάτων VLSI', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 83, 7, 'Ι', 'Επεξεργασία και Ανάλυση Ιατρικών Σημάτων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 84, 7, 'Υ', 'Εργαστήριο Λειτουργικών Συστημάτων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 85, 7, 'Υ', 'Εργαστήριο Μικροϋπολογιστών', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 86, 7, 'Ε', 'Ευέλικτα Συστήματα Μεταφοράς Ηλεκτρικής Ενέργειας', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 87, 7, 'Ζ', 'Ηλεκτρικές Μηχανές ΙΙ', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 88, 7, 'K', 'Ηλεκτρολογικό Σχέδιο', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 89, 7, 'Η', 'Ηλεκτρονική III', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 90, 7, 'Ζ', 'Ηλεκτρονική Ισχύος ΙΙ', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 91, 7, 'Μ', 'Θεωρία Μέτρου και Εφαρμογές', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 92, 7, 'Φ', 'Κβαντομηχανική ΙΙ', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 93, 7, 'Τ', 'Κεραίες', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 94, 7, 'Ι', 'Μετρήσεις και Έλεγχοι στη Βιοϊατρική Τεχνολογία', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 95, 7, 'Φ', 'Μη-γραμμική Δυναμική Συστημάτων και Ταλαντώσεις', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 96, 7, 'K', 'Μηχανική Μάθηση', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 97, 7, 'Η', 'Μικροηλεκτρονική και τεχνικές συσκευασίας', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 98, 7, 'Ο', 'Μοντέλα Μαθηματικού Προγραμματισμού', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 99, 7, 'Φ', 'Οπτοηλεκτρονική', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 100, 7, 'Ζ', 'Παραγωγή Υψηλών Τάσεων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 101, 7, 'Σ', 'Προχωρημένες Τεχνικές Συστημάτων Αυτομάτου Ελέγχου', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 102, 7, 'Φ', 'Πυρηνική Φυσική και Στοιχειώδη Σωματίδια', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 103, 7, 'Σ', 'Ρομποτική Ι: Ανάλυση - Έλεγχος - Εργαστήριο', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 104, 7, 'Ο', 'Συστήματα Αποφάσεων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 105, 7, 'Λ', 'Τεχνολογία Λογισμικού', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 106, 7, 'Υ', 'Τεχνολογία Πολυμέσων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 107, 7, 'Δ', 'Τηλεφωνία IP', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 108, 7, 'Τ', 'Υπολογιστικές Τεχνικές για Συστήματα Μετάδοσης Πληροφορίας', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 109, 7, 'Τ', 'Φωτονική Τεχνολογία στις Τηλεπικοινωνίες', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 110, 7, 'Δ', 'Ψηφιακές Επικοινωνίες ΙΙ', False);

INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 111, 8, 'Μ', 'Άλγεβρα ΙΙ και Εφαρμογές', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 112, 8, 'Σ', 'Όραση Υπολογιστών', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 113, 8, 'Ε', 'Ανάλυση ΣΗΕ (Ασύμμετρες και Μεταβατικές Καταστάσεις)', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 114, 8, 'A', 'Αστική Κοινωνιολογία', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 115, 8, 'Δ', 'Ασφάλεια Δικτύων Υπολογιστών', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 116, 8, 'Τ', 'Ασύρματες Ζεύξεις και Διάδοση', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 117, 8, 'Ζ', 'Βιομηχανικές-Κτιριακές Ηλεκτρομηχανολογικές Εγκαταστάσεις', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 118, 8, 'Ε', 'Δίκτυα Διανομής Ηλεκτρικής Ενέργειας', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 119, 8, 'Δ', 'Δίκτυα Κινητών και Προσωπικών Επικοινωνιών', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 120, 8, 'Δ', 'Διαδίκτυο και Εφαρμογές', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 121, 8, 'Ο', 'Διοίκηση της Ψηφιακής Επιχείρησης', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 122, 8, 'A', 'Ειδικά Θέματα Κοινωνιολογίας', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 123, 8, 'A', 'Ειδικά Θέματα Φιλοσοφίας', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 124, 8, 'Φ', 'Εισαγωγή στην Φυσική και την Τεχνολογία της Ελεγχόμενης Θερμοπυρηνικής Σύντηξης', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 125, 8, 'Ε', 'Ενεργειακή Οικονομία', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 126, 8, 'Υ', 'Επίδοση Υπολογιστικών Συστημάτων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 127, 8, 'Σ', 'Επεξεργασία Φωνής και Φυσικής Γλώσσας', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 128, 8, 'Ε', 'Εποπτεία και Διαχείριση Ενεργειακών Συστημάτων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 129, 8, 'Δ', 'Εργαστήριο Δικτύων Υπολογιστών', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 130, 8, 'Μ', 'Εφαρμογές της Λογικής στην Πληροφορική', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 131, 8, 'Μ', 'Εφαρμοσμένα Μαθηματικά - Λογισμός Μεταβολών', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 132, 8, 'Τ', 'Ηλεκτρομαγνητική Συμβατότητα', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 133, 8, 'Μ', 'Θεωρία Αριθμών', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 134, 8, 'Μ', 'Θεωρία Γραφημάτων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 135, 8, 'Ι', 'Ιατρική Απεικόνιση και Ψηφιακή Επεξεργασία Ιατρικής Εικόνας', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 136, 8, 'Ε', 'Κέντρα Ελέγχου Ενέργειας', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 137, 8, 'Ζ', 'Μεταβατική Κατάσταση Λειτουργίας Ηλεκτρικών Μηχανών', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 138, 8, 'Λ', 'Μεταγλωττιστές', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 139, 8, 'Ζ', 'Μετρήσεις και Εφαρμογές Υψηλών Τάσεων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 140, 8, 'Σ', 'Μη Γραμμικά Συστήματα Ελέγχου και Εφαρμογές', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 141, 8, 'Υ', 'Νευρωνικά Δίκτυα και Βαθιά Μάθηση', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 142, 8, 'Ν', 'Περιβάλλον και Ανάπτυξη', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 143, 8, 'Ο', 'Πολυκριτήρια Ανάλυση Αποφάσεων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 144, 8, 'Ν', 'Πρακτική Άσκηση Ηλεκτ. Μηχ. & Μηχ. Υπολογιστών', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 145, 8, 'Λ', 'Προηγμένα Θέματα Αλγορίθμων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 146, 8, 'Υ', 'Προηγμένα Θέματα Αρχιτεκτονικής Υπολογιστών', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 147, 8, 'Σ', 'Ρομποτική ΙΙ: Ευφυή Ρομποτικά Συστήματα', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 148, 8, 'Ζ', 'Συστήματα Ελέγχου Ηλεκτρικών Μηχανών', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 149, 8, 'Τ', 'Συστήματα Μετάδοσης Οπτικών Ινών', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 150, 8, 'Ο', 'Συστήματα Χρηματοοικονομικής Διοίκησης', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 151, 8, 'Η', 'Σχεδίαση Αναλογικών Ηλεκτρονικών Συστημάτων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 152, 8, 'Η', 'Σχεδίαση Αναλογικών Μικροηλεκτρονικών Κυκλωμάτων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 153, 8, 'Ο', 'Τεχνικές Προβλέψεων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 154, 8, 'Η', 'Τεχνολογία Αισθητήρων και Μικροσυστημάτων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 155, 8, 'Υ', 'Τεχνολογία και Ανάλυση Εικόνων και Βίντεο', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 156, 8, 'A', 'Τεχνολογίες Πληροφορίας και Κοινωνία', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 157, 8, 'Λ', 'Τεχνολογίες Υπηρεσιών Λογισμικού', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 158, 8, 'Ι', 'Τεχνολογίες Ψηφιακής Υγείας', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 159, 8, 'Τ', 'Τηλεπικοινωνίες Οπτικών Ινών', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 160, 8, 'Λ', 'Υπολογισιμότητα και Πολυπλοκότητα', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 161, 8, 'Υ', 'Ψηφιακά Συστήματα VLSI', False);

INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 162, 9, 'Δ', 'Ανάλυση Κοινωνικών Δικτύων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 163, 9, 'Λ', 'Ανάλυση και Σχεδιασμός Πληροφοριακών Συστημάτων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 164, 9, 'Σ', 'Αναγνώριση Προτύπων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 165, 9, 'Ε', 'Ανανεώσιμες Πηγές Ενέργειας', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 166, 9, 'Ε', 'Αυτόματος Έλεγχος και Ευστάθεια ΣΗΕ', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 167, 9, 'Δ', 'Δίκτυα Ευρείας Ζώνης', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 168, 9, 'Δ', 'Διαχείριση Δικτύων - Ευφυή Δίκτυα', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 169, 9, 'Ε', 'Διαχείριση Ενέργειας και Περιβαλλοντική Πολιτική', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 170, 9, 'Τ', 'Δορυφορικές Επικοινωνίες', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 171, 9, 'Ι', 'Εγκατάσταση, Διαχείριση και Ποιοτικός Έλεγχος Ιατρικών και Νοσοκομειακών Συστημάτων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 172, 9, 'Δ', 'Θεωρία Πληροφορίας', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 173, 9, 'Υ', 'Κατανεμημένα Συστήματα', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 174, 9, 'Ζ', 'Κατασκευή Ηλεκτρικών Μηχανών', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 175, 9, 'Λ', 'Κρυπτογραφία', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 176, 9, 'Η', 'Μαγνητικά Υλικά και Εφαρμογές', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 177, 9, 'Η', 'Μικροσυστήματα και Νανοτεχνολογία', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 178, 9, 'Φ', 'Νέα Τεχνολογικά Υλικά', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 179, 9, 'Σ', 'Νευρο-ασαφής Έλεγχος και Εφαρμογές', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 180, 9, 'Δ', 'Οπτικά Δίκτυα Επικοινωνίας', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 181, 9, 'Ο', 'Παίγνια Αποφάσεων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 182, 9, 'Ζ', 'Ποιοτικός Έλεγχος Εξοπλισμού Βιομηχανικών Εγκαταστάσεων και Υλικών', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 183, 9, 'Φ', 'Πολύπλοκη Δυναμική Χαμιλτονιανών Συστημάτων και Εφαρμογές', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 184, 9, 'Τ', 'Προηγμένες Τεχνολογίες Κινητού Υπολογισμού', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 185, 9, 'Ι', 'Προσομοίωση Φυσιολογικών Συστημάτων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 186, 9, 'Ζ', 'Προστασία Ηλεκτρικών Εγκαταστάσεων από Υπερτάσεις', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 187, 9, 'Ε', 'Προστασία Συστημάτων Ηλεκτρικής Ενέργειας', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 188, 9, 'Λ', 'Προχωρημένα Θέματα Βάσεων Δεδομένων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 189, 9, 'Ν', 'Στοιχεία Δικαίου και Τεχνικής Νομοθεσίας', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 190, 9, 'Ο', 'Συστήματα Αξιολόγησης και Διαχείρισης Έργων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 191, 9, 'Τ', 'Συστήματα Κινητών Τηλεπικοινωνιών', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 192, 9, 'Υ', 'Συστήματα Παράλληλης Επεξεργασίας', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 193, 9, 'Τ', 'Συστήματα Ραντάρ και Τηλεπισκόπηση', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 194, 9, 'Υ', 'Σχεδιασμός Ενσωματωμένων Συστημάτων', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 195, 9, 'Η', 'Τηλεπικοινωνιακή Ηλεκτρονική', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 196, 9, 'Φ', 'Φυσική Πολλών Σωμάτων και Κβαντικοί Υπολογιστές', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 197, 9, 'Η', 'Φυσική, Τεχνολογία και Χρήσεις των Φωτοβολταϊκών', False);
INSERT INTO course (school_id, course_id, semester, flow, name, optional) VALUES (1, 198, 9, 'Λ', 'Προχωρημένα Θέματα Τεχνητής Νοημοσύνης', False);









-- CS AUEB
INSERT INTO schools (school_id,school_name, link_odigos_spoudwn, link_gia_programma, link_mathimata_sxolis) VALUES (2,"CS - AUEB",'https://www.dept.aueb.gr/el/cs/content/%CE%BF%CE%B4%CE%B7%CE%B3%CF%8C%CF%82-%CF%83%CF%80%CE%BF%CF%85%CE%B4%CF%8E%CE%BD?fbclid=IwAR0vCjIhWtDP-_Zs1LV9CCzIXEcqFxhngl7rt8Nf7qFFF-YdpsEu1eaonLU','https://www.aueb.gr/el/content/orologio-programma-didaskalias-heimerinoy-examinoy-2023-2024?fbclid=IwAR0a8iFezIeI9TW46z6OqhPEKBLu7GJrw6Hpx3-HIDdAa-CGHGPYTbfdnOc','https://eclass.aueb.gr/');

INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 300, 1, 'K', 'Διακριτά Μαθηματικά ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 301, 1, 'K', 'Εισαγωγή στην Επιστήμη των Υπολογιστών [ΕΕΥ] ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 302, 1, 'K', 'Εισαγωγή στην Οικονομική Επιστήμη ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 303, 1, 'K', 'Εισαγωγή στον Προγραμματισμό Υπολογιστών [PYTHON] ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 304, 1, 'K', 'Μαθηματικά I ',false,'6.0');

INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 305, 2, 'K', 'Εισαγωγή στη Διοίκηση Επιχειρήσεων ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 306, 2, 'K', 'Μαθηματικά II ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 307, 2, 'K', 'Πιθανότητες ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 308, 2, 'K', 'Προγραμματισμός Υπολογιστών με JAVA [JAVA] ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 309, 2, 'K', 'Σχεδίαση Ψηφιακών Συστημάτων ',false,'6.0');

INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 310, 3, 'K', 'Δομές Δεδομένων [ΔΔ] ',false,'7.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 311, 3, 'K', 'Οργάνωση Συστημάτων Υπολογιστών [ΟΣΥ] ',false,'7.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 312, 3, 'K', 'Προγραμματισμός Υπολογιστών με C++ [C++] ',false,'8.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 313, 3, 'K', 'Υπολογιστικά Μαθηματικά ',false,'8.0');

INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 314, 4, 'K', 'Αλγόριθμοι ',false,'7.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 315, 4, 'K', 'Αυτόματα και Πολυπλοκότητα ',false,'7.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 316, 4, 'K', 'Βάσεις Δεδομένων [ΒΔ] ',false,'8.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 317, 4, 'K', 'Λειτουργικά Συστήματα [ΛΣ] ',false,'8.0');

INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 318, 5, 'K', 'Τεχνολογία Λογισμικού ',false,'8.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 319, 5, 'K', 'Δίκτυα Επικοινωνιών ',false,'8.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 320, 5, 'K', 'Λογική ',false,'7.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 321, 5, 'K', 'Στατιστική στην Πληροφορική ',false,'7.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 322, 5, 'K', 'Τεχνητή Νοημοσύνη ',false,'7.0');

INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 323, 6, 'K', 'Κατανεμημένα Συστήματα ',false,'8.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 324, 6, 'K', 'Ανάλυση και Σχεδίαση Πληροφοριακών Συστημάτων ',false,'8.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 325, 6, 'K', 'Κυβερνοασφάλεια ',false,'7.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 326, 6, 'K', 'Δίκτυα Υπολογιστών ',false,'7.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 327, 6, 'K', 'Επαλήθευση, Επικύρωση και Συντήρηση Λογισμικού ',false,'7.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 328, 6, 'K', 'Θεωρία και Υποδείγματα Βελτιστοποίησης ',false,'7.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 329, 6, 'K', 'Συστήματα Διαχείρισης και Ανάλυσης Δεδομένων ',false,'7.0');

INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 330, 7, 'K', 'Αξιολόγηση Επενδύσεων με Εφαρμογές στην Πληροφορική ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 331, 7, 'K', 'Ασφάλεια Δικτύων ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 332, 7, 'K', 'Ασύρματα Δίκτυα και Κινητές Επικοινωνίες ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 333, 7, 'K', 'Γραφικά Υπολογιστών ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 334, 7, 'K', 'Ειδικά Θέματα Αλγορίθμων ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 335, 7, 'K', 'Εφαρμοσμένες Πιθανότητες και Πιθανοτικοί Αλγόριθμοι ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 336, 7, 'K', 'Μέθοδοι Στατιστικής και Μηχανικής Μάθησης (ΣΤΑ) ',false,'8.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 337, 7, 'K', 'Μεταγλωττιστές ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 338, 7, 'K', 'Μηχανική Μάθηση ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 339, 7, 'K', 'Οικονομικά Δικτύων ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 340, 7, 'K', 'Συνδυαστική Βελτιστοποίηση (ΔΕΤ) ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 341, 7, 'K', 'Τεχνολογία Πολυμέσων ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 342, 7, 'K', 'Τεχνολογίες και Προγραμματισμός Εφαρμογών στον Ιστό ',false,'6.0');

INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 343, 8, 'K', 'Αλληλεπίδραση Ανθρώπου-Υπολογιστή ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 344, 8, 'K', 'Ανάλυση Δεδομένων (ΣΤΑ) ',false,'8.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 345, 8, 'K', 'Ανάλυση Επίδοσης Πολύπλοκων Δικτυωμένων Συστ. ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 346, 8, 'K', 'Ανάπτυξη Εφαρμογών Πληροφοριακών Συστημάτων ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 347, 8, 'K', 'Αριθμητική Γραμμική Άλγεβρα ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 348, 8, 'K', 'Αρχιτεκτονική Υπολογιστών ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 349, 8, 'K', 'Γραμμική Άλγεβρα ΙΙ (ΣΤΑ) ',false,'7.5');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 350, 8, 'K', 'Ειδικά Θέματα Διακριτών Μαθηματικών ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 351, 8, 'K', 'Εννοιολογική Μοντελοποίηση και Οργάνωση Γνώσεων ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 352, 8, 'K', 'Εξόρυξη Γνώσης ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 353, 8, 'K', 'Επιχειρησιακή Πολιτική και Στρατηγική (ΟΔΕ) ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 354, 8, 'K', 'Θεωρία Παιγνίων και Αποφάσεων ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 355, 8, 'K', 'Θεωρία Πληροφορίας ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 356, 8, 'K', 'Λογιστικά Πληροφ. Συστ. μέσω Διαδικτύου (ΛΟΧΡΗ) ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 357, 8, 'K', 'Μαθηματικός Προγραμματισμός (ΔΕΤ) ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 358, 8, 'K', 'Πιθανότητες ΙΙ (ΣΤΑ) ',false,'7.5');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 359, 8, 'K', 'Προσομοίωση (ΣΤΑ) ',false,'7.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 360, 8, 'K', 'Στοιχεία Δικαίου της Πληροφορίας ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 361, 8, 'K', 'Συστήματα Ανάκτησης Πληροφοριών ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 362, 8, 'K', 'Τεχνολογική Καινοτομία και Επιχειρηματικότητα ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 363, 8, 'K', 'Υπολογισιμότητα και Πολυπλοκότητα ',false,'6.0');
INSERT INTO course (school_id, course_id, semester, flow, name, optional,ECTS) VALUES (2, 364, 8, 'K', 'Γραμμικά Μοντέλα (ΣΤΑ) ',false,'8.0');









INSERT INTO schools (school_id, school_name, link_odigos_spoudwn, link_gia_programma, link_mathimata_sxolis) VALUES (3,"ECE - UPATRAS","https://www.ece.upatras.gr/images/Attachments/odigos_spoudwn/odigos_spoudwn_2023_2024.pdf","https://www.ece.upatras.gr/images/Attachments/Πρόγραμμα_Μαθημάτων-Εξετάσεων/Ωρολόγιο_πρόγραμμα_προπτυχιακών_μαθημάτων_χειμερινού_εξαμήνου_2023-24_v2.pdf","https://www.ece.upatras.gr/index.php/el/");

-- semester: 1
INSERT INTO course (school_id, course_id, semester, flow, name, optional, ECTS) VALUES (3, 500, 1, 'K', 'Λογισμός συναρτήσεων μιας μεταβλητή', True,'6');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 1, 'K', 'Γραμμική Άλγεβρα', True,'3');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 1, 'K', 'Εισαγωγή στους Υπολογιστές ', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 1, 'K', 'Σύγχρονη Φυσική ', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 1, 'K', 'Εφαρμοσμένη Φυσική ', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 1, 'K', 'Ψηφιακή Λογική', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 1, 'K', 'Αγγλικά', True,'3');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 1, 'K', 'Γαλλικά', True,'3');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 1, 'K', 'Γερμανικά', True,'3');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 1, 'K', 'Ρωσικά', True,'3');

-- semester: 2
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 2, 'K', 'Ηλεκτρικά Κυκλώματα Ι', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 2, 'K', 'Λογισμός Συναρτήσεων πολλών μεταβλητών και Διανυσματική Ανάλυση', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 2, 'K', 'Εργαστήριο Εφαρμοσμένης Φυσικής', True,'2');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 2, 'K', 'Συνήθεις Διαφορικές Εξισώσεις και Μιγαδικές Συναρτήσει', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 2, 'K', 'Διαδικαστικός Προγραμματισμός', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 2, 'K', 'Τεχνική Μηχανική', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 2, 'K', 'Εισαγωγή στην Επιστήμη του Ηλεκτρολόγου Μηχανικού και Τεχνολογίας Υπολογιστών', True,'3');

-- semester: 3
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 3, 'K', 'Ηλεκτρικά Κυκλώματα ΙΙ', True,'6');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 3, 'K', 'Μερικές Διαφορικές Εξισώσεις και Μετασχηματισμο', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 3, 'K', 'Πιθανοθεωρία και Στατιστική ', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 3, 'K', 'Ηλεκτροτεχνικά-Ηλεκτρονικά Υλικά', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 3, 'K', 'Ψηφιακά Κυκλώματα και Συστήματα', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 3, 'K', 'Αντικειμενοστρεφής Τεχνολογία', True,'3');

-- semester: 4
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 4, 'K', 'Ηλεκτρομαγνητικά Πεδία Ι', True,'3');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 4, 'K', 'Μικροηλεκτρονικές Διατάξεις και Κυκλώματα', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 4, 'K', 'Ανάλυση Δικτύων Ισχύος', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 4, 'K', 'Οργάνωση Υπολογιστών', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 4, 'K', 'Δίκτυα Επικοινωνιών', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 4, 'K', 'Σήματα και Συστήματα', True,'5');

-- semester: 5
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 5, 'K', 'Ηλεκτρομαγνητικά Πεδία II ', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 5, 'K', 'Ολοκληρωμένα Ηλεκτρονικά', True,'7');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 5, 'K', 'Αριθμητική Ανάλυση', True,'3');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 5, 'K', 'Επεξεργασία Σημάτων', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 5, 'K', 'Συστήματα Επικοινωνιών', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 5, 'K', 'Συστήματα Ηλεκτρικής Ενέργειας', True,'4');

-- semester: 6
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 6, 'K', 'Συστήματα Αυτομάτου Ελέγχου', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 6, 'K', 'Ηλεκτρικές Μετρητικές Διατάξεις και Τεχνικές', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 6, 'K', 'Μικρουπολογιστικά/Ενσωματωμένα Συστήματα', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 6, 'K', 'Ηλεκτρικές Μηχανές ', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 6, 'K', 'Τεχνικό Σχέδιο', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 6, 'K', 'Αλγόριθμοι και Δομές Δεδομένων', True,'4'); 

-- semester 7
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 7, 'Τ', 'Ανάκτηση πληροφορίας', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 7, 'Δ,Ζ,Σ', 'Ανάλυση ΣΗΕ (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 7, 'Λ,Η,Υ', 'Αρχιτεκτονική Υπολογιστών', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 7, 'Ε,Δ', 'Ασύρματη Διάδοση', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 7, 'Τ,Λ', 'Βάσεις Δεδομένων (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 7, 'Τ,Λ,Σ', 'Γραφικά και Εικονική Πραγματικότητα (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 7, 'Δ,Σ,Υ', 'Εισαγωγή στα Κυβερνοφυσικά Συστήματα', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 7, 'Λ,Η', 'Εισαγωγή στη Κβαντική Ηλεκτρονική', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 7, 'Σ,Υ', 'Εισαγωγή στην Ρομποτική (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 7, 'Δ,Ζ,Σ,Υ', 'Ελεγχος Γραμμικών Συστημάτων στον Χώρο Κατάστασης', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 7, 'Τ,Δ', 'Εμβιομηχανική Ι', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 7, 'Δ,Ζ,Σ,Υ', 'Εφαρμοσμένη Βελτιστοποίηση', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 7, 'Ζ,Σ', 'Ηλεκτρικά Κινητήρια Συστήματα Ι (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 7, 'Δ,Ζ', 'Ηλεκτρικές Εγκαταστάσεις', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 7, 'Τ,Η', 'Ηλεκτροακουστική (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 7, 'Δ,Ζ,Η', 'Ηλεκτρονικά Ισχύος Ι (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 7, 'Δ,Ζ', 'Θερμικές Εγκαταστάσεις', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 7, 'Ε,Τ,Σ', 'Θεωρία Πληροφορίας', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 7, 'Ε,Λ,Υ', 'Λειτουργικά Συστήματα', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 7, 'Ε,Η', 'Μικροκύματα', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 7, 'Δ,Ζ,Λ,Η,Σ', 'Προηγμένα Μικροϋπολογιστικά Συστήματα (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 7, 'Η', 'Σχεδίαση Ολοκληρωμένων Κυκλωμάτων Ι (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 7, 'Ε,Τ,Δ,Λ,Σ,Υ', 'Τεχνητή Νοημοσύνη I (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 7, 'Ε,Η', 'Τηλεπικοινωνιακά Ηλεκτρονικά και ηλεκτρονικά υψηλών συχνοτήτων', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 7, 'Δ', 'Υψηλές Τάσεις (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 7, 'Ε,Δ', 'Ψηφιακές Επικοινωνίες Ι', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 7, 'Ε,Τ,Ζ,Λ,Η,Σ,Υ', 'Ψηφιακή Επεξεργασία Σημάτων (Δ+Ε)', True,'5');

-- semester: 8
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Τ,Λ,Σ', '3Δ Υπολογιστική Όραση και Γεωμετρία (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Δ,Ζ', 'Ήπιες Μορφές Ενέργειας', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Ε,Λ,Η', 'Αρχιτεκτονική Δικτυακών Συστημάτων', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Ε,Δ', 'Ασύρματα Δίκτυα και Δίκτυα Κινητών Επικοινωνιών', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Σ', 'Βιομηχανικοί Αυτοματισμοί', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Ε,Λ,Σ,Υ', 'Γραμμική και Συνδυαστική Βελτιστοποίηση', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Η', 'Διαστημικές Τεχνολογίες', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Δ,Ζ', 'Δοκιμές και Μετρήσεις Υψηλών Τάσεων (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Δ,Σ', 'Δυναμική και Έλεγχος E-L Ηλεκτρομηχανικών Συστημάτων', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Τ', 'Εισαγωγή στη Βιοπληροφορική', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Δ,Ζ,Σ', 'Ελεγχος και Ευστάθεια ΣΗΕ (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Ζ', 'Εμβιομηχανική ΙΙ', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Δ,Ζ', 'Ενεργειακός Σχεδιασμός & Κλιματισμός Κτιρίων', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Τ,Λ,Υ', 'Εξόρυξη Δεδομένων και Αλγόριθμοι Μάθησης', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Ε,Τ,Η,Υ', 'Εργαστήριο Επικοινωνιών Ι (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Σ', 'Ευφυής Έλεγχος (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Ζ,Σ', 'Ηλεκτρικά Κινητήρια Συστήματα ΙΙ (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Ζ', 'Ηλεκτρονικά Ισχύος ΙΙ (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Ε', 'Θεωρία Κεραιών', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Ε', 'Θεωρία Τηλεπικοινωνιακής Κίνησης και Συστήματα Αναμονής', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Ε,Η', 'Οπτικές Επικοινωνίες (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Ε,Η', 'Οπτοηλεκτρονική και Φωτονική Τεχνολογία', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Λ', 'Προγραμματισμός Διαδικτύου (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Η', 'Προηγμένα Μικτά Αναλογικά/Ψηφιακά κυκλώματα και διατάξεις', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Ε,Λ', 'Προηγμένες Τεχνικές Προγραμματισμού (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Δ', 'Προστασία ΣΗΕ', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Δ,Ζ', 'Προστασία από Υπερτάσεις-Αλεξικέραυνα', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Σ', 'Ρομποτικά Συστήματα Ι (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Σ', 'Σθεναρός Έλεγχος (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Η', 'Σχεδίαση Ολοκληρωμένων Κυκλωμάτων ΙΙ (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Τ,Δ,Ζ,Λ,Σ,Υ', 'Τεχνητή Νοημοσύνη ΙΙ (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Η', 'Τεχνολογία Λογισμικού', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Δ', 'Τεχνολογίες Ελέγχου στις ΑΠΕ', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Τ', 'Υπολογιστική Γλωσσολογία (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Ζ,Σ,Υ', 'Ψηφιακά Συστήματα Ελέγχου (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Ε', 'Ψηφιακές Επικοινωνίες ΙΙ', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Τ', 'Ψηφιακή Επεξεργασία και Ανάλυση Εικόνας', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 8, 'Τ', 'Ψηφιακή Τεχνολογία Ήχου', True,'5');

-- semester: 9
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 9, 'Ζ', 'Ανάλυση και Σχεδιασμός Ηλεκτρικών Μηχανών με πεπερασμένα στοιχεία', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 9, 'Ε,Τ,Δ,Λ,Η,Σ,Υ', 'Ασφάλεια Υπολογιστών και Δικτύων', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 9, 'Δ,Σ', 'Βέλτιστος Έλεγχος Συστημάτων', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 9, 'Ε,Δ,Λ,Η,Υ', 'Διαδίκτυο των Πραγμάτων', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 9, 'Τ,Λ,Σ', 'Διαδραστικές Τεχνολογίες', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 9, 'Ε', 'Επικοινωνίες Πολυμέσων', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 9, 'Ε,Τ,Η,Υ', 'Εργαστήριο Επικοινωνιών ΙΙ (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 9, 'Δ', 'Ηλεκτρική Οικονομία', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 9, 'Ζ', 'Ηλεκτρονικά Ισχύος με Σύγχρονες Τεχνολογίες Ημιαγωγών', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 9, 'Η', 'Ηλεκτρονικά Υψηλών Ταχυτήτων', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 9, 'Λ,Η', 'Κατανεμημένα Ενσωματωμένα Συστήματα Πραγματικού Χρόνου', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 9, 'Τ', 'Κβαντικοί Υπολογιστές', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 9, 'Τ', 'Λογισμικό & Προγραμματισμός Συστημάτων Υψηλής Επίδοσης (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 9, 'Τ,Δ,Ζ,Σ,Υ', 'Μη Γραμμικά Συστήματα και Έλεγχος', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 9, 'Ε,Τ,Υ', 'Προγραμματιζόμενα Δίκτυα και Διαχείριση (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 9, 'Δ,Ζ,Σ', 'Προηγμένος Έλεγχος Ηλεκτρικών Μηχανών', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 9, 'Σ,Υ', 'Προσαρμοστικός Έλεγχος και Ενισχυτική Μάθηση', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 9, 'Σ', 'Ρομποτικά Συστήματα ΙΙ (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 9, 'Η', 'Σχεδιασμός Ολοκληρωμένων Συστημάτων (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 9, 'Λ,Η', 'Σύγχρονες Εφαρμογές Ασφάλειας Δικτύων (Δ+Ε)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 9, 'Δ,Ζ', 'Τεχνολογία Ηλεκτρικών Μονώσεων και Νανοδομημένα Διηλεκτρικά', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (3, 9, 'Ε', 'Τηλεπικοινωνιακά Δίκτυα Ευρείας Ζώνης☻Οπτικά Δίκτυα', True,'5');









INSERT INTO schools (school_id, school_name, link_odigos_spoudwn, link_gia_programma, link_mathimata_sxolis) VALUES (4,"CIVIL - AUTH","https://www.civil.auth.gr/images/files/proptixiaka/%CE%9D%CE%95%CE%9F_%CE%A0%CF%81%CF%8C%CE%B3%CF%81%CE%B1%CE%BC%CE%BC%CE%B1_%CE%A3%CF%80%CE%BF%CF%85%CE%B4%CF%8E%CE%BD.pdf","https://www.civil.auth.gr/images/files/proptixiaka/progdid/2023/Fall_Semester_Schedule_GR-2.pdf","https://www.civil.auth.gr");

-- semester: 1
INSERT INTO course (course_id, school_id, semester, flow, name, optional, ECTS) VALUES (800, 4, 1, 'K', 'Γεωδαισία Ι', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 1, 'K', 'Δομικά Υλικά Ι', True,'5.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 1, 'K', 'Μαθηματικά Ι', True,'5.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 1, 'K', 'Προγραμματισμός Η/Υ για Πολ. Μηχανικούς(Κορμού)', True,'6');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 1, 'K', 'Τεχνικές Σχεδιάσεις Ι: Βασικές Αρχές - Ψηφιακή Σχεδίαση (Υποχρεωτικό Εργαστήριο)', True,'2');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 1, 'K', 'Τεχνική Μηχανική Ι', True,'6');

-- semester: 2
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 2, 'K', 'Αντοχή Υλικών & Δομικών Στοιχείων Ι', True,'5.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 2, 'K', 'Αριθμητική Ανάλυση', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 2, 'K', 'Γεωδαισία ΙΙ', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 2, 'K', 'Δομικά Υλικά ΙΙ', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 2, 'K', 'Μαθηματικά ΙΙ', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 2, 'K', 'Στατιστική', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 2, 'K', 'Τεχνικές Σχεδιάσεις ΙΙ: Βασικές Αρχές - Ψηφιακή Σχεδίαση (Υποχρεωτικό Εργαστήριο)', True,'2');

-- semester: 3
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 3, 'K', 'Αντοχή Υλικών & Δομικών Στοιχείων ΙΙ', True,'6');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 3, 'K', 'Εργοτάξια - Δομικές Μηχανές', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 3, 'K', 'Μαθηματικά ΙΙΙ', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 3, 'K', 'Μηχανική Ρευστών', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 3, 'K', 'Οικοδομική I', True,'5.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 3, 'K', 'Τεχνική Γεωλογία', True,'4.5');

-- semester: 4
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 4, 'K', 'Επιφανειακή και Υπόγεια Υδρολογία', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 4, 'K', 'Εφαρμοσμένη Στατική των Ισοστατικών Φορέων', True,'6');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 4, 'K', 'Οδοποιία Ι', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 4, 'K', 'Οικοδομική II', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 4, 'K', 'Συγκοινωνιακή Τεχνική', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 4, 'K', 'Υδραυλική', True,'5');

-- semester: 5
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 5, 'K', 'Εδαφομηχανική Ι', True,'5.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 5, 'K', 'Εφαρμοσμένη Στατική Υπερστατικών Φορέων', True,'6');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 5, 'K', 'Οδοποιία ΙΙ', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 5, 'K', 'Σιδηροπαγές Σκυρόδεμα Ι', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 5, 'K', 'Σχεδιασμός Μεταφορών', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 5, 'K', 'Υδρεύσεις / Αποχετεύσεις', True,'4.5');

-- semester: 6
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 6, 'K', 'Αριθμητικές Μέθοδοι Ανάλυσης Έργων Πολιτικού Μηχανικού', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 6, 'K', 'Διαχείριση Έργων', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 6, 'K', 'Εδαφομηχανική ΙΙ', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 6, 'K', 'Περιβαλλοντική Μηχανική', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 6, 'K', 'Σιδηροπαγές Σκυρόδεμα ΙΙ', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 6, 'K', 'Χαλύβδινες Κατασκευές Ι', True,'5');

-- semester: 7
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 7, 'K', 'Ακτομηχανική & Λιμενικά Έργα', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 7, 'K', 'Δυναμική των Κατασκευών Ι', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 7, 'K', 'Θεμελιώσεις, Αντιστηρίξεις & Γεωτεχνικά Έργα', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 7, 'Ε', 'Ξύλινες Κατασκευές', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 7, 'Δ', 'Οικονομική των Μεταφορών', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 7, 'K', 'Οργάνωση & Προγραμματισμός Έργων', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 7, 'K', 'Σιδηροπαγές Σκυρόδεμα ΙΙΙ', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 7, 'Ε', 'Σύμμικτα Κτίρια & Χαλύβδινες Γέφυρες', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 7, 'Υ', 'Υδραυλική Ανοιχτών Αγωγών και Ποταμών', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 7, 'Υ', 'Υδραυλική των Υπόγειων Ροών', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 7, 'Μ', 'Υπολογιστικές μέθοδοι ανάλυσης γεωτεχνικών έργων', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 7, 'K', 'Χαλύβδινες Κατασκευές ΙΙ', True,'4');

-- semester: 8
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'Ε', 'Αριθμητικές Μέθοδοι Ανάλυσης Κατασκευών (ΥΕ)', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'Μ', 'Βραχομηχανική (ΥΕ)', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'Μ', 'Γεωτεχνική Σεισμική Μηχανική - Εδαφοδυναμική (ΥΕ)', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'Δ', 'Διαχείριση Κινητικότητας', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'Δ', 'Διαχείριση Τεχνικών Επιχειρήσεων', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'Ε', 'Δυναμική των Κατασκευών ΙΙ (ΥΕ)', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'K', 'Εκτίμηση Περιβαλλοντικών Επιπτώσεων', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'Ε', 'Ενεργειακός Σχεδιασμός Κτιρίων (ΥΕ)', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'Ε', 'Επιφανειακοί Φορείς I (ΥΕ)', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'Υ', 'Εργαστηριακές Μέθοδοι στην Περιβαλλοντική Μηχανική', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'Υ', 'Θαλάσσιες Κατασκευές', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'Δ', 'Οικονομία των Τεχνικών Έργων', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'Μ', 'Πειραματική Εδαφομηχανική (ΥΕ)', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'Ε', 'Πειραματική και Θεωρητική Μηχανική Συμπεριφορά Υλικών και Δομικών Στοιχείων', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'Υ', 'Περιβαλλοντική Πολιτική', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'K', 'Πρακτική Άσκηση', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'Τ', 'Πρακτική Άσκηση', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'Μ', 'Πρανή και Επιχώματα (ΥΕ)', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'Ε', 'Προεντεταμένο Σκυρόδεμα και Προκατασκευασμένα Κτίρια (ΥΕ)', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'Ε', 'Πυροπροστασία Κτιρίων', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'Δ', 'Πόλη, Μεταφορές και Περιβάλλον', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'Δ', 'Σιδηροδρομική (ΥΕ)', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'Ε', 'Συμπεριφορά και Ιδιότητες Δομικών Υλικών', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'Δ', 'Συστήματα Μεταφορών (ΥΕ)', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'Τ', 'Σχεδιασμός & Διαχείριση Φραγμάτων', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'Υ', 'Σχεδιασμός & Κατασκευή Λιμενικών Έργων (ΥΕ)', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'Δ', 'Σχεδιασμός & Κατασκευή Οδοστρωμάτων / Εργαστηριακοί Έλεγχοι (ΥΕ)', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'Υ', 'Σχεδιασμός Δικτύων Ύδρευσης - Αποχέτευσης (ΥΕ)', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'Μ', 'Τεχνική Γεωδαισία', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'Υ', 'Τεχνική Υδρολογία (ΥΕ)', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 8, 'Μ', 'Φωτογραμμετρία / Γεωπληροφοριακά Συστήματα', True,'4');

-- semester: 9
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Τ', 'Αλληλεπίδραση εδάφους - θεμελίωσης - κατασκευής', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Ε', 'Αντισεισμική Τεχνολογία & Παθολογία Κατασκευών Ο/Σ (ΥΕ)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Μ', 'Αντισεισμικός Σχεδιασμός Γεωτεχνικών Έργων', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Δ', 'Αξιολόγηση Επενδύσεων', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Μ', 'Βαθιές Θεμελιώσεις, Εκσκαφές και Αντιστηρίξεις (ΥΕ)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Ε', 'Γέφυρες και Ειδικά Θέματα Σκυροδέματος', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Υ', 'Γεωθερμία', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Μ', 'Γεωματική', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Μ', 'Γεωτεχνική Περιβάλλοντος (ΥΕ)', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Τ', 'Γεωτεχνικός σχεδιασμός συγκοινωνιακών έργων υποδομής', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Δ', 'Δημόσιες Συγκοινωνίες (ΥΕ)', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Δ', 'Διαχείριση Οδικών Έργων', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Υ', 'Διαχείριση Στερεών Αποβλήτων', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Υ', 'Διαχείριση Υδατικών Πόρων (ΥΕ)', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Ε', 'Ειδικά Θέματα Μεταλλικών Κατασκευών – Δομικό Αλουμίνιο (ΥΕ)', True,'5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Ε', 'Ειδικά Θέματα Περιβαλλοντικού Αρχιτεκτονικού Σχεδιασμού και Φυσικής των Κτιρίων', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Ε', 'Ελαστοπλαστικός Υπολογισμός Κατασκευών', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Ε', 'Επιφανειακοί Φορείς ΙΙ', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Ε', 'Κατασκευές από Φέρουσα Τοιχοποιία και Ανάλυση Ξύλινων Κατασκευών', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Υ', 'Μαθηματικά Ομοιώματα Ποιότητας Υδάτινων Οικοσυστημάτων', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Μ', 'Μηχανική Συμπεριφορά Εδαφών και Καταστατικοί Νόμοι (ΥΕ)', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Δ', 'Μοντελοποίηση Κατασκευαστικής Πληροφορίας & Ψηφιακά Δίδυμα', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Δ', 'Οδική και Σιδηροδρομική Ασφάλεια', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Υ', 'Παράκτια Μηχανική και Ωκεανογραφία', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Δ', 'Πολεοδομία, Χωροταξία και Περιφερειακή Ανάπτυξη (ΥΕ)', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Υ', 'Σχεδιασμός Έργων Άρδευσης & Αποστράγγισης (ΥΕ)', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Δ', 'Σχεδιασμός και Κατασκευή Αεροδρομίων', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Δ', 'Τεχνική Νομοθεσία (ΥΕ)', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Τ', 'Υδροδυναμική και Γεωτεχνική Θαλάσσιων Συστημάτων ΑΠΕ', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Ε', 'Υλικά και Μέθοδοι Επισκευής Ιστορικών και Σύγχρονων Κατασκευών', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Μ', 'Υπόγεια Έργα - Σήραγγες', True,'4');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Τ', 'Φυσικοί κίνδυνοι: Διαχείριση της Διακινδύνευσης και Ανθεκτικότητας (ΥΕ για τον ΤΥΤΠ)', True,'4.5');
INSERT INTO course (school_id, semester, flow, name, optional, ECTS) VALUES (4, 9, 'Μ', 'Φωτοερμηνεία / Τηλεπισκόπηση', True,'4');
