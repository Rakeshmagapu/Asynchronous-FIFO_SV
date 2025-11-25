class rd_cov;
	rd_tx tx;
	covergroup cg;
		RD_EN:coverpoint tx.rd_en{
				bins READS={1'b1};
		}
	endgroup
	function new();
		cg=new();
	endfunction
	task run();
		forever begin
			fifo_comm::rd_mon2cov.get(tx);
			tx.print("rd_cov_tx");
			cg.sample();
		end
	endtask
endclass
