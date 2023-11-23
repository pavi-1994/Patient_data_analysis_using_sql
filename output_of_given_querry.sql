/*Table X:
Columns: ids with values 1, 1, 1, 1
Table Y:
Columns: ids with values 1, 1, 1, 1, 1, 1, 1, 1

Task: Determine the count of rows in the output of the following queries:

Select * From X join Y on X.ids != Y.ids

Select * From X left join Y on X.ids != Y.ids

Select * From X right join Y on X.ids != Y.ids
*/
Select * From X join Y on X.ids != Y.ids

-- output will give zero rows   since all the values are same

Select * From X left join Y on X.ids != Y.ids
-- output will give 4 rows
-- output will be same as no of rows from X

Select * From X right join Y on X.ids != Y.ids

-- output will give 8 rows
-- output will be same as no of rows from Y