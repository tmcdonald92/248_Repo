# Question 1

SELECT DISTINCT prime_genre FROM ironhack_par.Appstore;

# Question 2

SELECT prime_genre, count(rating_count_tot) as ratings FROM ironhack_par.Appstore

where rating_count_tot > 0

GROUP BY prime_genre

ORDER BY count(rating_count_tot) DESC

LIMIT 1;

# Question 3

SELECT prime_genre, count(prime_genre) as count FROM ironhack_par.Appstore

GROUP BY prime_genre

ORDER BY count(prime_genre) DESC

LIMIT 1;

# Question 4

SELECT prime_genre, count(prime_genre) as count FROM ironhack_par.Appstore

GROUP BY prime_genre

ORDER BY count(prime_genre) ASC

LIMIT 1;

# Question 5

SELECT track_name, sum(rating_count_tot) as sum_ratings FROM ironhack_par.Appstore

GROUP BY track_name

ORDER BY sum(rating_count_tot) DESC

LIMIT 10;

# Question 6

SELECT track_name, user_rating, user_rating_ver, ver, sum(rating_count_tot) as rating_vol FROM ironhack_par.Appstore

GROUP BY track_name, user_rating, ver, user_rating_ver

ORDER BY user_rating DESC

LIMIT 10;

# Question 7

# The most rating apps correspond to the most popular, like Facebook, Instagram or Spotify. They are apps that are widely used, so it makes sense that they are the most rated.

# Question 8
# The best rated apps by the users are not so well known apps and some of them don't have a lot of ratings.

# Question 9
# The best rated apps by users have the best ratings, however, it doesn't necessarily mean that they that the best apps because the number of ratings is also much lower compared to the most rated apps.
# So our sample is much smaller which leads to skewed results.

# Question 10
# By ordering by user_rating and by volume of ratings

SELECT track_name, user_rating, sum(rating_count_tot) as rating_vol FROM ironhack_par.Appstore

GROUP BY track_name, user_rating

ORDER BY user_rating DESC, sum(rating_count_tot) DESC

LIMIT 3;
# Question 11
SELECT
    price,
    COUNT(track_name) AS number_apps,
    SUM(rating_count_tot) AS vol_ratings,
    ROUND(AVG(user_rating),2) AS avg_user_rating,
    SUM(rating_count_tot) / COUNT(track_name) AS ratings_per_app
FROM
    ironhack_par.Appstore
GROUP BY price;

# Even though the user_ratings don't change a lot between app prices, it is clear that there are more games in the Appstore that are free. Actually, the number of free apps account for more than the other apps combined.
# So, according to the law of demand and offer, the number of free apps can explain the users are looking for free apps.