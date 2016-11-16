--select COUNT(*) from urls1
--select COUNT(*) from urls2
--select COUNT(*) from urls3

/*
insert into url
select * from urls

(
select * from urls1
union all
select * from urls2
union all
select * from urls3
) x
*/


--select COUNT(*) from urls1
--select COUNT(*) from urls2
--select COUNT(*) from urls3
begin tran
update
	url
set
	title = replace(title + ' - ' + replace(left(url,PATINDEX('%,http%',url)-1),', ',' - '),'  ',' ')
	,url = right(url,len(url)-PATINDEX('%,http%',url))
where
	url not like 'http://%'
	rollback tran