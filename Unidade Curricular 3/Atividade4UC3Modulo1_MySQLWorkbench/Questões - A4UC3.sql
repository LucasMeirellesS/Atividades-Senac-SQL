-- Todos os dados de consulta-- 
select * from consulta;

-- Dados de 2020 valor --
select * from consulta where year(DataHora) = 2020 group by id;

-- Valor médio das consultas do ano de 2020 --
select avg(valor) as media_valor_2020 from consulta where year(DataHora) = 2020;

-- Dados das consultas realizadas sob convênio --
select * from consulta where id_convenio is not null;

-- Valor médio das consultas sob convênio --
select avg(valor) as media_valorConvenio from consulta where id_convenio is not null;

-- Dados das consultas realizadas sob convênio em 2020 --
select * from consulta where year(DataHora) = 2020 and id_convenio is not null;

-- Valor médio das consultas realizadas sob convênio em 2020 --
select avg(valor) as media_valorConvenio_2020 from consulta where year(DataHora) = 2020 and id_convenio is not null;


-- 2 --
-- Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta. --
select * from internacao where data_alta > data_prev_alta;

-- 3 -- 
-- Receituário completo da primeira consulta registrada com receituário associado. --

-- Identificando a data da consulta mais antiga com receituário registrado --
select min(c.DataHora) from consulta c join receita r on c.id = r.id_consulta;

-- Dados consulta e receituário --
select * from consulta c join receita r on c.id = r.id_consulta where c.DataHora = '2019-05-24 11:10:00';

-- Dados apenas do Receituário --
select r.* from consulta c join receita r on c.id = r.id_consulta where c.DataHora = '2019-05-24 11:10:00';

-- 4 --
-- Todos os dados da consulta de maior valor e também da de menor valor (ambas as consultas não foram realizadas sob convênio). --

-- Dados da consulta com menor valor --
select min(valor) from consulta where id_convenio is null;
select * from consulta where id_convenio is null and valor = 75;

-- Dados da consulta com maior valor -- 
select max(valor) from consulta where id_convenio is null;
select * from consulta where id_convenio is null and valor = 150;

-- 5 --
-- Todos os dados das internações em seus respectivos quartos, calculando o total da internação a partir do valor de diária do quarto e o número de dias entre a entrada e a alta.
select i.*, q.tipo, tq.descricao, ((datediff(i.data_entrada, i.data_alta) * tq.valor_diaria)*-1) as total_valor 
from internacao i join quarto q join tipo_quarto tq on i.id_quarto = q.id and q.id_tipo_quarto = tq.id;

-- 6 --
-- Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”.
select i.data_entrada, i.procedimento, q.numero from internacao i join quarto q on i.id_quarto = q.id where q.tipo = 'Apartamento'; 

-- 7 --
-- Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos na data da consulta e cuja especialidade não seja “pediatria”, 
-- ordenando por data de realização da consulta. 

select p.nome, (year(now()) - year(p.data_nascimento)) as idade, c.DataHora, e.Descrição from paciente p join consulta c join especialidade e join medico_especialidade me on c.id_paciente = p.id 
and c.id_medicos_especilaidade = me.id and me.id_Especialidade = e.id where year(p.data_nascimento) > 2004 and e.Descrição <> 'pediatria';


-- 8 --
-- Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria”. --
select p.nome as nome_paciente, m.nome as nome_medico, i.data_entrada, i.procedimento from quarto q join tipo_quarto tq join internacao i join paciente p
join medico m join medico_especialidade me join especialidade e on q.id_tipo_quarto = tq.id and i.id_quarto = q.id and i.id_medico = m.id and i.id_paciente = p.id 
and me.id_medico = m.id and me.id_Especialidade = e.id and i.id_medico = m.id and i.id_paciente = p.id where me.id_Especialidade = 3 and q.tipo = 'enfermaria'; 

-- 9 --
-- Os nomes dos médicos, seus CRMs e a quantidade de consultas que cada um realizou --
select m.nome, m.CRM, count(c.id_medicos_especilaidade) from medico m join consulta c join medico_especialidade me on c.id_medicos_especilaidade = me.id and me.id_medico = m.id group by m.id;

-- 10 --
-- Os nomes, CREs e número de internações de enfermeiros que participaram de mais de uma internação. --
select e.id, e.nome, e.cre, count(r.id_enfermeiro) as internacoes_enfermeiro from enfermeiro as e 
join internacao as i join requer r on r.id_enfermeiro = e.id and r.id_internacao = i.id group by e.nome having count(r.id_enfermeiro) > 1;