declare @tb1 varchar(max)
declare @tb2 varchar(max)

declare @i int

set @i=1
while (@i<63)
	begin
		set @tb1=(select top 1 name from( select top (@i) name from sys.tables where name LIKE '%cg_%' order by name desc) a order by name)
        set @tb2=(select top 1 name from( select top (@i) name from server.cgdata.sys.tables where name LIKE '%cg_%' order by name desc) a order by name)
		if exists(Select [name] From sysColumns Where id=object_id(N'' + @tb1 + '') and Status=128)
		--print(1)
			begin
			exec('set identity_insert '+ @tb1+' ON')
			exec ('insert into '+@tb1+ ' select * from server.cgdata.dbo.'+@tb2)
			exec('set identity_insert '+ @tb1+' OFF')
			end
		else 
		--exec ('insert into '+@tb1+ ' select * from server.cgdata.dbo.'+@tb2)	
		
		set @i=@i+1
		--print(@tb1)
	end

insert into  cg_wj_zg select * from server.cgdata.dbo.cg_wj_zg

