SELECT *
from Library as lib
where libraryID = 1
union all
SELECT *
FROM Library as lib
where parentId = 1;


with recursive cte as (select *, 1 as level
                       from Library
                       where libraryID = 1
                       union all
                       select lib.*, t.level + 1 as lvl 
                       from Library as lib
                                join cte as t on t.libraryID = lib.parentId)
select *
from cte;


with recursive cte as (select *, 1 as level
                       from Library
                       where parentId is null 
                       union all
                       select lib.*, t.level + 1 as lvl 
                       from Library as lib
                                join cte as t on t.libraryID = lib.parentId
                       where t.level < 2 
)
select *
from cte;

with recursive cte as (select *, 1 as level, libraryID::text as path 
                       from Library
                       where parentId is null
                       union all
                       select lib.*,
                              t.level + 1                         as lvl,
                              concat(t.path, ' -> ', lib.libraryID) as path 
                       from Library as lib
                                join cte as t on t.libraryID = lib.parentId)
select *
from cte;

