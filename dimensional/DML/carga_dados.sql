USE formula1;
/* CARGA DE DADOS DIM_CIRCUITOS */

INSERT INTO dw_f1.dim_circuitos (code_circuito, ref_circuito, nome_circuito, localizacao_circuito, pais_circuito)
SELECT id_circuito, ref_circuito, nome_circuito, location_circuito, pais_circuito
FROM formula1.circuitos;

/*SCRIPT PARA POPULAR A TABELA_DIMENSÃO_PILOTOS*/
INSERT INTO dw_f1.dim_pilotos (code_piloto, ref_piloto, abr_piloto, primeiro_nome, ultimo_nome, nacionalidade, data_nascimento)
SELECT id_piloto, ref_piloto, code_piloto, primeiro_nome, ultimo_nome, nacionalidade_piloto, nascimento
FROM formula1.pilotos;

/*SCRIPT PARA POPULAR A TABELA_DIMENSÃO_CORRIDAS*/
INSERT INTO dw_f1.dim_corridas (code_corrida, nome_gp, data_gp, horario_gp, temporada, rodada)
SELECT id_corrida, nome_corrida, data_corrida, horario_corrida, ano_corrida, rodada FROM formula1.corridas;

/*SCRIPT PARA POPULAR A TABELA_DIMENSÃO_CONSTRUTORES*/
INSERT INTO dw_f1.dim_construtores (code_construtor, nome_construtor, fabricante_motor, nacionalidade_construtor)
SELECT id_construtor, nome_construtor, fabricante_motor, nacionalidade_construtor from formula1.construtores;

/*SCRIPT PARA POPULAR A TABELA_DIMENSÃO_TEMPO*/
INSERT INTO dw_f1.dim_tempo (dia_do_mes, mes_do_ano, ano, dia_do_ano, semana_do_ano, nome_dia, nome_mes)
SELECT day(data_corrida), month(data_corrida), year(data_corrida),
		dayofyear(data_corrida), weekofyear(data_corrida), dayname(data_corrida), monthname(data_corrida)
FROM formula1.corridas;