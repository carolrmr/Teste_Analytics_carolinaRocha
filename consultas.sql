--Criando tabela produtos:

CREATE TABLE public.produtos (
	id serial4 NOT NULL,
	"data" date NOT NULL,
	produto varchar(255) NULL,
	categoria varchar(100) NULL,
	quantidade int4 NOT NULL,
	preco numeric(10, 2) NULL,
	CONSTRAINT produtos_pkey PRIMARY KEY (id)
);

--Depois de rodar meu script python para fazer a carga de dados, vamos validar as informações no banco:

select * from produtos;

select count(*) from produtos;

-- A consulta faz a soma total mais o preço medio unitario com o valor total das vendas:
 
select SUM(quantidade) AS quantidade_total, AVG(preco) AS preco_unitario, SUM(quantidade * preco) AS valor_total 
FROM produtos where produto = 'brinco luz';

-- Consulta o nome do produto e a quantidade vendida no periodo selecionado:

select produto, sum(quantidade) as total_vendido
from produtos where data between '2023-06-01' and '2023-06-30' group by produto order by total_vendido desc;

-- consulta referente ao mes de junho de 2024

select produto, sum(quantidade) as total_vendido
from produtos where data between '2024-06-01' and '2024-06-30' group by produto order by total_vendido desc;



--Limpando a tabela produtos para validar minhas cargas de dados:

truncate table produtos;
