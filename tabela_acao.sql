

CREATE TABLE Acao (
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