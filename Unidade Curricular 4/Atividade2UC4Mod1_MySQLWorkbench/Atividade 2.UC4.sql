-- 1. Crie um stored procedure que receba id de cliente, data inicial e data final e que mostre a lista de compras realizadas pelo referido cliente entre as datas informadas (incluindo essas datas), 
-- mostrando nome do cliente, id da compra, total, nome e quantidade de cada produto comprado. No script, inclua o código de criação e uma chamada ao procedure. --

DELIMITER //
CREATE PROCEDURE compra_data(id_cliente int, data_inicial date, data_final date)
BEGIN
    
    select c.nome as nome_cliente, date(v.data), v.id as id_compra, iv.nome_produto, v.valor_total as total, iv.quantidade from cliente as c join 
    venda as v join item_venda as iv on v.id = iv.venda_id on c.id = v.cliente_id where c.id = id_cliente and date(v.data) between data_inicial and data_final; 
END//
DELIMITER ;
    
	

call compra_data(50, '2018-01-01', '2019-01-08');



-- 2. Crie uma stored function que receba id de funcionário, data inicial e data final e retorne a comissão total desse funcionário no período indicado. No script, 
-- inclua o código de criação e uma chamada à function.

Delimiter //
create function comissao_total(
id_funcionario int, data_inicial date, data_final date) returns decimal(25,2) deterministic
begin
	declare comissao_existente int;
    declare comissao_total decimal(25,2);
    select c.comissao into comissao_existente from cargo as c join funcionario as f on c.id = f.cargo_id where id_funcionario = f.id;
	if comissao_existente is null then
		return 0.00;
	else 
		select sum((comissao_existente/100)  * v.valor_total) into comissao_total from venda as v where id_funcionario = v.funcionario_id and date(v.data) between data_inicial and data_final;
        return comissao_total;
	end if;
end //

Delimiter ;

select comissao_total(5, '2018-01-01', '2025-01-01');


-- 3. Crie uma stored function que receba id de cliente e retorne se o cliente é “PREMIUM” ou “REGULAR”. Um cliente é “PREMIUM” se já realizou mais de R$ 10 mil em compras nos últimos dois anos. 
-- Um cliente é “REGULAR” se ao contrário. No script, inclua o código de criação e uma chamada à function.

DELIMITER //
CREATE function status_cliente(id_cliente int) returns varchar(25) deterministic
begin
	declare total_valor decimal(25,2);
    select sum(v.valor_total) into total_valor from venda as v where id_cliente = cliente_id and year(v.data) between 2019 and 2022;

    if total_valor > 10000 then
		return 'PREMIUM';
        
	else
		return 'REGULAR';
        
    end if;

end //

DELIMITER ;

select status_cliente(136);


-- 4 Crie um trigger que atue sobre a tabela “usuário” de modo que, ao incluir um novo usuário, aplique automaticamente MD5() à coluna “senha”
create table userCriptografado(
id int not null auto_increment primary key,
login varchar(50) not null,
senha varchar(200) not null);
  
DELIMITER //
CREATE trigger criptografar after insert
on usuario for each row 
begin
 insert into userCriptografado(login, senha) select login, MD5(senha) from usuario where login not in (select login from usercriptografado);
end //

DELIMITER ;

insert into usuario(login, senha, ultimo_login) values
('dev233', 'dsadasdas', '2022-01-10 10:00:00');



