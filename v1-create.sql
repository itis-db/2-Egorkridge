CREATE TABLE Library
(
    libraryID      SERIAL PRIMARY KEY,
    name           VARCHAR(50),
    numberOfFloors INTEGER
);

CREATE TABLE Librarian
(
    librarianID SERIAL PRIMARY KEY,
    firstName   VARCHAR(30),
    lastName    VARCHAR(50),
    phone       VARCHAR(20),
    termOfWork  INTEGER,
    jobTitle    VARCHAR(50)
);

CREATE TABLE Librarian_library
(
    librarianID INT REFERENCES Librarian (librarianID),
    libraryID   INT REFERENCES Library (libraryID),
    PRIMARY KEY (librarianID, libraryID)
);

CREATE TABLE Book
(
    bookID SERIAL PRIMARY KEY,
    title  VARCHAR(100),
    author VARCHAR(100),
    weight DECIMAL(10, 2)
);

CREATE TABLE Reader
(
    readerID SERIAL PRIMARY KEY,
    firstName VARCHAR(30),
    lastName  VARCHAR(50),
    age       INTEGER,
    email     VARCHAR(50)
);

CREATE TABLE Book_issue
(
    issueID   SERIAL PRIMARY KEY,
    reader    INTEGER REFERENCES Reader (readerID),
    book      INTEGER REFERENCES Book (bookID),
    library   INTEGER REFERENCES Library (libraryID),
    issueDate DATE DEFAULT CURRENT_DATE
);

