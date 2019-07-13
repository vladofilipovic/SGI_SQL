use foodstore;

/* Es. 3.1*/

select fname, count(*)
from customer as c
where c.fname = 'Charles'
	or c.fname = 'Patricia'
    or c.fname = 'Sharon'
group by fname;

select fname, count(*)
from customer
where fname in ('Charles', 'Patricia', 'Sharon')
group by fname;

/* Es. 3.2 */

select mc.description, count(*)
from member_card as mc join customer as c on
(c.card_type_id = mc.card_type_id) 
group by mc.description;

/* Es. 3.3 */

select b.*, c.fname, c.lname
from bill as b join customer as c on
(b.customer_id = c.customer_id)
where (c.fname = 'Clyde' and c.lname = 'Dixon')
or (c.fname = 'Bonnie' and c.lname = 'Emerson')
group by b.bill_id
order by c.lname;

select c.fname, c.lname, c.customer_id, count(*) as n_bills
from bill as b join customer as c on
(b.customer_id =c.customer_id)
where (c.fname = 'Clyde' and c.lname = 'Dixon')
or (c.fname = 'Bonnie' and c.lname = 'Emerson')
group by c.customer_id
order by c.lname;

/* Es. 3.4 */

select fname,lname
from customer as c join bill as b on
(c.customer_id = b.customer_id)
where b.total > 307
order by lname, fname;

/* Es. 3.5 */

select c.lname, c.fname 
from customer as c join bill as b join item_in_bill as ib join product as p on
(c.customer_id = b.customer_id
and b.bill_id = ib.bill_id
and ib.product_id = p.product_id)
where p.product_name = 'Great Muffins'
group by c.lname, c.fname
order by c.lname, c.fname;  

/* Es. 3.6 */

select c.lname, c.fname, p.product_name
from customer as c join bill as b join product as p join item_in_bill as ib join supplier as s on
(c.customer_id = b.customer_id
and b.bill_id = ib.bill_id
and ib.product_id =p.product_id
and p.supplier_id = s.supplier_id)
where s.name = 'Bravo'
order by c.lname, c.fname;

/* Es. 3.7 */

select p.product_name, sum(ib.quantity) 
from item_in_bill as ib join product as p on
(ib.product_id = p.product_id)
where p.product_id < 20
group by p.product_name 
order by sum(ib.quantity) desc;

/* Es. 3.8 */

select pc.product_class_id, pc.product_subcategory, sum(ib.quantity) as total_quantity
from product_class as pc join product as p join item_in_bill as ib join bill as b   on
(b.bill_id = ib.bill_id 
and ib.product_id = p.product_id
and p.product_class_id = pc.product_class_id)
group by pc.product_class_id, pc.product_subcategory
order by total_quantity desc;


select pc.product_class_id, pc.product_subcategory, sum(ib.quantity*ib.price) as total_ricavo
from product_class as pc join product as p join item_in_bill as ib join bill as b   on
(b.bill_id = ib.bill_id 
and ib.product_id = p.product_id
and p.product_class_id = pc.product_class_id)
group by pc.product_class_id, pc.product_subcategory
order by total_ricavo desc;

select pc.product_class_id, pc.product_subcategory, sum(ib.quantity*ib.price) as total_ricavo
from product_class as pc join product as p join item_in_bill as ib on
(ib.product_id = p.product_id
and p.product_class_id = pc.product_class_id)
group by pc.product_class_id, pc.product_subcategory
order by total_ricavo desc;

/* Es. 3.9 */

select mc.description, p.product_name, sum(ib.quantity) as total_quantity
from member_card as mc join customer as c join product as p join item_in_bill as ib join bill as b on
(mc.card_type_id = c.card_type_id
and c.customer_id = b.customer_id
and b.bill_id = ib.bill_id
and ib.product_id = p.product_id)
group by p.product_name, mc.description
order by p.product_name;



