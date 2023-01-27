create table enfermeiro(
id int not null auto_increment,
nome varchar(255) not null,
cpf char(11) not null,
cre varchar(11),
primary key(id)
);

create table Tipo_quarto(
id int not null auto_increment,
descricao text not null,
valor_diaria decimal(9,2) not null,
primary key(id)
);

create table quarto(
id int not null auto_increment,
id_tipo_quarto int not null,
numero int not null,
tipo varchar(45),
primary key(id),
constraint fk_tipo_quarto foreign key(id_tipo_quarto) 
references Tipo_quarto(id)
);

create table internacao(
id int not null auto_increment,
id_medico int not null,
id_paciente int not null,
id_quarto int not null,
data_entrada datetime not null,
data_prev_alta datetime not null,
data_alta datetime not null,
procedimento text not null,
primary key(id),
constraint fk_medico foreign key(id_medico) references medico(id),
constraint fk_paciente foreign key(id_paciente) references paciente(id),
constraint fk_quarto foreign key(id_quarto) references quarto(id)
);

create table requer(
id_enfermeiro int not null,
id_internacao int not null,
primary key(id_enfermeiro, id_internacao),
constraint fk_enfermeiro foreign key(id_enfermeiro) references enfermeiro(id),
constraint fk_internacao foreign key(id_internacao) references internacao(id)
);
