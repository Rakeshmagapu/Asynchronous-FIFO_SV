class wr_cov;
	wr_tx tx;
	covergroup cg;
		WR_EN:coverpoint tx.wr_en{
				bins WRITES={1'b1};
		}
	endgroup
	function new();
		cg=new();
	endfunction
	task run();
		forever begin
			fifo_comm::wr_mon2cov.get(tx);
			tx.print("wr_cov_tx");
			cg.sample();
		end
	endtask
endclass
