--Hook percentage engagement data

/*
	Determine the percent of users that engage with -- or are hooked by -- the campaign using the campaign_daily_stats table.
	Group the results into orderer, monthly increments from the past year.
	Display only desktop data.
*/

select ((sum(hooks)*100 / sum(views)*100))/100 as hook_perc, 
date_part('month', date) as month 
from campaign_daily_stats 
where date >= (date('now') - interval '1 year') 
and is_mobile=false 
group by date_part('month', date) order by month;