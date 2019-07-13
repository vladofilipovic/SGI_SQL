use foodmart;

/* Es. 4.1*/ 

select p.product_id, p.product_name, tbd.the_date
from product as p join sales_fact_1998 as sf join time_by_day as tbd on
(p.product_id = sf.product_id
and sf.time_id = tbd.time_id)
order by tbd.the_date, p.product_name; 

/* Es. 4.2 */

select time_id, product_id, sum((store_sales - store_cost)*unit_sales) as guadagno
from sales_fact_1998
group by product_id, time_id
order by time_id, product_id; 

/* Es. 4.3*/

select p.product_id, p.product_name 
from sales_fact_1998 as sf join product as p on
(sf.product_id = p.product_id)
group by p.product_name, p.product_id
order by p.product_name;

/* Es. 4.4*/ 

select p.product_id, p.product_name, sum(store_cost*unit_sales) as totale_costi_acquisto
from sales_fact_1998 as sf join product as p on
(sf.product_id =p.product_id)
group by p.product_id, p.product_name
order by p.product_id;

/* Es. 4.5*/ 

select p.product_id, p.product_name, sum((store_sales- store_cost)*unit_sales) as totale_guadagno
from sales_fact_1998 as sf join product as p on
(sf.product_id = p.product_id)
group by p.product_id
order by p.product_id;

/* Es. 4.6*/
 
select p.product_id, p.product_name, sum((store_sales- store_cost)*unit_sales) as totale_guadagno
from sales_fact_1998 as sf join product as p on
(sf.product_id = p.product_id)
group by p.product_id
order by totale_guadagno desc;

/* Es. 4.7*/

select s.store_id, s.store_name, sum(sf.unit_sales) as totale_quantita
from sales_fact_1998 as sf join store as s on
(sf.store_id = s.store_id)
group by s.store_id
order by totale_quantita desc;

/* Es. 4.8*/

select s.store_id, s.store_name, sum(sf.unit_sales) as totale_quantita
from sales_fact_1998 as sf join store as s on
(sf.store_id = s.store_id)
group by s.store_id
order by totale_quantita;

/* Es. 4.9 */

select pc.product_category, sum((sf.store_sales - sf.store_cost)*unit_sales) as totale_guadagno
from sales_fact_1998 as sf join product as p join product_class as pc on
(sf.product_id = p.product_id
and p.product_class_id = pc.product_class_id)
group by pc.product_category
order by totale_guadagno desc;

/* Es. 4.10 */

select p.product_id, p.product_name, sum(sf.unit_sales) as quantita_totale
from sales_fact_1998 as sf join product as p join store as s join region as r on
(sf.product_id = p.product_id
and sf.store_id = s.store_id
and s.region_id =r.region_id)
where r.sales_region = 'Central West'
group by p.product_id, p.product_name
order by quantita_totale desc;  

/* Es. 4.11 */

select p.product_id, p.product_name, sum(sf.unit_sales) as quantita_totale
from sales_fact_1998 as sf join product as p join store as s join region as r on
(sf.product_id = p.product_id
and sf.store_id = s.store_id
and s.region_id =r.region_id)
where r.sales_country = 'USA'
group by p.product_id, p.product_name
order by quantita_totale desc; 

/* Es. 4.12 */

select sum((sf.store_sales - sf.store_cost)*sf.unit_sales) as tot_guadagno
from sales_fact_1998 as sf join time_by_day as tbd on
(sf.time_id = tbd.time_id)
where (tbd.the_month =  'April' or tbd.the_month = 'May');

/* Es. 4.13 */

select c.customer_id, c.lname, c.fname, sum(sf.store_sales * sf.unit_sales) as tot_spese
from sales_fact_1998 as sf join customer as c on
(sf.customer_id = c.customer_id)
group by c.customer_id
order by tot_spese;

/* Es. 4.14 */ 

select c.customer_id, c.lname, c.fname, sum(sf.store_sales * sf.unit_sales) as tot_spese
from sales_fact_1998 as sf join customer as c on
(sf.customer_id = c.customer_id)
group by c.customer_id
order by tot_spese desc;

/* Es. 4.15 */

select r.sales_city, sum(sf.store_sales*sf.unit_sales) as tot_incasso
from sales_fact_1998 as sf join store as s join region as r on
(sf.store_id = s.store_id
and s.region_id = r.region_id)
group by r.sales_city
order by tot_incasso desc;

/* Es. 4.16 */

select r.sales_region, sum((sf.store_sales - sf.store_cost)*sf.unit_sales) as tot_guadagno 
from sales_fact_1998 as sf join store as s join region as r on
(sf.store_id = s.store_id
and s.region_id = r.region_id)
group by r.sales_region
order by tot_guadagno desc;

