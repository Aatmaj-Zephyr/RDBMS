explain analyze select * from ability;
create table abcd(abc varchar(25));
alter table abcd 
add column efgh varchar(25) ;
select * from abcd;
INSERT INTO abcd 
  SELECT i, substr(md5(random()::text),1,10)
  FROM generate_series(1, 10) AS i;
EXPLAIN analyze SELECT * FROM abcd;
