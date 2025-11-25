class wr_bfm;
	wr_tx tx;
	virtual fifo_intrf vif;
	task run();
		vif=tb.pif;
		forever begin
			fifo_comm::wr_gen2bfm.get(tx);
			drive_tx(tx);
			fifo_comm::wr_bfm_count++;
			tx.print("wr_bfm_tx");
		end
	endtask
	task drive_tx(input wr_tx tx);
		@(vif.wr_bfm_cb);
		vif.wr_bfm_cb.wr_en<=tx.wr_en;
		wait(tx.wr_en!=0&&tx.wdata!=0);
		vif.wr_bfm_cb.wdata<=tx.wdata;
		tx.full=vif.wr_bfm_cb.full;;
		tx.overflow=vif.wr_bfm_cb.overflow;
		@(vif.wr_bfm_cb);
		vif.wr_bfm_cb.wr_en<=0;
		vif.wr_bfm_cb.wdata<=0;
	endtask
endclass
