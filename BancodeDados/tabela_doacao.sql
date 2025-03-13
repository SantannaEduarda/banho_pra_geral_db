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
 
CREATE TABLE beneficiario ( 
  id_beneficiario INTEGER PRIMARY KEY, 
  nome VARCHAR(100) NOT NULL, 
  data_nasc DATE, 
  genero ENUM('masculino', 'feminino', 'outro'), 
  necessidades_especiais VARCHAR(500), 
  estado_saude VARCHAR(250), 
  registro INTEGER, 
  n_ficha INT, 
  n_acao INT 
); 
 
CREATE TABLE voluntario ( 
  id_voluntario INTEGER PRIMARY KEY, 
  nome VARCHAR(100) NOT NULL, 
  contato VARCHAR(500), 
  funcao ENUM('Area do banho', 'Doador', 'Area da cozinha') 
); 
 
); 
CREATE TABLE doacao ( 
id_doacao INTEGER PRIMARY KEY, 
catalogacao ENUM('Marmitas', 'Itens Higienicos', 'Roupas'), 
quantidade INT, 
data_recebimento DATE, 
tamanho VARCHAR(50), 
tipo ENUM('Itens de uso', 'Itens de consumo'), 
id_acao INTEGER, 
FOREIGN KEY (id_acao) REFERENCES acao(id_acao) 
); 