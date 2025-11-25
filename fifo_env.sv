class fifo_env;
	wr_agent w_agent;
	rd_agent r_agent;
	fifo_sbd sbd;
	task run();
		w_agent=new();
		r_agent=new();
		sbd=new();
		fork
			w_agent.run();
			r_agent.run();
			sbd.run();
		join
	endtask
endclass
