CREATE DATABASE library_management;
USE library_management;
CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    join_date DATE
);
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(200),
    author VARCHAR(100),
    category VARCHAR(50),
    total_copies INT,
    available_copies INT
);
CREATE TABLE Librarians (
    librarian_id INT PRIMARY KEY,
    name VARCHAR(100)
);
CREATE TABLE Borrow_Records (
    borrow_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    issue_date DATE,
    return_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (member_id)
        REFERENCES Members(member_id),

    FOREIGN KEY (book_id)
        REFERENCES Books(book_id)
);

