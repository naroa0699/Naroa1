-- 1. 
select distinct c.customer_id, c.first_name,c.last_name
from customer c
join rental r on c.customer_id = r.customer_id
where r.rental_date >= curdate() - interval 30 day;

-- The query joins the `customer` and `rental` tables on `customer_id` and filters the rentals to those that occurred in the last 30 days using `CURDATE()` and the `INTERVAL` function.

-- 2.
select f.title, count(i.film_id) as rental_count
from film f
join inventory i on f.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id
group by f.film_id
order by rental_count desc
limit 1;

-- The query joins the `film` and `rental` tables on `film_id`, counts the number of rentals per film, groups by `film_id`, and orders the results by the highest rental count to identify the most rented film.

-- 3.
select s.store_id, sum(p.amount) as total_revenue
from store s
join inventory i on s.store_id = i.store_id
join rental r on i.inventory_id=r.inventory_id
join payment p on r.rental_id = p.rental_id
group by s.store_id;

-- The query joins the `store`, `rental`, and `payment` tables to calculate the total revenue per store by summing the `amount` column from the `payment` table, grouped by `store_id`.