alter table Reader
    add column registrationDate timestamp default current_timestamp;
alter table Reader
    add constraint unique_email unique (email);
alter table Reader
    alter column age type numeric(10, 1) using age::numeric(10, 1);
alter table Reader
    alter column lastName type integer using case when lastname = 'Сидоров' then 1 when lastname = 'Кузнецова' then 2 end;


alter table Reader
    drop column registrationDate;
alter table Reader
    drop constraint unique_email;
alter table Reader
    alter column age type integer using age::integer;
alter table Reader
    alter column lastName type varchar(50) using case when lastname = 1 then 'Сидоров' when lastname = 2 then 'Кузнецова' end;


alter table Library
    add column parentId integer,
    add constraint parentId foreign key (parentId) references Library (libraryID);

INSERT INTO Library(name, numberOfFloors, parentId)
VALUES ('Филиал Центральной библиотеки', 2, 1);

INSERT INTO Library(name, numberOfFloors, parentId)
VALUES ('Филиал Городской библиотеки', 3, 2),
       ('Детская библиотека', 1, 4);
ALTER TABLE Book_issue ADD CONSTRAINT unique_issue UNIQUE (reader, book, library);
