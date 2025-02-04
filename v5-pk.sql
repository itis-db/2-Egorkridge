/**
  @author Egorkridge
 */
BEGIN;

DROP TABLE IF EXISTS Librarian_library;
DROP TABLE IF EXISTS Book_issue;

ALTER TABLE Library RENAME TO Library_old;
ALTER TABLE Librarian RENAME TO Librarian_old;
ALTER TABLE Book RENAME TO Book_old;
ALTER TABLE Reader RENAME TO Reader_old;

CREATE TABLE Library (
    name VARCHAR(100) PRIMARY KEY,
    numberOfFloors INTEGER,
    parentName VARCHAR(100) REFERENCES Library (name) ON DELETE SET NULL,
    CHECK (name <> parentName)
);

CREATE TABLE Librarian (
    firstName VARCHAR(30),
    lastName VARCHAR(50),
    phone VARCHAR(20),
    termOfWork INTEGER,
    jobTitle VARCHAR(50),
    PRIMARY KEY (firstName, lastName, phone)
);

CREATE TABLE Book (
    title VARCHAR(100),
    author VARCHAR(100),
    weight DECIMAL(10, 2),
    PRIMARY KEY (title, author)
);

CREATE TABLE Reader (
    firstName VARCHAR(30),
    lastName VARCHAR(50),
    age NUMERIC(10,1),
    email VARCHAR(50) PRIMARY KEY,
    registrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Librarian_library (
    librarianFirstName VARCHAR(30),
    librarianLastName VARCHAR(50),
    librarianPhone VARCHAR(20),
    libraryName VARCHAR(100),
    PRIMARY KEY (librarianFirstName, librarianLastName, librarianPhone, libraryName),
    FOREIGN KEY (librarianFirstName, librarianLastName, librarianPhone) REFERENCES Librarian (firstName, lastName, phone),
    FOREIGN KEY (libraryName) REFERENCES Library (name)
);

CREATE TABLE Book_issue (
    readerEmail VARCHAR(50),
    bookTitle VARCHAR(100),
    bookAuthor VARCHAR(100),
    libraryName VARCHAR(100),
    issueDate DATE DEFAULT CURRENT_DATE,
    PRIMARY KEY (readerEmail, bookTitle, bookAuthor, libraryName, issueDate),
    FOREIGN KEY (readerEmail) REFERENCES Reader (email),
    FOREIGN KEY (bookTitle, bookAuthor) REFERENCES Book (title, author),
    FOREIGN KEY (libraryName) REFERENCES Library (name)
);

INSERT INTO Library (name, numberOfFloors, parentName)
SELECT name, numberOfFloors, COALESCE((SELECT name FROM Library_old WHERE libraryID = l.parentId), NULL)
FROM Library_old l;

INSERT INTO Librarian (firstName, lastName, phone, termOfWork, jobTitle)
SELECT firstName, lastName, phone, termOfWork, jobTitle FROM Librarian_old;

INSERT INTO Book (title, author, weight)
SELECT title, author, weight FROM Book_old;

INSERT INTO Reader (firstName, lastName, age, email, registrationDate)
SELECT firstName, lastName, age, email, registrationDate FROM Reader_old;

INSERT INTO Librarian_library (librarianFirstName, librarianLastName, librarianPhone, libraryName)
SELECT lo.firstName, lo.lastName, lo.phone, lib.name
FROM Librarian_old lo
JOIN Librarian_library ll ON ll.librarianID = lo.librarianID
JOIN Library_old lib ON lib.libraryID = ll.libraryID;

INSERT INTO Book_issue (readerEmail, bookTitle, bookAuthor, libraryName, issueDate)
SELECT r.email, b.title, b.author, lib.name, bi.issueDate
FROM Book_issue bi
JOIN Reader_old r ON r.readerID = bi.reader
JOIN Book_old b ON b.bookID = bi.book
JOIN Library_old lib ON lib.libraryID = bi.library;

COMMIT;
