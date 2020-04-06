SELECT    b.bz, a.bjh, a.xmmc, substring(convert(varchar,a.skrq,23),0,5)+'年'+substring(convert(varchar,a.skrq,23),6,2)+'月'+substring(convert(varchar,a.skrq,23),9,2)+'日　'+datename(weekday, a.skrq) skrq
		FROM         pxb_pxkb a ,pxb_pxxm b
		where a.bjh='20190501' and a.bjh =b.bjh --and a.xmmc=b.xmmc
		group by a.bjh,convert(varchar,a.skrq,23),datename(weekday, a.skrq),a.xmmc,b.bz
		order by convert(varchar,a.skrq,23)


		--select a.* from  pxb_pxkb a 
        
		--注意：如果from中的子查询块没有用到聚集函数，那么子查询生成的临时派生表可以不指定属性列
		--比如113页底部：
		--		select Sno, Cno
		--      from SC, (select Sno, AVG(Grade) from SC group by Sno)
		--		as Svg_sc(avg_sno, avg_grade)
		-- 		where SC.sno=Avg_sc.avg_sno and SC.Grade>=Avg_sc.avg_grade
		
--下面的子查询没有聚集函数，所以不需要指定AS		
		select tb.* ,b.bz from (
		SELECT     a.bjh, a.xmmc, substring(convert(varchar,a.skrq,23),0,5)+'年'+substring(convert(varchar,a.skrq,23),6,2)+'月'+substring(convert(varchar,a.skrq,23),9,2)+'日　'+datename(weekday, a.skrq) skrq
		FROM         pxb_pxkb a  
		where a.bjh='20190501'
		group by a.bjh,convert(varchar,a.skrq,23),datename(weekday, a.skrq),a.xmmc
		--order by convert(varchar,a.skrq,23)
		)tb
		left join pxb_pxxm b on tb.bjh=b.bjh
		order by convert(varchar,tb.skrq,23)