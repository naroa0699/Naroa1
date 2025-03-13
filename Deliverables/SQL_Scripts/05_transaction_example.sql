use sakila;
Start transaction;
insert into rental (rental_date, inventory_id, customer_id, return_date, staff_id)
values (now(), 3, 5,null,1);

update inventory
set last_update = now()
where inventory_id = 3;

commit;
