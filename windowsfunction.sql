/*
SUM(Salary) OVER (PARTITION BY Groupname)
只对PARTITION BY后面的列Groupname进行分组，分组后求解Salary的和。

SUM(Salary) OVER (PARTITION BY Groupname ORDER BY ID)
对PARTITION BY后面的列Groupname进行分组，然后按ORDER BY 后的ID进行排序，然后在组内对Salary进行累加处理。

SUM(Salary) OVER (ORDER BY ID)
只对ORDER BY 后的ID内容进行排序，对排完序后的Salary进行累加处理。

SUM(Salary) OVER ()
对Salary进行汇总处理
*/



/*The cats must be ordered first by breed and second by name. They are about to enter an elevator one by one. When all the cats of the same breed have entered they leave.
https://www.windowfunctions.com/questions/over/1
*/
select name, breed, SUM(weight) OVER(PARTITION BY breed ORDER BY name) from cats 



/*
The cats would like to see the average of the weight of them, the cat just after them and the cat just before them.
The first and last cats are content to have an average weight of consisting of 2 cats not 3.
 https://www.windowfunctions.com/questions/over/2
*/
select name, weight, AVG(WEIGHT) OVER (ORDER BY weight ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS avearge_weight
 from cats 



/*
The cats must be ordered by weight descending and will enter an elevator one by one. We would like to know what the running total weight is.
If two cats have the same weight they must enter separately SHOULD USE ROWS BETWEEN
 https://www.windowfunctions.com/questions/over/3
*/
select name, SUM(weight) OVER(ORDER BY weight desc ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
 from cats 



/*
We would like to find the fattest cat. Order all our cats by weight.

The two heaviest cats should both be 1st. The next heaviest should be 3rd.
*/
select RANK()OVER(ORDER BY weight desc), weight, name
 from cats 
ORDER BY rank, name
