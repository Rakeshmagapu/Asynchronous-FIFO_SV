class rd_mon;
	rd_tx tx;
	virtual fifo_intrf vif;
	task run();
		vif=tb.pif;
		forever begin
			@(vif.rd_mon_cb);
			if(vif.rd_mon_cb.rd_en==1)begin
				tx=new();
				tx.rd_en=vif.rd_mon_cb.rd_en;
				wait(vif.rd_mon_cb.rdata!=0)
				tx.rdata=vif.rd_mon_cb.rdata;
				tx.empty=vif.rd_mon_cb.empty;
				tx.underflow=vif.rd_mon_cb.underflow;
				tx.print("rd_mon_tx");
				fifo_comm::rd_mon2cov.put(tx);
				fifo_comm::rd_mon2sbd.put(tx);
			end
		end
	endtask
endclass
