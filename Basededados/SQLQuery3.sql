
-- IIF

select f.Pnome, f.unome, f.Salario,
IIF(f.salario < 20000, 'Baixo', 'Alto') as 'Categoria'
from funcionario as f

select f.Pnome, f.unome, f.Salario,
CASE 
WHEN f.salario <= 10000  AND F.SALARIO > 0 THEN 'Baixo'
WHEN F.salario > 10000 and f.salario <=30000 then 'Médio'
WHEN F.Salario > 20000 THEN 'Alto'
ELSE 'Erro'
END as 'Categoria'
from funcionario as f

--WHILE CONTANDO ATÉ 10 E VARIAÇÔES

DECLARE @contador int = 0;
WHILE @contador < 10
BEGIN
SET @contador = @contador +1
IF @contador % 2 != 0
CONTINUE
PRINT 'Contador teste ' + cast(@contador as varchar(3));
END

GO

--CURSORES

DECLARE @nome VARCHAR(50);
DECLARE cursorFuncionario CURSOR FOR
select Pnome from FUNCIONARIO; 

OPEN cursorFuncionario;

FETCH NEXT FROM cursorFuncionario into @nome;

while @@FETCH_STATUS = 0
BEGIN
PRINT @NOME
FETCH NEXT FROM cursorFuncionario into @nome;
END
CLOSE cursorFuncionario;
DEALLOCATE cursorFuncionario

GO

DECLARE @Numero int = 2;
go

CREATE OR ALTER FUNCTION fn_dobro (@Numero as DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @Numero * 2;
END;

SELECT dbo.fn_dobro(250) as 'Salario';

go

DECLARE 
@menor_salario DECIMAL(10,2);
SELECT @menor_salario = MIN(Salario)
from FUNCIONARIO;
SELECT 
Pnome, 
Unome,
f.Salario, 
dbo.fn_dobro(f.salario) as 'Novo salário'
from FUNCIONARIO as f
where f.Salario > dbo.fn_dobro(@menor_salario)

GO

CREATE OR ALTER FUNCTION fn_calculdaidade(@idadeok DATE)
RETURNS INT
AS
BEGIN
DECLARE @idade int;
set @idade = DATEDIFF(YEAR, @idade, getdate());
if (MONTH(@idadeok) > MONTH(getdate()) OR (MONTH(@idadeok) = MONTH(getdate()) AND (DAY(@idadeok) > MONTH(getdate())
SET @idade = @idade -1;
RETURN @idade;
END;

SELECT
D.Nome_dependente,
D.Datanasc,
dbo.
FROM DEPENDENTE AS D
WHERE 

SELECT
f.Pnome,
f.Unome,
CONVERT(VARCHAR,f.Datanasc,103) as 'Data de Nascimento',
dbo.fn_calculaidade(F.DataNasc) as 'Idade'
FROM FUNCIONARIO AS F

GO

CREATE FUNCTION fn_func_dpt(@nomedepartamento varchar(50))
RETURNS TABLE
AS
RETURN (
 
SELECT 
f.Pnome, F.Unome
FROM FUNCIONARIO AS F
JOIN DEPARTAMENTO AS D
ON F.Dnr = D.Dnumero
WHERE D.Dnome = @nomedepartamento
)

GO

SELECT * FROM dbo.fn_func_dpt('PESQUISA')

GO

CREATE FUNCTION fn_dadosfuncionario()
RETURNS @SalAno TABLE
(
NomeCompleto varchar(150),
salario decimal(10,2),
salarioanual DECIMAL(10,2)
)
AS
BEGIN
insert into @SalAno
SELECT CONCAT(F.pnome, ' ', F.Minicial, ' ', F.Unome),
F.Salario,
F.Salario*13+(F.Salario*0.3)
from FUNCIONARIO as f
RETURN;
END

GO 

SELECT * FROM dbo.fn_dadosfuncionario();

go

CREATE PROCEDURE sp_exibenome
AS
BEGIN
PRINT 'Guilherme Bacin Hermes'
END

EXEC sp_exibenome

GO

CREATE OR ALTER PROCEDURE sp_aumento(
@porcentagem DECIMAL(3,1),
@cpf char(11))
AS
BEGIN
UPDATE FUNCIONARIO
SET Salario = Salario*(1+@porcentagem/100)
where CPF = @cpf
END

GO

exec dbo.sp_aumento @porcentagem = 5, @cpf = '98765432300';


SELECT * FROM FUNCIONARIO;


GO

exec sp_help FUNCIONARIO;

go

CREATE PROCEDURE sp_funcionarios
WITH ENCRYPTION 
AS 
BEGIN
SELECT * FROM FUNCIONARIO
END

exec sp_help sp_funcionarios;

GO

CREATE OR ALTER PROCEDURE sp_novodp(
@dep varchar(30), 
@Dpt_numero int, 
@local varchar(100)) 

AS
IF EXISTS (SELECT * FROM DEPARTAMENTO WHERE Dnome = @dep)

    BEGIN
PRINT 'Esse departamento já existe'
    RETURN;
END
ELSE
    BEGIN
INSERT INTO DEPARTAMENTO (Dnome, Dnumero)
VALUES (@dep, @Dpt_numero);

INSERT INTO LOCALIZACAO_DEP (Dnumero, Dlocal)
VALUES(@Dpt_numero, @local);

END

GO

exec sp_novodp 'Compras', '100', 'Santa Maria'

GO


SELECT * 
FROM DEPARTAMENTO AS D
JOIN LOCALIZACAO_DEP AS L
ON D.Dnumero = L.Dnumero;


CREATE PROCEDURE sp_listafunc()
AS 

BEGIN

SELECT * FROM FUNCIONARIO AS F
JOIN DEPARTAMENTO AS D
ON F.Cpf = D.Dnumero;

END


Exec sp_help funcionario

go 

SELECT F.Pnome, D.Dnome
FROM FUNCIONARIO AS F
JOIN DEPARTAMENTO AS D
ON F.Cpf = D.Dnumero;