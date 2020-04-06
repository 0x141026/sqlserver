declare @maxZqpcLjt varchar(50)
declare @maxZqpcCzpj varchar(50)
declare @maxZqpcCzcc varchar(50)
declare @maxZqpcZj varchar(50)
set @maxZqpcLjt=(select max(zqpc) from spjg where sply='凌家塘')
set @maxZqpcLjt=(select max(zqpc) from spjg where sply='常州价格通网平价店')
set @maxZqpcLjt=(select max(zqpc) from spjg where sply='常州价格通网菜场')
set @maxZqpcLjt=(select max(zqpc) from spjg where sply='镇江智慧物价网')
DECLARE @sql VARCHAR(2000);

exec ('
select 
distinct a.spdm,a.spmc,b.jg ljt,c.jg pjd,d.jg cc,e.jg wj from spdz a
left join
(select spmc,min(jg)jg from spjg where sply=''凌家塘''and zqpc='+@maxZqpcLjt+' group by spmc) b
on a.ljt=b.spmc
left join
(select spmc,jg from spjg where zqpc='+@maxZqpcLjt+' and sply=''常州价格通网平价店'') c
on a.czjgt=c.spmc
left join
(select spmc,jg from spjg where zqpc='+@maxZqpcLjt+' and sply=''常州价格通网菜场'') d
on a.czjgt=d.spmc
left join
(select spmc,jg from spjg where zqpc='+@maxZqpcLjt+' and sply=''镇江智慧物价网'') e
on a.zjwjw=e.spmc
')