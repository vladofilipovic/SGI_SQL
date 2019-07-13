use interrogatorio;

/*Es 1.1 */
select *
from dati
order by cognome;

/*Es 1.2 */
select * 
from dati
where partenza = '10:50:00' 
order by cognome; 

select * 
from dati 
where capelli = 'biondi' 
order by cognome;

select *
from dati
where misurascarpe = 44;

select *
from dati
where partenza = '10:50:00' and capelli = 'biondi'
order by cognome; 

select *
from dati
where partenza = '10:50:00' 
	and capelli = 'biondi'
    and misurascarpe = 44;

/* Es 1.3 */

select *
from dati
where partenza = '08:10:00'
	and capelli = 'neri';
    
select *
from dati
where capelli = 'neri'
	and ritorno = '19:05:00';

select *
from dati
where capelli = 'biondi' 
	and cognome = 'Agostini';
    
/* Es 1.4 */

select *
from dati
where partenza < '15.30.00' 
	and capelli = 'castani';

select *
from dati
where partenza < '15.30.00' 
	and capelli = 'castani'
    and data = '2001-07-07';
	
select *
from dati
where partenza < '15.30.00' 
	and capelli = 'castani'
    and data = '2001-07-07'
    and misurascarpe = 40;

/* Es 1.5 */ 

select *
from dati
where partenza = '09:30:00'
	and data = '2001-07-07'
    and (capelli = 'rossi' or capelli = 'castani')
    and misurascarpe > 36
    and ritorno = '19:30:00';




