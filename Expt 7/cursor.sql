select * from pokemonMove;
drop function  cursormaker();
create function cursormaker()  returns refcursor
as $$
declare   highAccc cursor for select * from pokemonMove where accuracy>20;
begin 
open highAccc ;
return (highAccc);
close highAccc;
end
$$ language plpgsql;

DO $$ 
DECLARE
   counter    INTEGER ;
    cur refcursor;
   begin
   perform cursormaker();
  cur := cursormaker();
   FETCH FROM cur INTO counter;
    CLOSE cur;
END $$;
