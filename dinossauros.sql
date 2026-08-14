create database Museu_Dinossauros;
USE Museu_Dinossauros;

CREATE TABLE DINOSSAURO (
id int(100) PRIMARY KEY AUTO_INCREMENT,
nome varchar(200) not null,
ano_descoberta date not null,
fk_id_grupo int,
fk_id_era int,
tonelada int,
pais varchar(100),
inicio int,
fim int,
fk_id_descobridor int,

foreign key(fk_id_grupo) references grupo(id),
foreign key(fk_id_era) references era(id),
foreign key(fk_id_descobridor) references descobridor(id)


);

create table grupo (
id int(100) PRIMARY KEY AUTO_INCREMENT,
nome varchar(200)
);

create table era(
id int(100) primary key auto_increment,
nome varchar(200)
);

-- NÃO LI O ENUNCIADO, PRECISEI AJUSTAR. 

alter table era
add column ano_inicio int;
alter table era
add column ano_fim int;
alter table dinossauro
drop column fim;

UPDATE era SET ano_inicio = 145, ano_fim = 66  WHERE id = 1;
UPDATE era SET ano_inicio = 201, ano_fim = 145 WHERE id = 2;  


create table descobridor(
id int(100) primary key auto_increment,
nome varchar(200)
);


insert into grupo (id,nome)
VALUEs
(1,"Anquilosauros"),
(2,"Ceratopsídeos"),
(3,"Estegossauros"),
(4,"Terápodes");

insert into descobridor(id,nome)
VALUES 
(1,"Marvanska"),
(2,"John Bell Hatcher"),
(3,"Cientistas Alemães"),
(4,"Museu Americ História Natural"),
(5,"Othniel Charles Marsh"),
(6,"Barnum Brown");

insert into era(id,nome)
VALUES
(1,"Cretáceo"),
(2,"Jurássico");

SELECT
  d.nome AS dinossauro,
  g.nome AS grupo,
  d.tonelada AS tonelada,
  d.ano_descoberta,
  des.nome AS descobridor,
  e.nome AS era,
  e.ano_inicio,
  e.ano_fim
FROM dinossauro d
  JOIN descobridor des ON d.fk_id_descobridor = des.id
  JOIN era e           ON d.fk_id_era         = e.id
  JOIN grupo g         ON d.fk_id_grupo        = g.id
ORDER BY d.nome;

INSERT INTO dinossauro
  (id, nome, ano_descoberta, fk_id_grupo, fk_id_era, tonelada, pais, inicio, fim, fk_id_descobridor)
VALUES
  (1, 'Saichania',     1977, 1, 1, 4, 'Mongólia',         145, 66,  1),
  (2, 'Tricerátops',   1887, 2, 1, 6, 'Canadá',           145, 66,  2),
  (3, 'Kentrossauro',  1909, 3, 2, 2, 'Tanzânia',         201, 145, 3),
  (4, 'Pinacossauro',  1999, 1, 1, 6, 'China',            85,  75,  4),
  (5, 'Alossauro',     1877, 4, 2, 3, 'América do Norte', 201, 145, 5),
  (6, 'Torossauro',    1891, 2, 1, 8, 'USA',              145, 66,  2),
  (7, 'Anquilossauro', 1906, 1, 1, 8, 'América do Norte', 145, 66,  6);
  
select * 
from Dinossauro order by nome;

SELECT d.*
FROM  Dinossauro d
JOIN descobridor des ON d.fk_id_descobridor = des.id
ORDER BY des.nome;

SELECT
  des.nome AS descobridor,
  d.id,
  d.nome AS dinossauro,
  d.ano_descoberta,
  d.tonelada,
  d.pais,
  d.inicio,
  d.fim
FROM Dinossauro d
JOIN descobridor des ON d.fk_id_descobridor = des.id
ORDER BY des.nome;

SELECT d.*
FROM dinossauro AS d
JOIN grupo AS gru ON d.fk_id_grupo = gru.id
WHERE (gru.nome = "Anquilosauros" OR gru.nome LIKE "%Cerato%")
AND d.ano_descoberta BETWEEN 1900 AND 1999
ORDER BY d.ano_descoberta;
