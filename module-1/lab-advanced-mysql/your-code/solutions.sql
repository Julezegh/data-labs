
MYSQL advanced

Challenge 1:

1. 
USE publications;
SELECT a.au_id AS AUTHOR_ID, ta.title_id AS TITLE_ID, (t.price*sa.qty*t.royalty/100*ta.royaltyper/100) AS ROYALTY
FROM authors a
LEFT JOIN titleauthor ta
ON a.au_id= ta.au_id
LEFT JOIN titles t
ON ta.title_id=t.title_id
LEFT JOIN sales sa
ON sa.title_id=t.title_id



2. 
USE publications;
SELECT a.au_id AS AUTHOR_ID, t.title_id AS TITLE_ID, sum(t.price*sa.qty*t.royalty/100*ta.royaltyper/100) AS ROYALTY
FROM authors a
LEFT JOIN titleauthor ta ON a.au_id= ta.au_id
LEFT JOIN titles t ON ta.title_id=t.title_id
LEFT JOIN sales sa
ON sa.title_id=t.title_id
GROUP BY a.au_id, t.title_id

3. 
USE publications;
SELECT a.au_id AS AUTHOR_ID, t.title_id AS TITLE_ID, SUM((t.price*sa.qty*t.royalty/100*ta.royaltyper/100)+ t.advance) AS total_profit
FROM authors a
LEFT JOIN titleauthor ta ON a.au_id= ta.au_id
LEFT JOIN titles t ON ta.title_id=t.title_id
LEFT JOIN sales sa
ON sa.title_id=t.title_id
GROUP BY a.au_id, t.title_id
ORDER BY ROYALTY DESC
LIMIT 3;

Challenge 2 :

USE publications;
CREATE TEMPORARY TABLE publications.authors_profit
SELECT a.au_id AS AUTHOR_ID, t.title_id AS TITLE_ID, SUM((t.price*sa.qty*t.royalty/100*ta.royaltyper/100)+ t.advance) AS total_profit
FROM authors a
LEFT JOIN titleauthor ta ON a.au_id= ta.au_id
LEFT JOIN titles t ON ta.title_id=t.title_id
LEFT JOIN sales sa
ON sa.title_id=t.title_id
GROUP BY a.au_id, t.title_id
ORDER BY ROYALTY DESC
LIMIT 3;

Challenge 3 :

USE publications;
CREATE TABLE most_profiting_author
SELECT a.au_id AS AUTHOR_ID, SUM((t.price*sa.qty*t.royalty/100*ta.royaltyper/100)+ t.advance) AS PROFITS
FROM authors a
LEFT JOIN titleauthor ta ON a.au_id= ta.au_id
LEFT JOIN titles t ON ta.title_id=t.title_id
LEFT JOIN sales sa
ON sa.title_id=t.title_id
GROUP BY a.au_id,
