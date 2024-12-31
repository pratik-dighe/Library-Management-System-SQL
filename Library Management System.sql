CREATE DATABASE Library;
USE Library;
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(50),
    PublishedYear INT
);

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(50),
    PhoneNumber VARCHAR(15)
);

CREATE TABLE Borrowing (
    BorrowID INT PRIMARY KEY,
    BookID INT,
    UserID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

INSERT INTO Books (BookID, Title, Author, PublishedYear) VALUES
(1, 'Mrityunjay', 'Shivaji Sawant', 1967),
(2, 'Shrimanyogi', 'Ranjit Desai', 1964),
(3, 'Kosala', 'Bhalchandra Nemade', 1963);

INSERT INTO Users (UserID, Name, Email, PhoneNumber) VALUES
(1, 'Pratik Dighe', 'pratik@gmail.com', '000-000-0000'),
(2, 'Dighe Pratik', 'dighe@gmail.com', '000-000-0000');

INSERT INTO Borrowing (BorrowID, BookID, UserID, BorrowDate, ReturnDate) VALUES
(1, 1, 1, '2024-12-01', '2024-12-15'),
(2, 2, 2, '2024-12-05', NULL);

SELECT * FROM Books;

SELECT b.Title, b.Author 
FROM Borrowing br
JOIN Books b ON br.BookID = b.BookID
WHERE br.UserID = 1;

SELECT br.BorrowID, b.Title, m.Name, br.BorrowDate, br.ReturnDate 
FROM Borrowing br
JOIN Books b ON br.BookID = b.BookID
JOIN Users m ON br.UserID = m.UserID
WHERE br.ReturnDate IS NULL AND br.BorrowDate < DATE_SUB(CURDATE(), INTERVAL 14 DAY);


SELECT COUNT(*) AS TotalBooks
FROM Books;

SELECT Author, COUNT(*) AS BooksByAuthor
FROM Books
GROUP BY Author;

SELECT COUNT(*) AS TotalBooksAfter1900
FROM Books
WHERE PublishedYear > 1900;
