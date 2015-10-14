1- Mostrar nome da cidade e soma do total de todos os pedidos(invoices.total) esfetuado na mesma, quando a soma total for maior que R$ 25.000,00*/

select distinct customers.city, sum(invoices.total)
from customers
join invoices on (customers.id = invoices.customer_id)
join items on (invoices.id   = items.invoice_id)
group by customers.city
having sum(invoices.total) > 25000

/*2-Listar sobrenome(last_name) e quantidade de pessoas com cada sobrenome.*/

select distinct CUSTOMERS.LAST_NAME, count(*)
from CUSTOMERS
group by CUSTOMERS.LAST_NAME
having count(*) > 1

/*3-Listar os nome de produtos repetidos, e quantas vezes se repetem.*/

select products.name, count(*)
from products
group by products.name
having count(*) > 1

/*4-Criar uma View chamada 'product_by_customers' que mostra a quantidade total(SUM(items.quantity)) de produtos que cada cliente comprou.*/

create view product_by_customers (
cliente,
Quntidade)
as
select (customers.first_name || ' ' || customers.last_name) as name, SUM(items.quantity)
from customers
join invoices on(customers.id = invoices.customer_id)
join items on(invoices.id = items.invoice_id)
group by name

/*5-Listar os produtos e seu respectivo valor unitário médio de venda(AVG(items.cost)) ordenando alfabeticamente.*/

select PRODUCTS.NAME, avg(ITEMS.COST)
from PRODUCTS
join ITEMS on (ITEMS.PRODUCT_ID = PRODUCTS.ID)
group by PRODUCTS.NAME
order by PRODUCTS.NAME  

/*6-Crie uma view que mostre o ticket médio de compras por cliente.*/

create view ticket_by_customer (
cliente,
Quntidade)
as
select (customers.first_name || ' ' || customers.last_name) as name, avg(invoices.total)
from customers
join invoices on(customers.id = invoices.customer_id)
group by name
