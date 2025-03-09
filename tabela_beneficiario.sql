CREATE DATABASE banho_pra_geral;

USE banho_pra_geral;

CREATE TABLE Beneficiario (
id_beneficiario INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
genero ENUM('Masculino', 'Feminino', 'Outro') NOT NULL,
data_nascimento DATE NOT NULL,
estado_saude ENUM('Ótimo', 'Bom', 'Regular', 'Ruim', 'Crítico') NOT NULL,
necessidades_Especiais VARCHAR(500) NOT NULL,
historico_atendimento TEXT
);