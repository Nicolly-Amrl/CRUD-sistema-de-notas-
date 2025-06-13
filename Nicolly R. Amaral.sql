CREATE DATABASE sistema_notas;
USE sistema_notas;

CREATE TABLE professores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_docente VARCHAR(20) NOT NULL,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ra VARCHAR(20) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL
);
CREATE TABLE disciplinas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    professor_id INT,
    FOREIGN KEY (professor_id) REFERENCES professores(id) ON DELETE SET NULL
);
CREATE TABLE notas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT NOT NULL,
    disciplina_id INT NOT NULL,
    nota DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES alunos(id) ON DELETE CASCADE,
    FOREIGN KEY (disciplina_id) REFERENCES disciplinas(id) ON DELETE CASCADE
);

INSERT INTO professores (codigo_docente, nome) VALUES 
('DOC123', 'Prof. João Silva'), 
('DOC124', 'Profª. Maria Oliveira');

INSERT INTO professores (codigo_docente, nome) VALUES 
('DOC123', 'Prof. João Silva'), 
('DOC124', 'Profª. Maria Oliveira');

INSERT INTO disciplinas (nome, professor_id) VALUES 
('Matemática', 1), 
('Português', 2);

INSERT INTO notas (aluno_id, disciplina_id, nota) VALUES 
(1, 1, 8.5), 
(2, 1, 9.0), 
(1, 2, 7.5);

SELECT 
    alunos.nome AS nome_aluno, 
    disciplinas.nome AS disciplina, 
    professores.nome AS nome_professor, 
    notas.nota
FROM notas
JOIN alunos ON notas.aluno_id = alunos.id
JOIN disciplinas ON notas.disciplina_id = disciplinas.id
JOIN professores ON disciplinas.professor_id = professores.id;

UPDATE notas 
SET nota = 9.2 
WHERE aluno_id = 1 AND disciplina_id = 1;

DELETE FROM notas WHERE id = 1;
DELETE FROM alunos WHERE id = 2;
DELETE FROM disciplinas WHERE id = 1;
DELETE FROM professores WHERE id = 1;

SELECT * FROM notas;
SELECT * FROM disciplinas WHERE professor_id IS NULL;