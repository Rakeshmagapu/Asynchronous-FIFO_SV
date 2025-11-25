class rd_bfm;
	rd_tx tx;
	virtual fifo_intrf vif;
	task run();
		vif=tb.pif;
		forever begin
			fifo_comm::rd_gen2bfm.get(tx);
			drive_tx(tx);
			tx.print("rd_bfm_tx");
		end
	endtask
	task drive_tx(input rd_tx tx);
		@(vif.rd_bfm_cb);
		vif.rd_bfm_cb.rd_en<=tx.rd_en;
		wait(vif.rd_bfm_cb.rdata!=0&&vif.rd_bfm_cb.rd_en!=0);
		tx.rdata=vif.rd_bfm_cb.rdata;
		tx.empty=vif.rd_bfm_cb.empty;
		tx.underflow=vif.rd_bfm_cb.underflow;
		@(vif.rd_bfm_cb);
		vif.rd_bfm_cb.rd_en<=0;
	endtask
endclass
