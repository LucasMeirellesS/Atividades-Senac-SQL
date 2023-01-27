/***
consulta para um relatório de todas as vendas pagas em dinheiro. 
Necessários para o relatório data da venda, valor total; produtos vendidos, quantidade e valor unitário; nome do cliente, cpf e telefone.
Ordena-se pela data de venda, as mais recentes primeiro.
**/
-- Consulta 1
-- Antes da otimização:

EXPLAIN SELECT * FROM venda v, item_venda iv, produto p, cliente c, funcionario f
WHERE v.id = iv.venda_id AND c.id = v.cliente_id AND p.id = iv.produto_id AND f.id = v.funcionario_id and tipo_pagamento = 'D';
 
SELECT * FROM venda v, item_venda iv, produto p, cliente c, funcionario f
WHERE v.id = iv.venda_id AND c.id = v.cliente_id AND p.id = iv.produto_id AND f.id = v.funcionario_id and tipo_pagamento = 'D';

 -- Depois da otimização:
 
create index idx_data on venda(data);
create index idx_tpagamento on venda(tipo_pagamento);

select v.data, v.valor_total,iv.nome_produto, iv.quantidade, iv.valor_unitario, c.nome, c.cpf, c.telefone from venda v join item_venda iv
join cliente c on c.id = v.cliente_id and v.id = iv.venda_id where v.tipo_pagamento = 'D' order by v.data desc;


explain select v.data, v.valor_total,iv.nome_produto, iv.quantidade, iv.valor_unitario, c.nome, c.cpf, c.telefone from venda v join item_venda iv
join cliente c on c.id = v.cliente_id and v.id = iv.venda_id where v.tipo_pagamento = 'D' order by v.data desc;

create view consulta1 as select v.data, v.valor_total,iv.nome_produto, iv.quantidade, iv.valor_unitario, c.nome, c.cpf, c.telefone from venda v join item_venda iv
join cliente c on c.id = v.cliente_id and v.id = iv.venda_id where v.tipo_pagamento = 'D' order by v.data desc;

select * from consulta1;

/***
consulta para encontrar todas as vendas de produtos de um dado fabricante
Mostrar dados do produto, quantidade vendida, data da venda.
Ordena-se pelo nome do produto.
***/
-- Consulta 2 
-- Antes das otimizações
SELECT * 
FROM produto p, item_venda iv, venda v
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND p.fabricante like '%lar%';

explain SELECT * 
FROM produto p, item_venda iv, venda v
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND p.fabricante like '%lar%';

-- Depois das otimizações

create index idx_fabricante on produto(fabricante);

select p.nome, p.descricao, p.fabricante, iv.quantidade, v.data from produto p join item_venda iv join venda v 
on p.id = iv.produto_id AND v.id = iv.venda_id where p.fabricante = 'Ultralar' order by v.data;

explain select p.nome, p.descricao, p.fabricante, iv.quantidade, v.data from produto p join item_venda iv join venda v 
on p.id = iv.produto_id AND v.id = iv.venda_id where p.fabricante = 'Ultralar' order by v.data;

create view consulta2 as select p.nome, p.descricao, p.fabricante, iv.quantidade, v.data from produto p join item_venda iv join venda v 
on p.id = iv.produto_id AND v.id = iv.venda_id where p.fabricante = 'Ultralar' order by v.data;

select * from consulta2;

-- extra
delimiter //
create procedure consulta2(nome_fab varchar(255))
begin 
select p.nome, p.descricao, p.fabricante, iv.quantidade, v.data from produto p join item_venda iv join venda v 
on p.id = iv.produto_id AND v.id = iv.venda_id where p.fabricante = nome_fab order by v.data;
end //
delimiter ;

call consulta2('Ultralar');

/***
Relatório de vendas de produto por cliente.
Mostrar dados do cliente, dados do produto e valor e quantidade totais de venda ao cliente de cada produto.
*/
-- Consulta 3
-- Antes da otimização
SELECT SUM(iv.subtotal), SUM(iv.quantidade)
FROM produto p, item_venda iv, venda v, cliente c
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND c.id = v.cliente_id /*f.id = v.funcionario_id*/
GROUP BY c.nome, p.nome;

EXPLAIN SELECT SUM(iv.subtotal), SUM(iv.quantidade)
FROM produto p, item_venda iv, venda v, cliente c
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND c.id = v.cliente_id /*f.id = v.funcionario_id*/
GROUP BY c.nome, p.nome;

-- Depois da otimização
create index idx_clientenome on cliente(nome);
create index idx_produto on produto(nome);

select c.nome as cliente, c.cpf, c.endereco, c.telefone, p.nome as produto, p.descricao as descricao_produto, sum(iv.quantidade), sum(iv.subtotal)
from cliente c join item_venda iv join venda v join produto p on c.id = v.cliente_id and v.id = iv.venda_id and p.id = iv.produto_id group by c.nome, p.nome order by c.nome;

explain select c.nome as cliente, c.cpf, c.endereco, c.telefone, p.nome as produto, p.descricao as descricao_produto, sum(iv.quantidade), sum(iv.subtotal)
from cliente c join item_venda iv join venda v join produto p on c.id = v.cliente_id and v.id = iv.venda_id and p.id = iv.produto_id group by c.nome, p.nome order by c.nome;

create view consulta3 as select c.nome as cliente, c.cpf, c.endereco, c.telefone, p.nome as produto, p.descricao as descricao_produto, sum(iv.quantidade), sum(iv.subtotal)
from cliente c join item_venda iv join venda v join produto p on c.id = v.cliente_id and v.id = iv.venda_id and p.id = iv.produto_id group by c.nome, p.nome order by c.nome;

select * from consulta3;
