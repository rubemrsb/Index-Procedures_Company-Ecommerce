use company;
desc department;
show tables;
desc employee;
desc department;
select * from employee;
desc dept_locations;
-- PARTE 1

-- QUERIE 1
select Dname, count(*) as quantidade from employee, department where Dno = Dnumber  group by Dno;
explain select Dname, count(*) as quantidade from employee, department where Dno = Dnumber  group by Dno;

alter table employee add index inde_dno (Dno);
-- Diminui o número de ROWS DE 8 PARA 2;
alter table department add index ind_Dnumber (Dnumber);
-- NÃO AFETA O NÚMERO DE ROWS;

alter table employee drop index inde_dno;
alter table department drop index ind_Dnumber;





-- QUERIE 2
SHOW INDEX FROM dept_locations;

select l.Dlocation, d.Dname from dept_locations as l, department as d where l.Dnumber = d.Dnumber;
explain select l.Dlocation, d.Dname from dept_locations as l, department as d where l.Dnumber = d.Dnumber;

alter table department add index ind_Dname (Dname);
-- Index para department não altera o número de rows;
-- Dept_locations Já possui índices PK;





-- querie da 3
select Dname as Department, concat(fname, ' ', minit, ' ', lname) as Empregado from employee, department where Dno = Dnumber order by Dname;
explain select Dname as Department, concat(fname, ' ', minit, ' ', lname) as Empregado from employee, department where Dno = Dnumber order by Dname;

show index from employee;
show index from department;

alter table department add index index_dno (Dnumber);
alter table employee add index index_dnumber (Dno);

-- Nenhum dos indices diminui o número de rows, pois todos os registros devem ser lidos na query;





-- PARTE 2

use ecommerce;
show tables;
select * from clients;


delimiter //
create procedure p (in acao int)

begin
	case
		when acao = 1 then select * from clients;
        when acao = 2 then update clients set CPF = 99999999999 where idClient = 5;
        when acao = 3 then delete from clients where idClient = 5;
        end case;
end //
delimiter ;

drop procedure p;

call p (1);