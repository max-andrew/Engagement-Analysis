--Monthly mobile engagement data

/*
	Determine the average amount of time spent on the site by each user by using the campaign_daily_stats table.
	Group the results into orderer, monthly increments from the past year.
	Ensure that only mobile data is queried.
*/

select sum(time_spent) / sum(views) as mobile_avg_time,
date_part('month', date) as month
from campaign_daily_stats
where date >= (date('now') - interval '1 year') 
and is_mobile
group by date_part('month', date)
order by month;