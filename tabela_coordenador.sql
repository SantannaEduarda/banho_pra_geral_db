CREATE DATABASE banho_pra_geral;

USE banho_pra_geral;

CREATE TABLE coordenador (
  id_coordenador INT PRIMARY KEY,
  nome VARCHAR(100),
  contato VARCHAR(500),
  territorio_atuacao VARCHAR(500)
);

