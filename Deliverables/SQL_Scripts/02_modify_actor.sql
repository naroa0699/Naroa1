use sakila;
insert into actor (first_name,last_name) values ('Naroa','Marco');
update actor set last_name = 'Torres' where actor_id=1;
delete from film_actor where actor_id=10;
delete from actor where actor_id=10;