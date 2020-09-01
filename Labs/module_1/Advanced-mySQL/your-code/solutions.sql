	# Challenge 1

SELECT 
    au_id, SUM(advance) + SUM(total_royalties) AS profits
FROM
    (SELECT 
        title_id,
            au_id,
            advance,
            SUM(sales_royalties) AS total_royalties
    FROM
        (SELECT 
        royalties.title_id,
            royalties.au_id,
            titles.advance * royalties.royaltyper / 100 AS advance,
            titles.price * sales.qty * titles.royalty / 100 * royalties.royaltyper / 100 AS sales_royalties
    FROM
        titleauthor AS royalties
    LEFT JOIN titles AS titles ON royalties.title_id = titles.title_id
    LEFT JOIN sales AS sales ON royalties.title_id = sales.title_id) AS sub_royalties
    GROUP BY title_id , au_id , advance) AS total
GROUP BY au_id
ORDER BY 2 DESC
LIMIT 3;

# Challenge 2
CREATE TEMPORARY TABLE royalties
    SELECT 
        title_id,
            au_id,
            advance,
            SUM(sales_royalties) AS total_royalties
    FROM
        (SELECT 
        royalties.title_id,
            royalties.au_id,
            titles.advance * royalties.royaltyper / 100 AS advance,
            titles.price * sales.qty * titles.royalty / 100 * royalties.royaltyper / 100 AS sales_royalties
    FROM
        titleauthor AS royalties
    LEFT JOIN titles AS titles ON royalties.title_id = titles.title_id
    LEFT JOIN sales AS sales ON royalties.title_id = sales.title_id) AS sub_royalties
    GROUP BY title_id , au_id , advance;
    
SELECT 
    au_id, SUM(advance) + SUM(total_royalties) AS profits
FROM royalties

GROUP BY au_id
ORDER BY 2 DESC
LIMIT 3;

# Challenge 3

CREATE TABLE most_profiting_authors
SELECT 
    au_id, SUM(advance) + SUM(total_royalties) AS profits
FROM royalties

GROUP BY au_id
ORDER BY 2 DESC
LIMIT 3;