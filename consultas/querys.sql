-- CONSULTAS

-- Exibe a soma total das doações feitas, agrupadas por tipo de item doado.
SELECT catalogacao AS tipo_item, SUM(quantidade) AS total_doado
FROM doacao
GROUP BY catalogacao
ORDER BY total_doado DESC;

-- ações que foram realizadas em cada parceiro local.
SELECT p.nome AS parceiro, COUNT(a.id_acao) AS total_acoes
FROM parceiro_local p
JOIN acao a ON p.id_parceiro_local = a.id_parceiro_local
GROUP BY p.nome
ORDER BY total_acoes DESC;


-- Beneficiários por faixa etária e gênero
SELECT 
  CASE 
    WHEN TIMESTAMPDIFF(YEAR, data_nasc, CURDATE()) < 18 THEN 'Menor de 18'
    WHEN TIMESTAMPDIFF(YEAR, data_nasc, CURDATE()) BETWEEN 18 AND 30 THEN '18-30 anos'
    WHEN TIMESTAMPDIFF(YEAR, data_nasc, CURDATE()) BETWEEN 31 AND 50 THEN '31-50 anos'
    ELSE 'Mais de 50'
  END AS faixa_etaria,
  genero,
  COUNT(*) AS quantidade
FROM beneficiario
GROUP BY faixa_etaria, genero
ORDER BY faixa_etaria, genero;


-- Ações realizadas por coordenador e número de beneficiários atendidos
SELECT 
  c.nome AS coordenador, 
  COUNT(a.id_acao) AS total_acoes, 
  COUNT(DISTINCT a.id_beneficiario) AS beneficiarios_atendidos
FROM acao a
JOIN coordenador c ON a.id_coordenador = c.id_coordenador
GROUP BY c.nome
ORDER BY total_acoes DESC;