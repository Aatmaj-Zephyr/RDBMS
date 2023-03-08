
/*inner join using where */
select typename,movename
from pokemontype, pokemonmove
where typeid=mtype


/*inner join using join */
select typename,movename
from pokemontype join pokemonmove
on typeid=mtype

/*cartesian product*/
select typename,movename
from pokemontype natural join pokemonmove;

/*cartesian product using where*/
select typename,movename
from pokemontype , pokemonmove;

/*making a veiw from the cartesian product*/	
create view cartesian as
select typename,movename
from pokemontype , pokemonmove;

select * from cartesian
where typename='water'

/*left join*/
insert into pokemontype(typeId,typename) values (6,'normal');

select * 
from pokemontype left join pokemonmove
on mtype=typeid;
