
-- JOINS

INSERT INTO branch VALUES(4, 'Buffalo', NULL, NULL)

-- Encontrar as unidades e seus gerentes --

SELECT employee.employee_id, employee.first_name, branch.branch_name
FROM employee
JOIN branch
ON employee.employee_id = branch.manager_id;

-- Mostrar todas as colunas da tabela da direita (branch), msm sem correspondência na segunda

SELECT employee.employee_id, employee.first_name, branch.branch_name
FROM employee
RIGHT JOIN branch
ON employee.employee_id = branch.manager_id;

-- Mostrar todas as colunas da tabela da esquerda, msm sem correspondência na segunda (employee)


SELECT employee.employee_id, employee.first_name, branch.branch_name
FROM employee
LEFT JOIN branch
ON employee.employee_id = branch.manager_id;


-- UNION

-- Gerar uma lista de empregador com seus respectivos branchs

SELECT first_name AS company_names
FROM employee
UNION
SELECT branch_name
FROM branch
UNION 
SELECT client_name
FROM client;

-- Gerar uma lista de todos os clientes e nomes de fornecedores

SELECT client_name, client.branch_id
FROM client
UNION
SELECT supplier_name, branch_supplier.branch_id
FROM branch_supplier;


-- Gerar lista com todo o faturamento e os custos por compra

SELECT salary 
FROM employee
UNION 
SELECT total_sales
FROM works_with;


-- WILD CARDS

-- Encontrar qualquer cliente que tenha LLC no nome 

SELECT *
FROM client
WHERE client_name LIKE '%LLC';

-- Econtrar qualquer fornecedor que tenha Label no nome

SELECT *
FROM branch_supplier
WHERE supplier_name LIKE '%Labels%'

-- Encontrar funcionários que nasceram em fevereiro

SELECT * 
FROM employee
WHERE birth_day LIKE '____-02%';

-- % representa um número qualquer de caracteres
-- _(underline) representa um único caractere


-- Encontrar clientes que são escolas

SELECT *
FROM client
WHERE client_name LIKE '%school';
