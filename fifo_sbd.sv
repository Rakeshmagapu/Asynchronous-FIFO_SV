class fifo_sbd;
	wr_tx w_tx;
	rd_tx r_tx;
	int value,que[$];
	task run();
		forever begin
			fifo_comm::wr_mon2sbd.get(w_tx);
			w_tx.print("wr_sbd_tx");
			fifo_comm::rd_mon2sbd.get(r_tx);
			r_tx.print("rd_sbd_tx");
			if(w_tx.wr_en==1)que.push_back(w_tx.wdata);
			if(r_tx.rd_en==1) begin
				value=que.pop_front();
				if(r_tx.rdata==value)fifo_comm::matchings++;
				else fifo_comm::mismatchings++;
			end
		end
	endtask
endclass
