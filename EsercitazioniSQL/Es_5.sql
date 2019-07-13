use foodmart;

/* Es. 5.1 */

select * 
from sales_fact_1998 as sf 
where sf.store_cost > sf.store_sales;

/* 5.2 */

select pr.promotion_id, pr.promotion_name, sum((sf.store_sales - sf.store_cost)*sf.unit_sales) as tot_guadagno
from sales_fact_1998 as sf join promotion as pr on
(sf.promotion_id = pr.promotion_id)
group by pr.promotion_id
order by tot_guadagno desc;

/* 5.3 */

select p.product_id, p.product_name, sum(sf.store_sales*sf.unit_sales) as tot_ricavo, sum(sf.store_cost*sf.unit_sales) as tot_cost,
(sum(sf.store_sales*sf.unit_sales)- sum(sf.store_cost*sf.unit_sales))/sum(sf.store_sales*sf.unit_sales) as margine
from sales_fact_1998 as sf join product as p on
(sf.product_id = p.product_id)
group by p.product_id
order by margine desc;

/* Es. 5.4 */

select pc.product_category, sum(sf.store_sales*sf.unit_sales) as tot_ricavo, sum(sf.store_cost*sf.unit_sales) as tot_cost,
(sum(sf.store_sales*sf.unit_sales)- sum(sf.store_cost*sf.unit_sales))/sum(sf.store_sales*sf.unit_sales) as margine
from sales_fact_1998 as sf join product as p join product_class as pc on
(sf.product_id = p.product_id
and p.product_class_id = pc.product_class_id)
group by pc.product_category
order by margine desc;

/* Es. 5.5 */

select pc.product_department, (sum(sf.store_sales*sf.unit_sales) - sum(sf.store_cost*sf.unit_sales))/sum(sf.store_sales*sf.unit_sales) as margine
from sales_fact_1998 as sf join product as p join product_class as pc on
(sf.product_id = p.product_id
and p.product_class_id = pc.product_class_id)
group by pc.product_department
order by margine desc;

/* Es. 5.6 */

select pc.product_department, (sum(sf.store_sales*sf.unit_sales) - sum(sf.store_cost*sf.unit_sales))/sum(sf.store_sales*sf.unit_sales) as margine
from sales_fact_1998 as sf join product as p join product_class as pc on
(sf.product_id = p.product_id
and p.product_class_id = pc.product_class_id)
group by pc.product_department
having margine > 0.6
order by margine desc;

/* Es. 5.7 */

/*a*/

select s.store_id, sum(sf.store_sales * sf.unit_sales) as tot_ricavo
from sales_fact_1998 as sf join product as p join product_class as pc join store as s on
(sf.product_id = p.product_id
and p.product_class_id = pc.product_class_id
and sf.store_id = s.store_id)
where pc.product_department = 'Canned Products'
group by s.store_id
order by s.store_id;

/*b*/

select s.store_id, sum(sf.store_sales * sf.unit_sales) as tot_ricavo
from sales_fact_1998 as sf join product as p join product_class as pc join store as s on
(sf.product_id = p.product_id
and p.product_class_id = pc.product_class_id
and sf.store_id = s.store_id)
where pc.product_department = 'Meat'
group by s.store_id
order by s.store_id;

/*c*/

select meat.store_id, meat.tot_ricavo, cp.tot_ricavo, meat.tot_ricavo/cp.tot_ricavo
from 
( select s.store_id, sum(sf.store_sales * sf.unit_sales) as tot_ricavo
from sales_fact_1998 as sf join product as p join product_class as pc join store as s on
(sf.product_id = p.product_id
and p.product_class_id = pc.product_class_id
and sf.store_id = s.store_id)
where pc.product_department = 'Canned Products'
group by s.store_id)
as cp,  
(select s.store_id, sum(sf.store_sales * sf.unit_sales) as tot_ricavo
from sales_fact_1998 as sf join product as p join product_class as pc join store as s on
(sf.product_id = p.product_id
and p.product_class_id = pc.product_class_id
and sf.store_id = s.store_id)
where pc.product_department = 'Meat'
group by s.store_id) as meat
where meat.store_id = cp.store_id;

/* Es. 5.8 */

select s.store_state, s.store_country, sum(sf.store_sales*sf.unit_sales) as tot_ricavo
from sales_fact_1998 as sf join store as s on
(sf.store_id = s.store_id)
group by s.store_state
order by tot_ricavo desc;

/* Es. 5.9 */

select p.product_id, p.product_name, sum((sf.store_sales - sf.store_cost)*sf.unit_sales) as guadagno
from sales_fact_1998 as sf join product as p on
(sf.product_id = p.product_id)
group by p.product_id
order by guadagno desc; 

/* 5.10 */

create view g as 
select s.store_id, sum((sf.store_sales - sf.store_cost)*sf.unit_sales) as guadagno
from sales_fact_1998 as sf join store as s on
(sf.store_id = s.store_id)
where s.store_type = 'Supermarket'
group by s.store_id; 

create view  v as
select s.store_id, sum(sf.unit_sales) as quantita
from sales_fact_1998 as sf join store as s on
(sf.store_id = s.store_id)
where s.store_type = 'Supermarket'
group by s.store_id;

select g.store_id, g.guadagno, v.quantita, g.guadagno/v.quantita
from g join v on
(g.store_id = v.store_id)
order by g.guadagno/v.quantita desc;

/* Es. 5.11 */

select c.member_card, sum((sf.store_sales - sf.store_cost)*sf.unit_sales)
from sales_fact_1998 as sf join customer as c on
(sf.customer_id =c.customer_id)
group by c.member_card; 

/* Es. 5.12 */

/*a*/

select s.store_id, s.store_type, pc.product_department,
(sum(sf.store_sales*sf.unit_sales)-sum(sf.store_cost*sf.unit_sales))/sum(sf.store_sales*sf.unit_sales) as margine
from sales_fact_1998 as sf join store as s join product as p join product_class as pc on
(sf.store_id = s.store_id
and sf.product_id = p.product_id
and p.product_class_id = pc.product_class_id)
group by s.store_id, pc.product_department;

/*b*/

select s.store_type, pc.product_department,
(sum(sf.store_sales*sf.unit_sales)-sum(sf.store_cost*sf.unit_sales))/sum(sf.store_sales*sf.unit_sales) as margine
from sales_fact_1998 as sf join store as s join product as p join product_class as pc on
(sf.store_id = s.store_id
and sf.product_id = p.product_id
and p.product_class_id = pc.product_class_id)
group by s.store_type, pc.product_department;

/*c*/

drop view st;

create view st as
select s.store_id, s.store_type, pc.product_department,
(sum(sf.store_sales*sf.unit_sales)-sum(sf.store_cost*sf.unit_sales))/sum(sf.store_sales*sf.unit_sales) as margine
from sales_fact_1998 as sf join store as s join product as p join product_class as pc on
(sf.store_id = s.store_id
and sf.product_id = p.product_id
and p.product_class_id = pc.product_class_id)
group by s.store_id, pc.product_department;

drop view t;

create view t as
select s.store_type, pc.product_department,
(sum(sf.store_sales*sf.unit_sales)-sum(sf.store_cost*sf.unit_sales))/sum(sf.store_sales*sf.unit_sales) as margine
from sales_fact_1998 as sf join store as s join product as p join product_class as pc on
(sf.store_id = s.store_id
and sf.product_id = p.product_id
and p.product_class_id = pc.product_class_id)
group by s.store_type, pc.product_department;

select st.store_id, st.store_type, t.product_department, st.margine,  t.margine
from st join t on
(st.store_type = t.store_type
and st.product_department = t.product_department)
where st.margine <= (t.margine - 0.04*t.margine);


