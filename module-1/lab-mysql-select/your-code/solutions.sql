
MYSQL SELECT

Challenge 1:

USE publications;
SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, t.title AS TITLE, pub.pub_name AS PUBLISHERS
FROM authors a
JOIN titleauthor ta
ON a.au_id= ta.au_id
JOIN titles t
ON ta.title_id=t.title_id
JOIN publishers pub
ON pub.pub_id=t.pub_id;


Challenge 2:

USE publications;
SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, pub.pub_name AS PUBLISHERS, COUNT(t.title_id) AS TITLES_COUNT
FROM authors a
JOIN titleauthor ta
ON a.au_id= ta.au_id
JOIN titles t
ON ta.title_id=t.title_id
JOIN publishers pub
ON pub.pub_id=t.pub_id
GROUP BY a.au_id, pub.pub_name, a.au_lname, a.au_fname;

USE publications;
SELECT SUM(TITLES_COUNT) FROM
(SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, pub.pub_name AS PUBLISHERS, COUNT(t.title_id) AS TITLES_COUNT
FROM authors a
JOIN titleauthor ta
ON a.au_id= ta.au_id
JOIN titles t
ON ta.title_id=t.title_id
JOIN publishers pub
ON pub.pub_id=t.pub_id
GROUP BY a.au_id, pub.pub_name, a.au_lname, a.au_fname) BLA;


Challenge 3:

USE publications;
SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, SUM(sa.qty) AS TOTAL
FROM authors a
JOIN titleauthor ta
ON a.au_id= ta.au_id
JOIN titles t
ON ta.title_id=t.title_id
JOIN sales sa
ON sa.title_id=t.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC
LIMIT 3;

Challenge 4:

USE publications;
SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, SUM(sa.qty) AS TOTAL
FROM authors a
LEFT JOIN titleauthor ta
ON a.au_id= ta.au_id
LEFT JOIN titles t
ON ta.title_id=t.title_id
LEFT JOIN sales sa
ON sa.title_id=t.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY TOTAL DESC

Bonus : 

USE publications;
SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, (t.advance + (t.royalty/100)*price*ytd_sales) AS PROFIT
FROM authors a
LEFT JOIN titleauthor ta
ON a.au_id= ta.au_id
LEFT JOIN titles t
ON ta.title_id=t.title_id
LEFT JOIN sales sa
ON sa.title_id=t.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY PROFIT DESC