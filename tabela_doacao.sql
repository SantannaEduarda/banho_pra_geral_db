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
