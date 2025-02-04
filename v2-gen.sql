INSERT INTO Library (name, numberOfFloors)
VALUES ('Центральная библиотека', 3),
       ('Городская библиотека', 5);

INSERT INTO Librarian (firstName, lastName, phone, termOfWork, jobTitle)
VALUES ('Иван', 'Иванов', '+79991234567', 5, 'Библиотекарь'),
       ('Мария', 'Петрова', '+78889876543', 10, 'Старший библиотекарь');

INSERT INTO Librarian_library (librarianID, libraryID)
VALUES (1, 2),
       (2, 1),
       (2, 2);

INSERT INTO Book (title, author, weight)
VALUES ('Война и мир', 'Лев Толстой', 1.50),
       ('1984', 'Джордж Оруэлл', 0.80),
       ('Мастер и Маргарита', 'Михаил Булгаков', 1.20);

INSERT INTO Reader (firstName, lastName, age, email)
VALUES ('Алексей', 'Сидоров', 25, 'alex.sidorov@gmail.com'),
       ('Елена', 'Кузнецова', 30, 'elena.kuznetsova@gmail.com');

INSERT INTO Book_issue (reader, book, library)
VALUES (1, 1, 1),
       (2, 2, 2);

INSERT INTO Library(name, numberOfFloors, parentId)
VALUES ('Филиал Центральной библиотеки', 2, 1);

INSERT INTO Library(name, numberOfFloors, parentId)
VALUES ('Филиал Городской библиотеки', 3, 2),
       ('Детская библиотека', 1, 4);

INSERT INTO Reader(firstName, lastName, age, email, registrationDate)
SELECT (ARRAY ['Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Frank', 'Grace', 'Hannah', 'Ian', 'Julia',
    'Kevin', 'Linda', 'Michael', 'Nancy', 'Oliver', 'Pamela', 'Quentin', 'Rachel', 'Samuel', 'Tina',
    'Ulysses', 'Victoria', 'Walter', 'Xavier', 'Yvonne', 'Zachary', 'Sophia', 'Liam', 'Emma', 'Noah',
    'Ava', 'Isabella', 'Mia', 'Olivia', 'Ethan', 'William', 'James', 'Benjamin', 'Henry', 'Alexander',
    'Amelia', 'Charlotte', 'Evelyn', 'Harper', 'Ella', 'Emily', 'Abigail', 'Elizabeth', 'Sofia', 'Avery'
    ])[floor(random() * 50 + 1)::int],
       (ARRAY ['Smith', 'Johnson', 'Williams', 'Brown', 'Jones', 'Garcia', 'Miller', 'Davis', 'Rodriguez', 'Martinez',
           'Hernandez', 'Lopez', 'Gonzalez', 'Wilson', 'Anderson', 'Thomas', 'Taylor', 'Moore', 'Jackson', 'Martin',
           'Lee', 'Walker', 'Hall', 'Young', 'King', 'Wright', 'Hill', 'Scott', 'Green', 'Adams',
           'Baker', 'Nelson', 'Carter', 'Mitchell', 'Perez', 'Roberts', 'Turner', 'Phillips', 'Campbell', 'Parker',
           'Evans', 'Edwards', 'Collins', 'Stewart', 'Sanchez', 'Morris', 'Rogers', 'Reed', 'Cook', 'Morgan'
           ])[floor(random() * 50 + 1)::int],
       floor(random() * (50 - 18 + 1) + 18)::int,
       floor(random() * 50000)::text || '.' || '@mail.com',
       now() + (random() * (interval '180 days') - interval '90 days')
FROM generate_series(1, 300);

INSERT INTO Librarian(firstName, lastName, phone, termOfWork, jobTitle)
SELECT (ARRAY ['Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Frank', 'Grace', 'Hannah', 'Ian', 'Julia',
    'Kevin', 'Linda', 'Michael', 'Nancy', 'Oliver', 'Pamela', 'Quentin', 'Rachel', 'Samuel', 'Tina',
    'Ulysses', 'Victoria', 'Walter', 'Xavier', 'Yvonne', 'Zachary', 'Sophia', 'Liam', 'Emma', 'Noah',
    'Ava', 'Isabella', 'Mia', 'Olivia', 'Ethan', 'William', 'James', 'Benjamin', 'Henry', 'Alexander',
    'Amelia', 'Charlotte', 'Evelyn', 'Harper', 'Ella', 'Emily', 'Abigail', 'Elizabeth', 'Sofia', 'Avery'
    ])[floor(random() * 50 + 1)::int],
       (ARRAY ['Smith', 'Johnson', 'Williams', 'Brown', 'Jones', 'Garcia', 'Miller', 'Davis', 'Rodriguez', 'Martinez',
           'Hernandez', 'Lopez', 'Gonzalez', 'Wilson', 'Anderson', 'Thomas', 'Taylor', 'Moore', 'Jackson', 'Martin',
           'Lee', 'Walker', 'Hall', 'Young', 'King', 'Wright', 'Hill', 'Scott', 'Green', 'Adams',
           'Baker', 'Nelson', 'Carter', 'Mitchell', 'Perez', 'Roberts', 'Turner', 'Phillips', 'Campbell', 'Parker',
           'Evans', 'Edwards', 'Collins', 'Stewart', 'Sanchez', 'Morris', 'Rogers', 'Reed', 'Cook', 'Morgan'
           ])[floor(random() * 50 + 1)::int],
       '+' || floor(random() * 10000000000 + 1000000000)::VARCHAR(20),
       floor(random() * 500):: int,
       (ARRAY ['Библиотекарь', 'Старший библиотекарь', 'Каталогизатор', 'Архивариус'])[floor(random() * 4 + 1)::int]
FROM generate_series(1, 300);

INSERT INTO Book (title, author, weight)
VALUES
    ('Преступление и наказание', 'Федор Достоевский', 1.10),
    ('Анна Каренина', 'Лев Толстой', 1.30),
    ('Маленький принц', 'Антуан де Сент-Экзюпери', 0.50),
    ('Гарри Поттер и философский камень', 'Джоан Роулинг', 0.90),
    ('Властелин колец', 'Дж. Р. Р. Толкин', 1.80),
    ('Улисс', 'Джеймс Джойс', 1.60),
    ('Моби Дик', 'Герман Мелвилл', 1.40),
    ('Великий Гэтсби', 'Фрэнсис Скотт Фицджеральд', 0.70),
    ('Над пропастью во ржи', 'Джером Сэлинджер', 0.60),
    ('Тень горы', 'Грегори Дэвид Робертс', 1.20),
    ('Шантарам', 'Грегори Дэвид Робертс', 1.50),
    ('Атлант расправил плечи', 'Айн Рэнд', 1.70),
    ('Алхимик', 'Пауло Коэльо', 0.40),
    ('Сто лет одиночества', 'Габриэль Гарсиа Маркес', 1.10),
    ('Лолита', 'Владимир Набоков', 0.80),
    ('Братья Карамазовы', 'Федор Достоевский', 1.60),
    ('Идиот', 'Федор Достоевский', 1.40),
    ('Бесы', 'Федор Достоевский', 1.30),
    ('Подросток', 'Федор Достоевский', 1.20),
    ('Записки из подполья', 'Федор Достоевский', 0.90),
    ('Игрок', 'Федор Достоевский', 0.80),
    ('Неточка Незванова', 'Федор Достоевский', 0.70),
    ('Село Степанчиково и его обитатели', 'Федор Достоевский', 0.60),
    ('Бедные люди', 'Федор Достоевский', 0.50);

INSERT INTO Librarian_library (librarianID, libraryID)
SELECT DISTINCT ON (l.librarianID)
    l.librarianID,
    lib.libraryID
FROM
    Librarian l
        CROSS JOIN
    Library lib
ORDER BY
    l.librarianID,
    random()
ON CONFLICT (librarianID, libraryID) DO NOTHING;

INSERT INTO Book_issue (reader, book, library, issueDate)
WITH RandomValues AS (
    SELECT
        n,
        (SELECT readerID FROM Reader ORDER BY random() + n LIMIT 1) as reader_id,
        (SELECT bookID FROM Book ORDER BY random() + n LIMIT 1) as book_id,
        (SELECT libraryID FROM Library ORDER BY random() + n LIMIT 1) as library_id
    FROM generate_series(1, 300) as n
)
SELECT reader_id, book_id, library_id, now() - (random() * interval '365 days')
FROM RandomValues
ON CONFLICT (reader, book, library) DO NOTHING;
