# CHALLENGE 1
use publications;

SELECT
		b.au_id as author_id,
        b.au_lname as last_name,
        b.au_fname as first_name,
        c.title,
        c.pub_name as publisher
FROM titleauthor as a

LEFT JOIN authors as b ON a.au_id = b.au_id

LEFT JOIN (
			SELECT a.title_id, a.title, b.pub_name
            FROM titles as a
            LEFT JOIN publishers as b ON a.pub_id = b.pub_id
            ) c ON a.title_id = c.title_id;

# CHALLENGE 2

SELECT
		b.au_id as author_id,
        b.au_lname as last_name,
        b.au_fname as first_name,
        c.pub_name as publisher,
        count(c.title_id) as title_count
FROM titleauthor as a

LEFT JOIN authors as b ON a.au_id = b.au_id

LEFT JOIN (
			SELECT a.title_id, a.title, b.pub_name
            FROM titles as a
            LEFT JOIN publishers as b ON a.pub_id = b.pub_id
            ) c ON a.title_id = c.title_id

GROUP BY
		b.au_id,
        b.au_lname,
        b.au_fname,
        c.pub_name;

# CHALLENGE 3

SELECT
		b.au_id as author_id,
        b.au_lname as last_name,
        b.au_fname as first_name,
        sum(c.qty) as total
FROM titleauthor as a

LEFT JOIN authors as b ON a.au_id = b.au_id

LEFT JOIN (
			SELECT a.title_id, b.qty
            FROM titles as a
            LEFT JOIN sales as b ON a.title_id = b.title_id
            ) c ON a.title_id = c.title_id

GROUP BY
		b.au_id,
        b.au_lname,
        b.au_fname

ORDER BY total DESC

LIMIT 3;

# CHALLENGE 4

SELECT
		b.au_id as author_id,
        b.au_lname as last_name,
        b.au_fname as first_name,
        SUM(COALESCE(c.qty,0)) as total
        
FROM titleauthor as a

LEFT JOIN authors as b ON a.au_id = b.au_id

LEFT JOIN (
			SELECT a.title_id, b.qty
            FROM titles as a
            LEFT JOIN sales as b ON a.title_id = b.title_id
            ) c ON a.title_id = c.title_id

GROUP BY

		b.au_id,
        b.au_lname,
        b.au_fname

UNION

SELECT
		b.au_id as author_id,
        b.au_lname as last_name,
        b.au_fname as first_name,
        COALESCE(c.qty,0) as total
        
FROM titleauthor as a

LEFT JOIN authors as b ON a.au_id = b.au_id

LEFT JOIN (
			SELECT a.title_id, b.qty
            FROM titles as a
            LEFT JOIN sales as b ON a.title_id = b.title_id
            ) c ON a.title_id = c.title_id

WHERE COALESCE(c.qty,0) = 0

ORDER BY total DESC