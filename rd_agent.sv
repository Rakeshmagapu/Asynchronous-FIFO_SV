class rd_agent;
	rd_gen gen;
	rd_bfm bfm;
	rd_mon mon;
	rd_cov cov;
	task run();
		gen=new();
		bfm=new();
		mon=new();
		cov=new();
		fork 
			gen.run();
			bfm.run();
			mon.run();
			cov.run();
		join
	endtask
endclass
