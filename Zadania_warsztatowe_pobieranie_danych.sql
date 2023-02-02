#Zadania

# SELECT / WHERE
#1 Wyświetl wszystkie dane o pracownikach, którzy mieszkają w Redmond.
SELECT * FROM employees 
WHERE city = 'Redmond';
#2 Wyświetl kod i nazwę wszystkich produktów, które nie należą do kategorii: Napoje.
SELECT product_code, product_name FROM products 
WHERE category != 'Beverages';
#3 Wyświetl wszystkie dane produktów, których koszt zakupu jest większy niż 12.0000.
SELECT * FROM products
WHERE standard_cost > 12.0000;
#4 Wyświetl miasto, adres dostawy i opłatę za przewóz zamówienia, którego opłata za przewóz mieści się w przedziale 20.0000 a 78.1223.
SELECT ship_city, ship_address, shipping_fee FROM orders
WHERE shipping_fee between 20.0000 and 78.1223;
#5 Wyświetl wszystkie informacje o produktach, które mają określona minimalną liczbę zawmówienia.
SELECT * FROM products
WHERE minimum_reorder_quantity != NULL;
#6 Wyświetl wszystkie informacje o produktach, które mają określona minimalną liczbę zawmówienia i ich koszt jest mniejszy niż 10.0000.
SELECT * FROM products
WHERE minimum_reorder_quantity != NULL and standard_cost < 10.0000;
#7 Wyświetl imię, nazwisko i miasto zamieszkania pracowników, kórych miasto zamieszkania kończy się na nd.
select first_name, last_name, city from employees where city like '%nd';
#8 Wyświetl imię, nazwisko i miasto zamieszkania pracowników, kórych miasto zamieszkania kończy się na nd i jest nie jest to Redmond.
select first_name, last_name, city from employees where city like '%nd' and city != "Redmond";
#9 Wyświetl informacje o klientach, którzy nie są menadżerami.
SELECT * FROM customers where job_title not like '%Manager';
#10 Wyświetl informacje o klientach, których imie zaczyna się na J lub nazwisko zawiera literę o i są menadżerami.
SELECT * FROM customers where (first_name like 'J%' or last_name like '%o%') like '%Manager';

#11 Wyświetl informacje o produktach, których id dostawcy równa się 4 lub 6 lub 7
Select * FROM products where supplier_ids = 4 or 6 or 7 ;

# ORDER BY
#12 Wyświetl imię, nazwisko i miasto zamieszkania pracowników, kórych miasto zamieszkania kończy się na nd i nie jest to Redmond. Wyniki posrtuj od Z do A względem imienia.
select first_name, last_name, city from employees where city = 'Redmond' order by frist_name desc;

#13 Zaprezentuj wszytkie produkty posortowe od najmniejszej ceny zakupu (standard_cost).
SELECT * FROM products order by standard_cost asc;
#14 Zaprezentuj wszytkie produkty posortowe od najmniejszej ceny zakupu (standard_cost) i największej ceny sprzedaży (list_price).
SELECT * FROM products order by standard_cost asc, list_price desc;

# DISTINCT
#15 Podaj listę zawodów (nie mogą się powtarzać), jakie posiadają nasi klienci.
select distinct job_title from customers;
#16 Wyświetl listę kategorii produktów, które posiadamy w bazie. Posortuj po nazwie kategorii malejąco.
select distinct category from products order by category desc;

# AS
#17 Zaprezentuj raport dla dyrekcji, który będzie zawierał następujące kolumny: Imie_Pracownika, Nazwisko_Pracowanika, Miasto. Na raporcie umieść tylko pracowników z Seattle.
SELECT first_name AS Imie_Pracownika, last_name AS Nazwisko_Pracownika, city AS Miasto FROM employees;
#18 Przedstaw przełożonemu raport, który będzie zawierała miasto, adres dostawy i opłatę za przewóz zamówienia, którego opłata za przewóz mieści się w przedziale 19.1256 a 78.1999.
select ship_city as maisto, ship_address as adres_dostawy, shipping_fee as oplata_za_przewoz from orders where shipping_fee between 19.1256 and 78.1999;

# COUNT()
#19 Zlicz liczbę wszytstkich zamówień.
select count(*) from orders;
#20 Zlicz liczbę wszystkich zamówień opłaconych kartami kredytowymi.
select count(*) from orders where payment_type = 'Credit Card';

#21 Zlicz liczbę wszystkich nieopłaconych zamówień.
select count(*) from orders where paid_date is NULL;

# MAX() / MIN() / AVG() / SUM()
#22 Wyświetl maksymalną opłatę za transport zamówienia.
SELECT MAX(shipping_fee) FROM orders;
#23 Jaki jest najtańszy produkt kupiony od dostawy o id = 10.
select min(standard_cost) from products where supplier_ids =1;
#24 Ile wynosi średnia opłata za przesyłkę w założonych zamówieniach, uwzględniając tylko opłatę większą niz 0.
select avg (shipping_fee) from orders where shipping_fee > 0;
#25 Ile łącznie zamówiono produktu Northwind Traders Coffee (id=43)
select count(id) from  order_details where id =43;

# GROUP BY()
#26 Wyświetl minimalny koszt produktu w danej kategorii.
select category, min(list_price) from products group by category;

#27 Wskaż jakie zawody wykonują klienci oraz ile osób zadeklarowało dany zawód.
select job_title, count(id) from customers group by job_title;
