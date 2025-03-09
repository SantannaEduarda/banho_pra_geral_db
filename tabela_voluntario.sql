CREATE DATABASE banho_pra_geral;

USE banho_pra_geral;

CREATE TABLE coordenador (
  id_coordenador INT PRIMARY KEY,
  nome VARCHAR(100),
  contato VARCHAR(500),
  territorio_atuacao VARCHAR(500)
);

CREATE TABLE parceiro_local (
id_parceiro_local INT PRIMARY KEY,
nome VARCHAR(100),
responsavel VARCHAR(100),
localizacao VARCHAR(500),
contato VARCHAR(50)
);

CREATE TABLE voluntario (
    id_voluntario INTEGER PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    contato VARCHAR(500),
    funcao ENUM('Area do banho', 'Doador', 'Area da cozinha')
);