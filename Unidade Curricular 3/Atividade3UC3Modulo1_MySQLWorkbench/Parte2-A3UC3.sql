-- Adicionando a coluna 'Em Atividade' na tabela médicos e alterando os medicos de ids 11 e 12 para inativos (S para ativo e N pra inativo) --
alter table medico add em_atividade char(1) not null default('S');
update medico set em_atividade = 'N' where id = 11 or id = 12;
-- ---------------------------------------------------------------------------------------------------------------------------------------- --

-- Alterando internações dos quartos tipo enfermaria para que a data da alta seja de 3 dias depois da internação --
update internacao set data_prev_alta = '2018-11-13', data_alta = '2018-11-13' where id = 5; 
update internacao set data_prev_alta = '2020-02-13', data_alta = '2020-02-13' where id = 7;
-- ------------------------------------------------------------------------------------------------------------- --

-- Excluindo as consultas e o ultimo convênio registrado --
update paciente set id_convenio = null, num_carteira_convenio = null, tempo_carencia = null where id_convenio = 4;
delete from consulta where id_convenio = 4;
delete from convenio where id = 4;
-- ---------------------------------------------------- --

