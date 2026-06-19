SELECT m.name,
       b.title,
       br.issue_date
FROM Borrow_Records br
JOIN Members m
ON br.member_id = m.member_id
JOIN Books b
ON br.book_id = b.book_id;

SELECT b.title,
       COUNT(*) AS borrow_count
FROM Borrow_Records br
JOIN Books b
ON br.book_id = b.book_id
GROUP BY b.title
ORDER BY borrow_count DESC;

SELECT m.name,
       COUNT(*) AS books_borrowed
FROM Borrow_Records br
JOIN Members m
ON br.member_id = m.member_id
GROUP BY m.name
ORDER BY books_borrowed DESC;

SELECT m.name,
       b.title,
       br.issue_date
FROM Borrow_Records br
JOIN Members m
ON br.member_id = m.member_id
JOIN Books b
ON br.book_id = b.book_id
WHERE br.status='Not Returned';

CREATE VIEW Popular_Books AS
SELECT b.title,
       COUNT(*) total_borrowed
FROM Borrow_Records br
JOIN Books b
ON br.book_id=b.book_id
GROUP BY b.title;

CREATE TRIGGER update_copies
AFTER INSERT ON Borrow_Records
FOR EACH ROW
UPDATE Books
SET available_copies = available_copies - 1
WHERE book_id = NEW.book_id;
