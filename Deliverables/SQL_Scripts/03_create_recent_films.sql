use sakila;
create table recent_films as
select*
from film
where release_year >2005;
select * from recent_films;