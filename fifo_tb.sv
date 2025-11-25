module tb;
	reg wr_clk,rd_clk,rst;
	fifo_env env;
	fifo_intrf pif(wr_clk,rd_clk,rst);
	async_fifo dut(.wr_clk(pif.wr_clk),.rd_clk(pif.rd_clk),.rst(pif.rst),.wr_en(pif.wr_en),.rd_en(pif.rd_en),.wdata(pif.wdata),.rdata(pif.rdata),.full(pif.full),.overflow(pif.overflow),.empty(pif.empty),.underflow(pif.underflow));
	always #5 wr_clk=~wr_clk;
	always #7 rd_clk=~rd_clk;
	initial begin
		wr_clk=0;
		rd_clk=0;
		rst=1;
		repeat(2)@(posedge wr_clk);
		rst=0;
		$value$plusargs("test_name=%0s",fifo_comm::test_name);
		env=new();
		env.run();
	end
	initial begin
		#1000;
		if(fifo_comm::matchings!=0&&fifo_comm::mismatchings==0)$display("test is passed\nmatchings=%0d\tmismatchings=%0d",fifo_comm::matchings,fifo_comm::mismatchings);
		else $display("test is failed\nmatchings=%0d\tmismatchings=%0d",fifo_comm::matchings,fifo_comm::mismatchings);
		$finish;
	end
endmodule
