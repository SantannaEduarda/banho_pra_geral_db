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
 
CREATE TABLE acao ( 
  id_acao INTEGER PRIMARY KEY, 
  local VARCHAR(500), 
  data_horario DATETIME, 
  id_beneficiario INTEGER, 
  id_parceiro_local INTEGER, 
  id_coordenador INTEGER, 
  id_voluntario INTEGER, 
FOREIGN KEY (id_beneficiario) REFERENCES beneficiario(id_beneficiario), 
FOREIGN KEY (id_parceiro_local) REFERENCES parceiro_local(id_parceiro_local), 
FOREIGN KEY (id_coordenador) REFERENCES coordenador(id_coordenador), 
FOREIGN KEY (id_voluntario) REFERENCES voluntario(id_voluntario) 
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