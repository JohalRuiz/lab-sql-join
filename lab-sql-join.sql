-- Lab | SQL Join

-- 1. List number of films per category.
use sakila;
select * from film;
select *, count(film_id) from film_category
group by category_id;

-- 2. Display the first and last names, as well as the address, of each staff member.
select first_name, last_name, email from staff;

-- 3. Display the total amount rung up by each staff member in August of 2005.
select staff_id, count(rental_id) from rental
where rental_date like '2005-08%'
group by staff_id;

-- 4. List each film and the number of actors who are listed for that film.
select * from film_actor;
select title, count(actor_id) from film_actor a 
join film f on a.film_id = f.film_id
group by a.film_id;

-- 5. Using the tables payment and customer and the JOIN command, list the total paid by each 
-- customer. List the customers alphabetically by last name.
select * from payment;
select * from customer;

select c.customer_id, c.last_name, sum(amount) from payment p
join customer c on p.customer_id = c.customer_id
group by p.customer_id
order by c.last_name;