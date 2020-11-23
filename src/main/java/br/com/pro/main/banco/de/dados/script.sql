--Arrumar Data
-- SHOW datestyle;
-- SET datestyle TO ISO, DMY;

--BLOCO DE CRIAÇÃO DE TABELAS--

--CRIANDO TABELA PESSOA
CREATE TABLE Pessoa (
    cd_pessoa SERIAL UNIQUE NOT NULL, /* [PK] */ --(1,1)
	nome VARCHAR(70) NOT NULL,
	dt_nasc DATE NOT NULL,
	RG VARCHAR(10) NOT NULL,
	CPF VARCHAR(15) UNIQUE NOT NULL,
	senha VARCHAR(25) NOT NULL
);

--CRIANDO TABELA ALUNO
CREATE TABLE Aluno (
	cd_aluno SERIAL UNIQUE NOT NULL,           /* [PK] */
	pessoa_cd_pessoa INTEGER UNIQUE NOT NULL,  /* [FK] */ --(0,1)
	cd_sala INTEGER NOT NULL,                  /* [FK] */ --(1,N)
	serie INTEGER NOT NULL,
	turno VARCHAR(10) NOT NULL
);

--CRIANDO TABELA SALA
CREATE TABLE Sala (
	cd_sala SERIAL UNIQUE NOT NULL /* [PK] */ --(1,1) 
);

--CRIANDO TABELA NOTAS
CREATE TABLE Notas (
	cd_nota SERIAL UNIQUE NOT NULL,  /* [PK] */
    cd_aluno INTEGER NOT NULL,       /* [FK] */
	cd_disc INTEGER NOT NULL,        /* [FK] */
    NP1 FLOAT,
    NP2 FLOAT
);

--CRIANDO TABELA DISCIPLINA
CREATE TABLE Disciplina (
	cd_disc SERIAL UNIQUE NOT NULL,  /* [PK] */
	nm_disc VARCHAR(60) NOT NULL 	 /* [FK] */
);

--CRIANDO TABELA SALA_DISCIPLINA
CREATE TABLE Sala_disc (
	cd_sala_disc SERIAL UNIQUE NOT NULL,  /* [PK] */
	cd_sala INTEGER NOT NULL, 			  /* [FK] */
	cd_disc INTEGER NOT NULL              /* [FK] */
);

--CRIANDO TABELA PROFESSOR
CREATE TABLE Professor (
	cd_prof SERIAL UNIQUE NOT NULL,    /* [PK] */
	cd_pessoa INTEGER UNIQUE NOT NULL, /* [FK] */
	cd_disc INTEGER NOT NULL           /* [FK] */
);

--CRIANDO TABELA DIRETOR
CREATE TABLE Diretor (
	cd_dir SERIAL UNIQUE NOT NULL,    /* [PK] */
	cd_pessoa INTEGER UNIQUE NOT NULL /* [FK] */
);

--END-- BLOCO DE CRIAÇÃO DE TABELAS--

-- CRIANDO PK'S

ALTER TABLE Pessoa ADD PRIMARY KEY(cd_pessoa);

ALTER TABLE Aluno ADD PRIMARY KEY(cd_aluno);

ALTER TABLE Notas ADD PRIMARY KEY(cd_nota);

ALTER TABLE Professor ADD PRIMARY KEY(cd_prof);

ALTER TABLE Diretor ADD PRIMARY KEY(cd_dir);

ALTER TABLE Sala ADD PRIMARY KEY(cd_sala);

ALTER TABLE Sala_disc ADD PRIMARY KEY(cd_sala_disc);

ALTER TABLE Disciplina ADD PRIMARY KEY(cd_disc);

--END-- CRIANDO PK'S

-- CRIANDO FK'S

-- CRIANDO FK DE ALUNO
ALTER TABLE Aluno ADD CONSTRAINT aluno_pessoa_cd_pessoa_fk FOREIGN KEY(pessoa_cd_pessoa) REFERENCES Pessoa(cd_pessoa)
ON UPDATE CASCADE
ON DELETE NO ACTION;

ALTER TABLE Aluno ADD CONSTRAINT aluno_cd_sala_fk FOREIGN KEY(cd_sala) REFERENCES Sala(cd_sala)
ON UPDATE CASCADE
ON DELETE NO ACTION;

-- CRIANDO FK DE NOTAS
ALTER TABLE Notas ADD CONSTRAINT notas_cd_aluno_fk FOREIGN KEY(cd_aluno) REFERENCES Aluno(cd_aluno)
ON UPDATE CASCADE
ON DELETE NO ACTION;

ALTER TABLE Notas ADD CONSTRAINT notas_cd_disc_fk FOREIGN KEY(cd_disc) REFERENCES Disciplina(cd_disc)
ON UPDATE CASCADE
ON DELETE NO ACTION;

-- CRIANDO FK DE PROFESSOR
ALTER TABLE Professor ADD CONSTRAINT professor_cd_pessoa_fk FOREIGN KEY(cd_pessoa) REFERENCES Pessoa(cd_pessoa)
ON UPDATE CASCADE
ON DELETE NO ACTION;

ALTER TABLE Professor ADD CONSTRAINT professor_cd_disc_fk FOREIGN KEY(cd_disc) REFERENCES Disciplina(cd_disc)
ON UPDATE CASCADE
ON DELETE NO ACTION;

-- CRIANDO FK DE DIRETOR
ALTER TABLE Diretor ADD CONSTRAINT diretor_cd_pessoa_fk FOREIGN KEY(cd_pessoa) REFERENCES Pessoa(cd_pessoa)
ON UPDATE CASCADE
ON DELETE NO ACTION;

-- CRIANDO FK DE SALA_DISC
ALTER TABLE Sala_disc ADD CONSTRAINT sala_disc_cd_sala_fk FOREIGN KEY(cd_sala) REFERENCES Sala(cd_sala)
ON UPDATE CASCADE
ON DELETE NO ACTION;

ALTER TABLE Sala_disc ADD CONSTRAINT sala_disc_cd_disc_fk FOREIGN KEY(cd_disc) REFERENCES Disciplina(cd_disc)
ON UPDATE CASCADE
ON DELETE NO ACTION;

--END FK'S
