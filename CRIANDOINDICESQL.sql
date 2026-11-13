CREATE DATABASE INDICE;


USE INDICE;

CREATE TABLE FUNCIONARIO (

Id int primary key,
nome varchar(100),
cargo varchar(50),
Salario Decimal(10,2),
DataAdmissao DATE


);

insert into funcionario 
VALUES (1,'João','Adm', 3500, GETDATE()),
		(2,'Paulo', 'Tec', 4000, getdate()),
		(3,'Armando','Portaria',5000, GETDATE()),
		(4,'Samuel', 'TI', 6000, GETDATE()),
		(5,'Cezar', 'TI', 8000, GETDATE() );

SELECT * FROM FUNCIONARIO;

Declare @contador int = 1;
declare @id int;

select @id = ISNULL(MAX(Id),0) from FUNCIONARIO

WHILE @contador <= 300000
BEGIN
set @id = @Id + 1

insert into FUNCIONARIO
values 
(

@Id,
'Funcionario' + CAST(@id as varchar(10)),
case @contador%5
when 0 then 'Gerente'
when 1 then 'Desenvolvedor'
when 2 then 'Analista'
when 3 then 'Suporte'
else 'Financeiro'
end,
FLOOR(10000*RAND()) + 1600,
DATEADD(DAY, @contador % 3650, '20150101')
)
SET @contador = @contador +1;
end

go

drop


SET STATISTICS IO ON;
SET STATISTICS TIME ON;



SELECT * FROM dbo.Funcionario WHERE nome Like '% 255000';

SELECT * FROM dbo.Funcionario WHERE nome = 'Funcionario255000';

SELECT * FROM dbo.Funcionario WHERE DataAdmissao > '20150101' and DataAdmissao < '20150201';

INSERT INTO FUNCIONARIO 
VALUES(
300100,'jAO','ADM', 5000, GETDATE()

);

CREATE NONCLUSTERED INDEX ix_Funcionario_Nome on funcionario(Nome);

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

GO

SELECT PedidoID, DataPedido
FROM dbo.Pedido
WHERE DataPedido = '20240115';
GO