-- ---------------------------------------------------------- --
-- inserindo em Tipo_quarto
-- ---------------------------------------------------------- --
insert into Tipo_quarto(id, descricao, valor_diaria) values
(1, 'Quarto com varanda e cama para acompanhante, banheiro, TV de tela plana com vídeo-game, frigobar, interfone para serviço de quarto entre outros', 180.00),
(2, 'Quarto com cama do paciente perto da janela para uma melhor refrescância, banheiro, TV com serviços de streaming e frigobar', 150.00),
(3, 'Quarto básico com sofá para visitas, televisão, banheiro, televisão e frigobar', 100.00),
(4, 'Quarto coletivo com camas para 3 pacientes', 80.00),
(5, 'Quarto com dois cômodos', 100.00);
-- ---------------------------------------------------------- --
-- Inserindo em convenio --
-- ---------------------------------------------------------- --
insert into convenio(id, nome_convenio, CNPJ) values
(1, 'MedMais', '796524388158-38'),
(2,'UniSaude', '586742559445-37'),
(3, 'Pro Health', '689475459535-68'), 
(4, 'UniMedico', '874512365987-54');
-- ---------------------------------------------------------- --
-- inserindo em Especialidade
-- ---------------------------------------------------------- --
insert into Especialidade(id, Descrição) values
(1, 'pediatria'),
(2, 'clínica geral'),
(3, 'gastroenterologia'),
(4, 'dermatologia');
-- ---------------------------------------------------------- --
-- Inserindo em médicos --
-- ---------------------------------------------------------- --
insert into medico(id, nome, CPF, data_nascimento, tipo_graduacao, CRM, num_telefone, endereco) values
(1,'Anny Quintanilha', '86132473009', '1970-11-10', 'especialista', '120935', '(69)3752-5488', 'Rua Flores 10, apto 101 RS'),
(2, 'Suéli Simão Pegado', '62876978067', '1990-08-27', 'residente', '15891', '(97)2810-2734', 'Avenida Japão 50 SP'),
(3,'Alisson Sacramento', '80814279023', '1981-01-15', 'especialista', '178105', '(79)2718-0264', 'Rua Albieri 480 MG'),
(4, 'Lívia Veloso', '20924987030', '1972-03-22', 'especialista', '17897', '(61)3019-1483', 'Travessa A 89 MG'),
(5,'Gael Milheiro Lemes', '38603737061', '1964-02-13', 'especialista', '9826', '(82)2433-7762', 'Rua das Rosas, 80, apto 200 RS'),
(6,'Gisela Espinosa', '23529091049', '1980-09-12', 'generalista', '34548', '(86)3368-4812', 'Avenida Santos, 90 PI'),
(7, 'Nelson Anjos Palmeira', '03626639045', '1980-10-14', 'especialista', '344789', '(54)3941-4795', 'Rua Álamo, 180, ap 90 SP'),
(8, 'Ezequiel Pestana Henriques', '67297959057', '1979-06-30', 'especialista', '9756', '(69)2537-6076','Avenida Chateaubriand, 150 RS'),
(9, 'Tito Carqueijeiro', '74588651056', '1973-05-19', 'generalista', '14777', '(83)3272-8326', 'Rua Flores 670 RS'),
(10, 'Fabiano Gomide', '32972518080', '1989-08-31', 'residente', '65765', '(63)3230-5071', 'Avenida das Águas 600 RS'),
(11, 'Cristovão Xavier', '92690490005', '1979-12-12', 'especialista', '67432', '(24)2448-9465', 'Rua da Luz, 80 RS'),
(12, 'Alberto Veríssimo', '70600178013', '1986-06-26', 'residente','13548', '(67)3754-8886', 'Avenida  das aves, 9912, apto 60 SP'),
(13, 'Júlia Camarinho', '74492596054','1980-07-05', 'generalista', '24654', '(61)2615-4776', 'Rua Albieri 590 MG');

-- ---------------------------------------------------------- --
-- Inserindo em paciente --
-- ---------------------------------------------------------- --
insert into paciente(id, nome, CPF, RG, data_nascimento, endereco, telefone, email, id_convenio, num_carteira_convenio, tempo_carencia) values
(1, 'Karine Macena Porciúncula', '04578964115', '28819735-8','1950-03-30', 'Rua Bruna Correia, Bairro 46, 86, SP', '(96)8855-4433', 'da.macena_@live.com', null, null, null),
(2, 'Zilda Gomide Osório', '12629595317', '18279526-2','2009-03-30', 'Rua Arlindo Nogueira, Centro, Teresina PI', '(11)9895-2558', 'zil_ilda@gmail.com', 1, '55643215', '3 anos'),
(3, 'Fabrício Norões Xavier', '98455559831', '88731522-8','2010-02-20', 'Avenida Esbertalina Barbosa Damiani, Guriri Norte, São Mateus ES', '(85)8179-8883','fabricio.osorio@live.com', 1, '21484234', '2 anoa'),
(4, 'César Sítima Faria', '86228187885', '19667348-7','1950-02-20', 'QE 11 Área Especial C, Guará I, Brasília DF', '(99)9865-2668', 'cesar.f@bol.com.br', null, null, null),
(5, 'Silvana Fartaria Nazário', '93123216814', '31141589-6', '2007-3-1', 'Avenida Tocantins, Vila Jardim Rio Claro, Jataí GO', '(54)8138-5831', 'silna@live.com', 4, '12333214', '2 anos'),
(6, 'Evandro Trindade Bouça', '13584326413', '11696893-8', '2008-4-2', 'Rua Domingos Olímpio, Centro, Sobral CE', '(87)9981-4572', 'trindnois@hotmail.com', 4, '33643425', '2 anos'),
(7, 'Karina Marcela Pauline', '72977571633', '78976459-6', '1987-12-16', 'Rua Barão de Vitória, Casa Grande, Diadema SP','(78)8824-3742','rinaP@live.com', 2, '12341234', '5 anos'),
(8, 'Ivo Brandão Palos', '76434616885', '71666329-1', '1987-7-10', 'Rua Domingos Olímpio, Centro, Sobral, CE', '(22)2356-2593', 'ivo.palos@outlook.com', 3, '12342342', '1 ano'),
(9, 'Armindo Moreira Azeredo', '63827795943', '35891747-3', '1972-12-11', 'Rua Paracatu, Parque Imperial, São Paulo SP', '(98)6118-5836', 'modeira@uol.com.br', 4, 11234214124, '2 anos'),
(10, 'Mark Festas Santana', '48152959177', '17759891-4', '1992-9-12', 'QE 11 Área Especial C, Guará I, Brasília DF', '(92)9931-7912', 'festas@live.com', 2, '4351315', '10 anos'),
(11, 'Helton Espinosa', '78154921657', '31525982-9', '1970-11-18', 'Travessa Antônio Ferreira, Igrejinha, Capanema PA', '(77)3759-8274','helespina@live.com', 2, '2446354', '5 anos'),
(12, 'Fabrício Norões Xavier', '33813478421', '84172953-6', '1996-8-25', 'Rua Paracatu, Parque Imperial, São Paulo SP', '(11)6491-6355', 'noxavi@live.com', 2, '2672634', '3 anos'),
(13, 'Giovanni Arouca Mata', '36475788396', '48493743-3', '1978-11-23', 'Avenida Almirante Maximiano Fonseca, Zona Portuária, Rio Grande RS', '(92)5113-2234','gi.onvani@live.com', null, null, null),
(14, 'Cármen Mata Camargo', '56834513317', '67529567-2', '1978-1-7', 'Travessa Antônio Ferreira, Igrejinha, Capanema PA', '(63)3987-4326', 'car_men@outlook.com', 3, '542315', '4 anos'),
(15, 'Pablo Atilano Flores', '32652236441', '46677222-6', '1996-12-23', 'Rua dos Carijós, Centro, Belo Horizonte MG', '(67)1692-8669', 'flores.atilianas_@gmail.com', 2, '2354641656', '3 anos');


-- ---------------------------------------------------------- --
-- inserindo em medico_especialidade
-- ---------------------------------------------------------- --
insert into medico_especialidade(id, id_medico, id_Especialidade) values
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 3, 3),
(5, 4, 1),
(6, 4, 3),
(7, 5, 4),
(8, 6, 2),
(9, 7, 1),
(10, 8, 1),
(11, 9, 2),
(12, 10, 2),
(13, 11, 1),
(14, 11, 4),
(15, 12, 1),
(16, 13, 2),
(17, 13, 3);

-- ---------------------------------------------------------- --
-- inserindo em consulta
-- ---------------------------------------------------------- --
insert into consulta(id, DataHora, valor, id_paciente, id_convenio, id_medicos_especilaidade) values
(1, '2019-02-06 09:20:00', 110.00, 1, null, 16),
(2, '2019-02-16 09:10:00', 110.00, 2, 1, 4),
(3, '2019-04-04 09:20:00', 180.00, 3, 1, 17),
(4, '2019-05-24 11:10:00', 150.00, 3, 1, 4),
(5, '2019-07-20 12:10:00', 180.00, 5, 4, 7),
(6, '2019-08-03 15:20:00', 150.00, 6, 4, 11),
(7, '2019-08-05 16:10:00', 110.00, 7, 2, 4),
(8, '2019-10-14 09:20:00', 75.00, 8, 3, 10),
(9, '2019-10-01 08:10:00', 150.00, 9, 4, 1),
(10, '2020-03-01 08:10:00', 75.00, 10, null, 10),
(11, '2020-03-07 08:20:00', 150.00, 9, 4, 11),
(12, '2020-05-16 11:20:00', 150.00, 11, 2, 3),
(13, '2020-07-16 08:10:00', 110.00, 14, 3, 14),
(14, '2020-09-07 15:10:00', 180.00, 5, 4, 1),
(15, '2020-09-20 11:10:00', 110.00, 15, 2, 9),
(16, '2020-09-22 13:20:00', 110.00, 14, 1, 1),
(17, '2020-10-12 12:10:00', 100.00, 6, null, 11),
(18, '2020-10-12 10:10:00', 180.00, 2, 1, 11),
(19, '2020-10-23 15:20:00', 110.00, 13, null, 12),
(20, '2020-11-15 12:10:00', 150.00, 6, null, 7);

-- ---------------------------------------------------------- --
-- inserindo em receita
-- ---------------------------------------------------------- --
insert into receita(id_consulta, Remédio, Tratamento)values
(4, 'Neusaudina e Asitromicina','Tomar um comprimido de cada a cada 8 horas'),
(6, 'Ibuprofeno, Ranitidina e Ciprofloxacino', 'Tomar dois comprimidos de cada de 10 em 10 horas'),
(7, 'Fluoxetina e Dipirona','Tomar um comprimido de cada de 5 em 5 horas'),
(9, 'Zolpidem 10 mg e Paracetamol', 'Um comprimido de Zolpidem a cada 4 horas e dois comprimidos de Paracetamol a cada 2 horas'),
(10, 'Nistatina, Amitriptilina, Amoxicilina e Albendazol', 'Um comprimido de cada de 8 em 8 horas em jejun e repouso'),
(13, 'Loratadina e Nimesulida','Um comprimido de cada de 8 em 8 horas em jejun e repouso'),
(16, 'Aciclovir e Desloratadina','Um comprimido de cada de 8 em 8 horas em jejun e repouso'),
(17, 'Bromoprida e Nistatina', 'Um comprimido de cada de 6 em 6 horas e repouso'),
(19, 'Albendazol e Diazepam', 'Um comprimido de albendazol depois do almoço e um comprimido de diazepam a cada 10 horas'),
(20, 'Levofloxacino e Prednisona', 'Um comprimido de cada de 5 em 5 horas e repouso');



-- ---------------------------------------------------------- --
-- inserindo em quarto
-- ---------------------------------------------------------- --
insert into quarto(id, id_tipo_quarto, numero, tipo) values
(1, 4, 101, 'comunitário'),
(2, 2, 105, 'intermediário'),
(3, 1, 102, 'luxo'),
(4, 3, 106, 'Apartamento'),
(5, 3, 109, 'enfermaria'),
(6, 5, 107, 'Quarto Duplo');

-- ---------------------------------------------------------- --
-- inserindo em internacao
-- ---------------------------------------------------------- --
insert into internacao(id, id_medico, id_paciente, id_quarto, data_entrada, data_prev_alta, data_alta, procedimento) values
(1, 3, 6, 1, '2015-03-20', '2015-04-30', '2015-04-30', 'Cirurgia de vesícula'),
(2, 5, 3, 2,'2017-04-10', '2017-04-20', '2017-04-21', 'Tratamento de pele'),
(3, 8, 1, 3,'2017-05-21', '2017-06-15', '2017-06-20', 'Recuperação de atropelamento de carro'),
(4, 4, 1, 4,'2018-10-10', '2018-10-30', '2018-11-01', 'Cirurgia de canela'),
(5, 3, 3, 5,'2018-11-10', '2018-12-01','2018-11-30', 'Recuperação de armonização facial'),
(6, 4, 7, 6, '2019-01-02', '2019-02-01', '2019-01-30','Cirurgia de intestino'),
(7, 10, 9, 4,'2020-02-10', '2020-02-20', '2020-03-03', 'Recuperação de tratamento de câncer');
-- ---------------------------------------------------------- --
-- inserindo em enfermeiro
-- ---------------------------------------------------------- --
insert into enfermeiro(id, nome, cpf, cre)values
(1, 'Iago Basílio','17964170090', '56468523792'), 
(2, 'Mayra Gusmão','42186317001', '37298849171'),
(3, 'Aida Madruga','27176787000', '26861385939'),
(4, 'Janaína Fortes','53093395070', '32371387451'),
(5, 'Nicolau Vaz Silva','24987742039', '14187885583'),
(6, 'João Morgado','74488578004', '23751139244'),
(7, 'Joaquim Sá Coelho','72426183047', '13966187139'),
(8, 'Bruna Montenegro','84262948048', '24523776553'),
(9, 'Laura Muniz','67533641027', '51375881671'),
(10, 'José Goulart','09686683054', '45645732272');

-- ---------------------------------------------------------- --
-- inserindo no relacionamento 'requer'
-- ---------------------------------------------------------- --
insert into requer(id_enfermeiro, id_internacao)values
(1, 1),
(2, 1),
(3, 2), 
(4, 2),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(9, 5),
(10, 5),
(1, 6),
(3, 6),
(9, 7),
(10, 7);