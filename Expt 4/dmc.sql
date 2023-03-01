select * from items

insert into items(itemname,effect,itemno) values ('Potion','heal',1);

/*insert into items(itemname,effect) values ('pokeball','catch pokemon');*/ /*must throw error as primary key cannot be null*/

/*insert into items(itemname,effect,itemno) values ('Pokeball','catch pokemon',1);*/ /*must throw error as primary key cannot be duplicate*/

insert into items(itemname,effect,itemno) values ('Pokeball','catch pokemon',2);
update items set itemname='Great Ball' where (itemno=2);
select itemname,effect from items;

insert into items(itemname,effect,itemno) values ('Poke Ball','catch pokemon',3);
insert into items(itemname,effect,itemno) values ('Master Ball','catch pokemon',4);
select itemname,effect from items;

/*lets update all balls*/
update items set effect='catch wild pokemon' where (itemname like '% Ball');
select itemname,effect from items;

/*lets update for a few balls*/
update items set effect='catch strong wild pokemon' where (itemname in ('Great Ball','Master Ball'));

select itemname,effect from items;

insert into items(itemname,effect,itemno) values ('Citrus berry','heal',5);
/*lets see all distinct effects*/
select distinct effect from items

/*lets add some types*/
select * from pokemontype
insert into pokemontype(typeid,typename) values (1,'fire');
insert into pokemontype(typeid,typename) values (2,'water');
insert into pokemontype(typeid,typename) values (3,'grass');
insert into pokemontype(typeid,typename) values (4,'psychic');
insert into pokemontype(typeid,typename) values (5,'rock');
select * from pokemontype

/*lets work on moves*/
alter table pokemonmove add column pp integer;
select * from pokemonmove
insert into pokemonmove (movename,moveid,accuracy,mtype) values ('flamethrower',1,13,1);

/*opps we forgot to add power points to our table*/
update pokemonmove set pp=50 where (moveid=1);

/*lets add more pokemon moves*/
insert into pokemonmove (movename,moveid,accuracy,mtype,pp) values ('water gun',2,23,2,75);
insert into pokemonmove (movename,moveid,accuracy,mtype,pp) values ('ember',3,13,1,80);
insert into pokemonmove (movename,moveid,accuracy,mtype,pp) values ('whirlpool',4,12,2,70);
insert into pokemonmove (movename,moveid,accuracy,mtype,pp) values ('flame blitz',5,17,1,90);
insert into pokemonmove (movename,moveid,accuracy,mtype,pp) values ('razor leaf',6,22,3,50);
insert into pokemonmove (movename,moveid,accuracy,mtype,pp) values ('dream eater',7,20,4,35);
insert into pokemonmove (movename,moveid,accuracy,mtype,pp) values ('stone edge',8,15,5,45);
insert into pokemonmove (movename,moveid,accuracy,mtype,pp) values ('giga drain',9,19,3,45);


/*lets see all strong moves*/	
select movename,accuracy,pp from pokemonmove order by pp ;
select movename,accuracy,pp from pokemonmove order by pp*accuracy ; /*more insightful*/

/*lets see moves whose accuracy  greater than 15*/
select movename, accuracy,pp from pokemonmove where accuracy>15;

/*lets see moves whose accuracy  greater than 10 but less than 20*/
select movename, accuracy,pp from pokemonmove where accuracy>10 and accuracy<20;

/*another way to do the same thing*/
select movename, accuracy,pp from pokemonmove where accuracy between 10 and 20;

/*lets see maximum pp*/
select max(pp) from pokemonmove;

/*lets see minimum pp*/
select min(pp) from pokemonmove;

/*lets see maximum accuracy and pp ratio*/
select max(pp)*max(accuracy) from pokemonmove; /*oops this is  wrong*/
select max(pp*accuracy) from pokemonmove; /*correct one*/

/*lets see move with maximum pp*/
/*select movename from pokemonmove where pp=max(pp); *//*does not work as aggregate functoins are not allowed in where*/

/*lets see average pp*/
select avg(pp) from pokemonmove;

/*lets see the types which have moves above 70 pp*/
select typename from pokemontype where exists (select * from pokemonmove where pp>70 and typeid=mtype); /*used to look at two columns together. First selects all columns as per where condition and then checks for exists. The exists clause checks for all elements in move table which follow the condition and returns true. here the second condition which maps the two tables is important*/

/*avg of pp of moves from every type*/
select avg(pp) from pokemonmove group by mtype; 
