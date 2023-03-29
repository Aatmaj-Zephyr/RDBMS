DROP DATABASE "AAtmaj";
CREATE DATABASE "AAtmaj";
drop table updates;
create table svvcred(netid varchar(15),  idno varchar(15),primary key(idno));
insert into svvcred (netid,idno) values('aatmaj.m','16010121110');
create table updates(foreign key (idno) references svvcred(idno),idno varchar(15), updatedtime timestamp(6));
create function updatecheckk()
returns trigger as
$body$
begin
	if(old.netid<>new.netid) then
		
	insert into updates(idno,updatedtime) values(old.idno,now());
	end if;
	return new;
	end
	$body$
	language plpgsql;
	
create trigger updattion
before update
on svvcred
for each row
execute procedure updatecheckk();

update svvcred
set netid ='aa'
where netid = 'aatmaj.m';

select * from svvcred;
select * from updates ;

	
