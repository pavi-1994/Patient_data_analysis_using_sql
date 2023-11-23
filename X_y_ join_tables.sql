/*Table X:
Columns: ids with values 10, 20, 30, 40, 50, null, 60, 70, 80, null, 90, 100
Table Y:
Columns: ids with values 20, null, 40, 60, null, 80, 100, null
Task: Use SQL to demonstrate the results of an inner join, left join, right join, and full outer join between these tables.
*/
create Database sampleDb;
Use sampleDb;

create table X(
id int)
;

insert into X values
 (10), 
 (20),
 (30), 
 (40),
 (50),
 (NULL),
 (60), 
 (70), 
 (80),
 (NULL), 
 (90),
 (100);


create table Y(
Y_id int )
;

insert into Y values
(20), 
(null),
( 40), 
(60), 
(null), 
(80), 
(100),
 (null);
 
 # left joining
 SELECT 
    id, Y_id
FROM
    X
        LEFT JOIN
    Y ON X.id = Y.Y_id;
 
 # right Join
SELECT 
    id,Y_id
FROM
    X
        RIGHT JOIN
    Y ON X.id = Y.Y_id;
 
 #inner join
SELECT 
    id, Y_id
FROM
    X
        INNER JOIN
    Y ON X.id = Y.Y_id;
    
    # full outer join
SELECT 
    COALESCE(X.id, Y.Y_id) AS combined_id
FROM
    X
FULL JOIN
    Y ON X.id = Y.Y_id;
 
 
 
 