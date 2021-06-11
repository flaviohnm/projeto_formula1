/* SCRIPT CRIAÇÃO DO BANCO DE DADOS */
CREATE DATABASE FORMULA1;

/* SCRIPT CRIAÇÃO DA TABELA CONSTRUTOR */

CREATE TABLE construtores (
    id_construtor INTEGER,
    nome_construtor VARCHAR (50) NOT NULL,
    nacionalidade_construtor VARCHAR (50),
    PRIMARY KEY (id_construtor)
);

/* SCRIPT CRIAÇÃO DA TABELA TEMPORADA */
CREATE TABLE temporadas (
    ano INTEGER PRIMARY KEY;
);

/* SCRIPT CRIAÇÃO DA TABELA PILOTO */
CREATE TABLE pilotos (
    id_piloto INTEGER PRIMARY KEY,
    ref_piloto VARCHAR (50) NOT NULL,
    code_piloto VARCHAR (5),
    primeiro_nome VARCHAR(50) NOT NULL,
    ultimo_nome VARCHAR(50) NOT NULL,
    nascimento DATE,
    nacionalidade_piloto VARCHAR (50)
);

/* SCRIPT CRIAÇÃO DA TABELA CIRCUITO */
CREATE TABLE circuitos (
    id_circuito INTEGER PRIMARY KEY,
    ref_circuito VARCHAR (100) NOT NULL,
    nome_circuito VARCHAR (100) NOT NULL,
    location_circuito VARCHAR (100) NOT NULL,
    pais_circuito VARCHAR (50)
);

/* SCRIPT CRIAÇÃO DA TABELA CIRCUITO */
CREATE TABLE status (
    id_status INTEGER PRIMARY KEY,
    descricao_status VARCHAR(50) NOT NULL
);

/* SCRIPT CRIAÇÃO DA TABELA CORRIDAS */
CREATE TABLE corridas (
    id_corrida INTEGER,
    ano_corrida INTEGER NOT NULL,
    rodada INTEGER NOT NULL,
    id_circuito INTEGER NOT NULL,
    nome_corrida VARCHAR(100) NOT NULL,
    data_corrida DATE NOT NULL,
    tempo_corrida TIME,
    PRIMARY KEY (id_corrida),
    FOREIGN KEY (ano_corrida) REFERENCES temporadas (ano),
    FOREIGN KEY (id_circuito) REFERENCES circuitos (id_circuito)
);

/* SCRIPT CRIAÇÃO DA TREINOS_CLASSIFICATORIOS */
CREATE TABLE classificacao (
    id_classificacao INTEGER,
    id_corrida INTEGER NOT NULL,
    id_piloto INTEGER NOT NULL,
    id_construtor INTEGER NOT NULL,
    numero INTEGER NOT NULL,
    posicao INTEGER,
    q1 VARCHAR(50),
    q2 VARCHAR(50),
    q3 VARCHAR(50),
    PRIMARY KEY (id_classificacao),
    FOREIGN KEY (id_corrida) REFERENCES corridas (id_corrida),
    FOREIGN KEY (id_piloto) REFERENCES pilotos (id_piloto),
    FOREIGN KEY (id_construtor) REFERENCES construtores (id_construtor)
);

/* SCRIPT CRIAÇÃO DA TABELA RESULTADOS */

CREATE TABLE resultados (
    id_resultado INTEGER,
    id_corrida INTEGER NOT NULL,
    id_piloto INTEGER NOT NULL,
    id_construtor INTEGER NOT NULL,
    numero INTEGER NOT NULL,
    grid INTEGER NOT NULL,
    posicao INTEGER,
    texto_posicao VARCHAR (10) NOT NULL,
    ordem_posicao INTEGER NOT NULL,
    pontos FLOAT NOT NULL,
    voltas INTEGER NOT NULL,
    tempo VARCHAR (50),
    milisegundos INTEGER,
    voltarapida INTEGER,
    ranking INTEGER,
    tempo_volta VARCHAR (50),
    tempo_voltarapida VARCHAR (50),
    id_status INTEGER NOT NULL,
    PRIMARY KEY (id_resultado),
    FOREIGN KEY (id_corrida) REFERENCES corridas (id_corrida),
    FOREIGN KEY (id_piloto) REFERENCES pilotos (id_piloto),
    FOREIGN KEY (id_construtor) REFERENCES construtores (id_construtor),
    FOREIGN KEY (id_status) REFERENCES status (id_status)
)