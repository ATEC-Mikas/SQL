use campeonato2
go

alter table revisao drop constraint pk_revisao_matricula_data_horamarcacao
alter table revisao add id_revisao integer identity(1,1) constraint pk_revisao_id_revisao primary key
alter table revisao add constraint un_revisao_matricula_data_horamarcacao unique (matricula,data_hora_marcacao)
