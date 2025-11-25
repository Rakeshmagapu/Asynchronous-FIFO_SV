interface fifo_intrf(input reg wr_clk,rd_clk,rst);
	bit wr_en,rd_en,empty,overflow,full,underflow;
	bit [`WIDTH-1:0] wdata,rdata;
	clocking wr_bfm_cb @(posedge wr_clk);
		default input #0 output #1;
		input full,overflow;
		output wr_en,wdata;
	endclocking
	clocking rd_bfm_cb @(posedge rd_clk);
		default input #0 output #1;
		input rdata,empty,underflow;
		output rd_en;
	endclocking
	clocking wr_mon_cb @(posedge wr_clk);
		default input #1;
		input full,overflow,wr_en,wdata;
	endclocking
	clocking rd_mon_cb @(posedge rd_clk);
		default input #1;
		input rdata,empty,underflow,rd_en;
	endclocking
endinterface
