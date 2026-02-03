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
