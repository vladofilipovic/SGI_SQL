use librerie;

/* Es. 2.1 */

select *
from formato;

select *
from autori;

select *
from editori;

select *
from libri;

select *
from negozi;

select *
from scorte;

/* Es. 2.3 */

select *
from libri;

/* Es. 2.4 */

select titolo, tipo, prezzo
from libri; 

/* Es 2.5 */

select titolo, prezzo 
from libri
where prezzo < 10.00; 

/* Es. 2.6 */

select *
from libri
where tipo = 'CS'; 

/* Es 2.7 */

select *
from libri
where tipo = 'CS'
	or tipo = 'FIC'; 
    
/* Es 2.8 */

select titolo, nome
from libri as l, editori as e
where l.codice_editore = e.codice;    

select titolo, nome
from libri as l join editori as e on
(l.codice_editore = e.codice);

select titolo, nome
from libri as l, editori as e;

/* Es 2.9 */

select titolo, prezzo, descrizione
from libri as l, formato as f
where l.cod_format = f.codice; 

select titolo, prezzo, descrizione
from libri as l join formato as f on
(l.cod_format = f.codice);

/* Es 2.10 */

select titolo, cognome
from libri as l, hascritto as h, autori as a
where l.codice =h.codice_libro
	and h.codice_autore = a.codice_autore; 
    
select titolo, cognome
from libri join hascritto join autori on
	(libri.codice = hascritto.codice_libro and
    hascritto.codice_autore = autori.codice_autore); 
    
/* Es 2.11 */

select titolo, cognome
from libri as l, hascritto as h, autori as a
where l.codice = h.codice_libro
	and h.codice_autore = a.codice_autore
    and a.cognome = 'kafka';
    
select titolo, cognome
from libri join hascritto join autori on
	(libri.codice = hascritto.codice_libro and
    hascritto.codice_autore = autori.codice_autore)
where autori.cognome = 'kafka';

/* Es 2.12 */

select titolo, cognome
from libri as l, hascritto as h, autori as a
where l.codice = h.codice_libro
	and h.codice_autore = a.codice_autore
    and (a.cognome = 'kafka'
    or (a.cognome = 'christie' and a.nome = 'agatha'));
    
select titolo, cognome
from libri join hascritto join autori on
	(libri.codice = hascritto.codice_libro and
    hascritto.codice_autore = autori.codice_autore)
where autori.cognome = 'kafka'
or (autori.cognome = 'christie' and autori.nome = 'agatha');

/* 2.13 */

select nome, sede
from libri as l, negozi as n, scorte as s
where l.codice = s.codice_libro
and s.codice_negozio = n.codice_negozio
and l.titolo = 'dBASE Programming';

select nome, sede
from libri as l join negozi as n join scorte as s on
(l.codice = s.codice_libro
and s.codice_negozio = n.codice_negozio)
where l.titolo = 'dBASE Programming'; 