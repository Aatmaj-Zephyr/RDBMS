select * from pokemontype
insert into pokemontype(typeid,typename) values (1,'rock');
create procedure addMove(_movename Varchar(10),_moveID int,_accuracy int,_mtype int)
language plpgsql    
as $$
begin 
insert into pokemonMove(movename,moveID,accuracy,mtype) values (_movename,_moveID,_accuracy,_mtype);
commit;
end
$$
call addMove('stone edge',2,20,1);
select * from pokemonMove;
