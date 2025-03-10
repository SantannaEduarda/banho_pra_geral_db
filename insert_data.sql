-- INSERINDO DADOS

INSERT INTO beneficiario VALUES
(1, 'João Silva', '1985-06-12', 'Masculino', 'Deficiência visual', 'Hipertensão', 1001, 1, 5),
(2, 'Maria Souza', '1992-03-25', 'Feminino', 'Nenhuma', 'Saudável', 1002, 2, 8),
(3, 'Carlos Oliveira', '1978-11-10', 'Masculino', 'Mobilidade reduzida', 'Diabetes', 1003, 3, 4),
(4, 'Ana Beatriz', '2000-07-22', 'Feminino', 'Surdez', 'Saudável', 1004, 4, 6),
(5, 'Rafael Lima', '1980-09-15', 'Masculino', 'Nenhuma', 'Pressão Alta', 1005, 5, 7),
(6, 'Fernanda Ribeiro', '1995-12-30', 'Feminino', 'Asma', 'Boa', 1006, 6, 2),
(7, 'Ricardo Alves', '1987-08-14', 'Masculino', 'Problemas cardíacos', 'Monitorado', 1007, 7, 3),
(8, 'Laura Fernandes', '1991-05-22', 'Feminino', 'Nenhuma', 'Boa', 1008, 8, 6),
(9, 'Tiago Castro', '1975-11-05', 'Masculino', 'Cadeirante', 'Boa', 1009, 9, 4),
(10, 'Beatriz Lima', '1998-02-19', 'Feminino', 'Nenhuma', 'Saudável', 1010, 10, 7),
(11, 'Marcos Vinicius', '1982-12-10', 'Masculino', 'Asma', 'Boa', 1011, 11, 3),
(12, 'Camila Santos', '1994-09-30', 'Feminino', 'Nenhuma', 'Saudável', 1012, 12, 5),
(13, 'Fábio Martins', '1971-04-07', 'Masculino', 'Problema auditivo', 'Tratamento', 1013, 13, 2),
(14, 'Patrícia Oliveira', '1989-07-16', 'Feminino', 'Diabetes', 'Controlada', 1014, 14, 6),
(15, 'Gustavo Rocha', '1993-06-25', 'Masculino', 'Nenhuma', 'Boa', 1015, 15, 8);

INSERT INTO parceiro_local VALUES
(1, 'Igreja São João', 'Pe. Antônio', 'Rua A, nº 50, Centro', '(21) 99999-1111'),
(2, 'ONG Mãos Solidárias', 'Larissa Santos', 'Av. B, nº 120, Zona Sul', '(21) 98888-2222'),
(3, 'Associação Esperança', 'Marcos Lima', 'Rua C, nº 300, Norte', '(21) 97777-3333'),
(4, 'Centro Comunitário Luz', 'Joana Mendes', 'Rua D, nº 80, Oeste', '(21) 96666-5555'),
(5, 'Projeto Vida Nova', 'Carlos Henrique', 'Av. E, nº 150, Leste', '(21) 95555-8888');

INSERT INTO coordenador VALUES
(1, 'Rafael Medeiros', '(21) 95555-4444', 'Centro e Zona Norte'),
(2, 'Fernanda Lopes', '(21) 96666-5555', 'Zona Sul e Oeste'),
(3, 'Marcelo Andrade', '(21) 97777-6666', 'Zona Norte'),
(4, 'Tatiane Borges', '(21) 98888-7777', 'Zona Oeste'),
(5, 'Angelica Souza', '(21) 99999-8888', 'Zona Leste');

INSERT INTO voluntario VALUES
(1, 'Pedro Santos', '(21) 94444-6666', 'area do banho'),
(2, 'Juliana Alves', '(21) 93333-7777', 'doador'),
(3, 'Lucas Ribeiro', '(21) 92222-8888', 'area da cozinha'),
(4, 'Mariana Costa', '(21) 91111-9999', 'doador'),
(5, 'Bruno Ferreira', '(21) 90000-1234', 'area do banho'),
(6, 'Andréa Martins', '(21) 98888-4321', 'area da cozinha');

INSERT INTO acao VALUES
(1, 'Praça Central', '2024-03-01 10:00', 1, 1, 1, 1),
(2, 'Igreja São João', '2024-03-10 15:00', 2, 1, 1, 2),
(3, 'ONG Mãos Solidárias', '2024-03-20 12:00', 3, 2, 2, 3),
(4, 'Centro Comunitário Luz', '2024-03-25 14:00', 4, 4, 3, 4),
(5, 'Projeto Vida Nova', '2024-04-05 16:00', 5, 5, 4, 5);

INSERT INTO doacao VALUES
(1, 'Marmitas', 50, '2024-02-28', '-', 'Itens de consumo', 1),
(2, 'Roupas', 30, '2024-02-15', 'M', 'Itens de uso', 2),
(3, 'Itens Higienicos', 100, '2024-02-20', '-', 'Itens de uso', 3),
(4, 'Marmitas', 70, '2024-03-05', '-', 'Itens de consumo', 4),
(5, 'Roupas', 45, '2024-03-10', 'G', 'Itens de uso', 2);