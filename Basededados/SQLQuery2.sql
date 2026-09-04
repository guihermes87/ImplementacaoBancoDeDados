
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