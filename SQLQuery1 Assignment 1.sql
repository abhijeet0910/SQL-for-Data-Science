--What is the total number of runs scored by Virat/Sachin?
Select sum(Runs_Scored) as Total_Runs from Sachin_Scores
--by Virat
Select sum(runs) as Total_Runs from Virat_Scores
--what is the strike rate of virat
select (sum(cast(runs as float))/sum(balls))*100 as strike_rate from Virat_Scores
--What is highest score of sachin
select Max(Runs_Scored) as Highest_Score from Sachin_Scores
--What is lowest score of virat
select Min(runs) as Lowest_Score from Virat_Scores
--Against which country does Virat have the highest no. of centuries
select * from (select versus, count(versus) as no_hundreds from Virat_Scores
 where runs>= 100 group by versus)
 as a1 order by no_hundreds DESC
 --Against which country does Sachin have lowest no. of fifties?
 select * from (select Match_Versus, count(Match_Versus) as no_fifties from Sachin_Scores 
where Runs_Scored >= 50 and Runs_Scored < 100 group by Match_Versus) as a5 order by no_fifties
--In which game did Sachin achieve his 10000 ODI runs


--By which game did Virat cross an average of 50


--Which are the top 3 countries by runs scored by Sachin?
select sum(Runs_Scored) as Total_Runs, Match_Versus from Sachin_Scores
 group by Match_Versus order by Total_Runs desc
 --Which are the bottom 3 countries by the runs scored by Virat?
 select sum(runs) as Total_Runs, versus from Virat_Scores where versus <> 'Afghanistan'
 group by versus order by Total_Runs 