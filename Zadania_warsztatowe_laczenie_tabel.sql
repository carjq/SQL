# INNNER JOIN
#28 Wyświetl wszystkie dane produktu oraz dane firmy, która go dostarcza.
select *
from products join suppliers 
on suppliers.id = products.supplier_ids;

#29 Wyświetl nazwę produktu i nazwę firmy, która go dostarcza. Posortuj po nazwie firmy od A do Z.
select product_name, company 
from products join suppliers 
on suppliers.id = products.supplier_ids
order by company;

#30 Wyświetl dane klientów (imie, nazwisko, adres, miasto, kraj), którzy nie dokonali jeszcze płatności za zamówienie.
SELECT first_name, last_name, address, city, country_region
from customers inner join orders
on customers.id = orders.customer_id
where paid_date = NULL;

# LEFT JOIN
#31 Przygotuj raport, który zawiera wszystkie dane o zamówieniach i firmach, które dostarczają dane zamówienie. Raport powinien zawierać wszystkie zamówienia wraz z tymi bez określonego jeszcze dostawcy.
Select * 
from orders left join shippers
on orders.shipper_id = shippers.id;

#32 Zweryfkikuj czy wszyscy klienci złożyli już zamówienie. Wyswietl nazwy wszystkich klientów wraz z datą zamówienia i datą dostawy zamówienia. 
Select first_name, last_name, order_date, shipped_date
from customers left join orders
on customers.id = orders.customer_id;


#33 Zweryfikuj dla księgowości czy wszystkie faktury zostały już opłacone. Przygotuj raport zawierający kolumny 'Data faktury' i 'Data płatności'.
select invoice_date as Data_faktury, paid_date as Data_platnosci
from invoices left join orders 
on invoices.order_id = orders.id
where paid_date is null;

# RIGHT JOIN ()
#34 Dyrekcja prosi o przygotowanie raportu, który wykaże, czy wszyscy pracownicy składali zamówienia. Raport powienien zawierać datę zamówienia, nazwisko pracowanik i jego stanowisko pracy. Ilu pracowników nie złożyło zamówienia?
select order_date, last_name, job_title
from orders right join employees
on orders.employee_id = employees.id
where order_date is null;

#35 Przygotuj zestawienie, które będzie zawierało dane: nazwa klienta, data zawmówieniam i data dostawy.
select company, order_date, shipped_date
from orders right join customers
on orders.customer_id = customers.id;

#36 Zweryfikuj dla księgowości czy wszystkie faktury zostały wystawione. Przygotuj raport zawierający zamówienie bez wystawionej faktury kolumny 'Forma płatności', 'Data płatności' i 'Data faktury'.
select payment_type as Forma_platnosci, paid_date as Data_platnosci, invoice_date as data_faktury
from invoices right join orders
on invoices.order_id = orders.id
where invoice_date = NULL;