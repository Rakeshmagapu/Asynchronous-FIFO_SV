class wr_agent;
	wr_gen gen;
	wr_bfm bfm;
	wr_mon mon;
	wr_cov cov;
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
