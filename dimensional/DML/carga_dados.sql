USE formula1;

/* CARGA DE DADOS DIM_CIRCUITOS */

INSERT INTO dw_f1.dim_circuitos (id_circuito, ref_circuito, nome_circuito, localizacao_circuito, pais_circuito)
SELECT id_circuito, ref_circuito, nome_circuito, location_circuito, pais_circuito
FROM formula1.circuitos;

/*TRATAMENTO DE DADOS ANTES DE INSERIR OS DADOS DIMENSÃO_PILOTOS */
update pilotos set nascimento = '1500-01-01' where nascimento IS NULL;
update pilotos set code_piloto = '-1' where code_piloto IS NULL;

/*SCRIPT PARA POPULAR A TABELA_DIMENSÃO_PILOTOS*/
INSERT INTO dw_f1.dim_pilotos (id_piloto, ref_piloto, code_piloto, primeiro_nome, ultimo_nome, nacionalidade, data_nascimento)
SELECT id_piloto, ref_piloto, code_piloto, primeiro_nome, ultimo_nome, nacionalidade_piloto, nascimento
FROM formula1.pilotos;

/*SCRIPT PARA POPULAR A TABELA_DIMENSÃO_CORRIDAS*/
INSERT INTO dw_f1.dim_corridas (id_corrida, nome_gp, data_gp, horario_gp, temporada, rodada)
SELECT id_corrida, nome_corrida, data_corrida, horario_corrida, ano_corrida, rodada FROM formula1.corridas;

/*SCRIPT PARA POPULAR A TABELA_DIMENSÃO_CONSTRUTORES*/
INSERT INTO dw_f1.dim_construtores (id_construtor, nome_construtor, fabricante_motor, nacionalidade_construtor)
SELECT id_construtor, nome_construtor, fabricante_motor, nacionalidade_construtor from formula1.construtores;

