/*1*/
CREATE VIEW vw_alunos_cursos AS
SELECT 
    alunos.nome AS Nome_Aluno,
    cursos.nome AS Curso,
    disciplinas.nome AS Disciplina
FROM 
    alunos
JOIN 
    matriculas ON alunos.id = matriculas.aluno_id
JOIN 
    disciplinas ON matriculas.disciplina_id = disciplinas.id
JOIN 
    cursos ON disciplinas.curso_id = cursos.id;
    
    /*2*/
    CREATE VIEW vw_total_alunos_disciplina AS
SELECT 
    disciplinas.nome AS Disciplina,
    COUNT(matriculas.aluno_id) AS Total_Alunos
FROM 
    disciplinas
LEFT JOIN 
    matriculas ON disciplinas.id = matriculas.disciplina_id
GROUP BY 
    disciplinas.nome;
    /*3*/
    CREATE VIEW vw_alunos_status_matricula AS
SELECT 
    alunos.nome AS Nome_Aluno,
    disciplinas.nome AS Disciplina,
    matriculas.status AS Status_Matricula
FROM 
    alunos
JOIN 
    matriculas ON alunos.id = matriculas.aluno_id
JOIN 
    disciplinas ON matriculas.disciplina_id = disciplinas.id;
    /*4*/
    CREATE VIEW vw_professores_turmas AS
SELECT 
    professores.nome AS Nome_Professor,
    disciplinas.nome AS Disciplina,
    turmas.horario AS Horario_Turma
FROM 
    professores
JOIN 
    turmas ON professores.id = turmas.professor_id
JOIN 
    disciplinas ON turmas.disciplina_id = disciplinas.id;
    /*5*/
    CREATE VIEW vw_alunos_maiores_20_anos AS
SELECT 
    nome AS Nome_Aluno,
    DATE_FORMAT(CURDATE(), '%Y') - DATE_FORMAT(data_nascimento, '%Y') - (DATE_FORMAT(CURDATE(), '00-%m-%d') < DATE_FORMAT(data_nascimento, '00-%m-%d')) AS Idade
FROM 
    alunos
HAVING 
    Idade > 20;
    /*6*/
    CREATE VIEW vw_disciplinas_carga_horaria_curso AS
SELECT 
    cursos.nome AS Curso,
    COUNT(disciplinas.id) AS Quantidade_Disciplinas,
    SUM(disciplinas.carga_horaria) AS Carga_Horaria_Total
FROM 
    cursos
JOIN 
    disciplinas ON cursos.id = disciplinas.curso_id
GROUP BY 
    cursos.nome;
    /*7*/
    CREATE VIEW vw_professores_especialidades AS
SELECT 
    nome AS Nome_Professor,
    especialidade AS Especialidade
FROM 
    professores;
    /*8*/
    CREATE VIEW vw_alunos_mais_de_uma_disciplina AS
SELECT 
    alunos.nome AS Nome_Aluno,
    COUNT(matriculas.disciplina_id) AS Quantidade_Disciplinas
FROM 
    alunos
JOIN 
    matriculas ON alunos.id = matriculas.aluno_id
GROUP BY 
    alunos.nome
HAVING 
    Quantidade_Disciplinas > 1;
    /*9*/
    CREATE VIEW vw_alunos_disciplinas_concluidas AS
SELECT 
    alunos.nome AS Nome_Aluno,
    COUNT(matriculas.disciplina_id) AS Disciplinas_Concluidas
FROM 
    alunos
JOIN 
    matriculas ON alunos.id = matriculas.aluno_id
WHERE 
    matriculas.status = 'Concluído'
GROUP BY 
    alunos.nome;
    /*10*/
    CREATE VIEW vw_turmas_semestre_especifico AS
SELECT 
    turmas.nome AS Nome_Turma,
    turmas.semestre AS Semestre,
    disciplinas.nome AS Disciplina
FROM 
    turmas
JOIN 
    disciplinas ON turmas.disciplina_id = disciplinas.id
WHERE 
    turmas.semestre = '2024.1';  -- Exemplo de semestre específico
    /*11*/
    CREATE VIEW vw_alunos_matriculas_trancadas AS
SELECT 
    alunos.nome AS Nome_Aluno
FROM 
    alunos
JOIN 
    matriculas ON alunos.id = matriculas.aluno_id
WHERE 
    matriculas.status = 'Trancado';
    /*12*/ 
    CREATE VIEW vw_disciplinas_sem_alunos AS
SELECT 
    disciplinas.nome AS Disciplina
FROM 
    disciplinas
LEFT JOIN 
    matriculas ON disciplinas.id = matriculas.disciplina_id
WHERE 
    matriculas.aluno_id IS NULL;
    /*13*/
    CREATE VIEW vw_quantidade_alunos_por_status AS
SELECT 
    matriculas.status AS Status_Matricula,
    COUNT(matriculas.aluno_id) AS Quantidade_Alunos
FROM 
    matriculas
GROUP BY 
    matriculas.status;
    /*14*/
    CREATE VIEW vw_total_professores_por_especialidade AS
SELECT 
    especialidade AS Especialidade,
    COUNT(professores.id) AS Total_Professores
FROM 
    professores
GROUP BY 
    especialidade;
    /*15*/
    CREATE VIEW vw_alunos_idades AS
SELECT 
    nome AS Nome_Aluno,
    DATE_FORMAT(CURDATE(), '%Y') - DATE_FORMAT(data_nascimento, '%Y') - (DATE_FORMAT(CURDATE(), '00-%m-%d') < DATE_FORMAT(data_nascimento, '00-%m-%d')) AS Idade
FROM 
    alunos;
    /*16*/
    CREATE VIEW vw_alunos_ultimas_matriculas AS
SELECT 
    alunos.nome AS Nome_Aluno,
    MAX(matriculas.data_matricula) AS Ultima_Matricula
FROM 
    alunos
JOIN 
    matriculas ON alunos.id = matriculas.aluno_id
GROUP BY 
    alunos.nome
    /*17*/
    CREATE VIEW vw_disciplinas_curso_especifico AS
SELECT 
    disciplinas.nome AS Disciplina,
    cursos.nome AS Curso
FROM 
    disciplinas
JOIN 
    cursos ON disciplinas.curso_id = cursos.id
WHERE 
    cursos.nome = 'Engenharia de Software';  -- Exemplo de curso específico
    /*18*/
    CREATE VIEW vw_professores_sem_turmas AS
SELECT 
    professores.nome AS Nome_Professor
FROM 
    professores
LEFT JOIN 
    turmas ON professores.id = turmas.professor_id
WHERE 
    turmas.id IS NULL;
    /*19*/
    CREATE VIEW vw_alunos_cpf_email AS
SELECT 
    nome AS Nome_Aluno,
    cpf AS CPF,
    email AS Email
FROM 
    alunos;
    /*20*/
    CREATE VIEW vw_total_disciplinas_por_professor AS
SELECT 
    professores.nome AS Nome_Professor,
    COUNT(disciplinas.id) AS Total_Disciplinas
FROM 
    professores
JOIN 
    turmas ON professores.id = turmas.professor_id
JOIN 
    disciplinas ON turmas.disciplina_id = disciplinas.id
GROUP BY 
    professores.nome;