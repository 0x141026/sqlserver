declare @maxZqpcLjt varchar(50)
declare @maxZqpcCzpj varchar(50)
declare @maxZqpcCzcc varchar(50)
declare @maxZqpcZj varchar(50)
set @maxZqpcLjt=(select max(zqpc) from spjg where sply='�����')
set @maxZqpcLjt=(select max(zqpc) from spjg where sply='���ݼ۸�ͨ��ƽ�۵�')
set @maxZqpcLjt=(select max(zqpc) from spjg where sply='���ݼ۸�ͨ���˳�')
set @maxZqpcLjt=(select max(zqpc) from spjg where sply='���ǻ������')
DECLARE @sql VARCHAR(2000);

exec ('
select 
distinct a.spdm,a.spmc,b.jg ljt,c.jg pjd,d.jg cc,e.jg wj from spdz a
left join
(select spmc,min(jg)jg from spjg where sply=''�����''and zqpc='+@maxZqpcLjt+' group by spmc) b
on a.ljt=b.spmc
left join
(select spmc,jg from spjg where zqpc='+@maxZqpcLjt+' and sply=''���ݼ۸�ͨ��ƽ�۵�'') c
on a.czjgt=c.spmc
left join
(select spmc,jg from spjg where zqpc='+@maxZqpcLjt+' and sply=''���ݼ۸�ͨ���˳�'') d
on a.czjgt=d.spmc
left join
(select spmc,jg from spjg where zqpc='+@maxZqpcLjt+' and sply=''���ǻ������'') e
on a.zjwjw=e.spmc
')