select
	Keyword,MAX(estavgcpc_usd)
from
	db4
group by
	Keyword
order by
	MAX(estavgcpc_usd) desc