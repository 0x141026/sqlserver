SELECT    b.bz, a.bjh, a.xmmc, substring(convert(varchar,a.skrq,23),0,5)+'��'+substring(convert(varchar,a.skrq,23),6,2)+'��'+substring(convert(varchar,a.skrq,23),9,2)+'�ա�'+datename(weekday, a.skrq) skrq
		FROM         pxb_pxkb a ,pxb_pxxm b
		where a.bjh='20190501' and a.bjh =b.bjh --and a.xmmc=b.xmmc
		group by a.bjh,convert(varchar,a.skrq,23),datename(weekday, a.skrq),a.xmmc,b.bz
		order by convert(varchar,a.skrq,23)


		--select a.* from  pxb_pxkb a 
        
		--ע�⣺���from�е��Ӳ�ѯ��û���õ��ۼ���������ô�Ӳ�ѯ���ɵ���ʱ��������Բ�ָ��������
		--����113ҳ�ײ���
		--		select Sno, Cno
		--      from SC, (select Sno, AVG(Grade) from SC group by Sno)
		--		as Svg_sc(avg_sno, avg_grade)
		-- 		where SC.sno=Avg_sc.avg_sno and SC.Grade>=Avg_sc.avg_grade
		
--������Ӳ�ѯû�оۼ����������Բ���Ҫָ��AS		
		select tb.* ,b.bz from (
		SELECT     a.bjh, a.xmmc, substring(convert(varchar,a.skrq,23),0,5)+'��'+substring(convert(varchar,a.skrq,23),6,2)+'��'+substring(convert(varchar,a.skrq,23),9,2)+'�ա�'+datename(weekday, a.skrq) skrq
		FROM         pxb_pxkb a  
		where a.bjh='20190501'
		group by a.bjh,convert(varchar,a.skrq,23),datename(weekday, a.skrq),a.xmmc
		--order by convert(varchar,a.skrq,23)
		)tb
		left join pxb_pxxm b on tb.bjh=b.bjh
		order by convert(varchar,tb.skrq,23)