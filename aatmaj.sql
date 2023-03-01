    create database pokemonDB;
    create table ability(abilityName varchar(12),abilityNo int,isHidden int,flavourText varchar(50), primary key (abilityNo));
    create table items(itemName Varchar(12), effect varchar(50),itemNo int,primary key (itemNo));
    create table pokemonType(typeID int, primary key (typeID),typeName varchar(12));
    create table pokemonMove(moveName varchar(12),moveID int,accuracy int,mtype int, primary key(moveID),
                    foreign key (mtype) references pokemonType);
    create table pokemon(pokedexNo int,  pokemonName varchar(12),evolvsID int, evolvsFromID int, abilityNo int, pType int, Stype int,
                        primary key(pokedexNo), 
                        foreign key(evolvsID) references pokemon,
                        foreign key(evolvsFromID) references pokemon, 
                        foreign key(abilityNo) references ability,
                        foreign key(pType) references pokemonType,
                        foreign key(Stype) references pokemonType);	
    create table moveSet(moveID int,pokedexNo int,
                        foreign key (moveID) references pokemonMove,
                        foreign key (pokedexNo) references pokemon);
   
    create table holds(holderID int,  itemID int, foreign key (holderID) references pokemon, foreign key (itemID) references items);
    
