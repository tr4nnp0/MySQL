--Dado o esquema acima, no seu ambiente SQL execute as seguintes consultas:

-- Medicos (codm, CPF, nome, idade, cidade, especialidade, nroa)
-- Pacientes (codp, CPF, nome, sexo, idade, cidade, doen�a)
-- Consultas (codm, codp, data, hora)
-- Ambulatorio (nroa, andar, capacidade)

--1) Listar o nome do medico, o andar e n�mero de ambulat�rio onde presta atendimento, ordenado por andar

SELECT nome, andar, Medicos.nroa
FROM Medicos INNER JOIN Ambulatorio ON Medicos.nroa = Ambulatorio.nroa
ORDER BY andar;

--2) Buscar o nome dos pacientes que t�m consulta marcada, com a respectiva data e hora, ordenado por data/hora

SELECT nome, data, hora
FROM Pacientes INNER JOIN Consultas ON Pacientes.codp = Consultas.codp
ORDER BY data;

SELECT nome, data, hora
FROM Pacientes INNER JOIN Consultas ON Pacientes.codp = Consultas.codp
ORDER BY hora;

--3) Buscar o nome do m�dico, o nome do paciente e a data&hora da consulta ordenado por data/hora

SELECT Medicos.nome, Pacientes.nome, data, hora
FROM Medicos, Pacientes, Consultas
ORDER BY hora;

--4) Buscar, para as consultas marcadas para o per�odo da manh� (7hs-12hs) do dia 07/10/2015, o nome do m�dico, o nome do paciente e a data&hora da consulta

SELECT Medicos.nome, Pacientes.nome, data, hora
FROM Medicos, Pacientes, Consultas
WHERE hora BETWEEN '7:00:00' AND '12:00:00' AND data = '2015-10-07';

--5) Buscar, para as consultas marcadas para o per�odo da manh� (7hs-12hs) do dia 07/10/2015, o nome do m�dico, o nome do paciente e a data&hora da consulta e o ambulat�rio e respectivo andar onde ser� realizada a consulta

SELECT Medicos.nome, Pacientes.nome, data, hora, Ambulatorio.nroa, andar
FROM Medicos, Pacientes, Consultas, Ambulatorio
WHERE hora BETWEEN '7:00:00' AND '12:00:00' AND data = '2015-10-07';