class fifo_comm;
	static string test_name;
	static int wr_gen_count,wr_bfm_count;
	static mailbox wr_gen2bfm=new();
	static mailbox rd_gen2bfm=new();
	static mailbox wr_mon2cov=new();
	static mailbox wr_mon2sbd=new();
	static mailbox rd_mon2cov=new();
	static mailbox rd_mon2sbd=new();
	static int matchings,mismatchings;
endclass
