class rd_gen;
	rd_tx tx;
	task run();
		case(fifo_comm::test_name)
			"FULL":		 begin
				   		 end
			"EMPTY":	 begin
							wait(fifo_comm::wr_gen_count==fifo_comm::wr_bfm_count);
				    	 	read(`FIFO_SIZE);
						 end
			"OVERFLOW":	 begin
				   	   	 end
			"UNDERFLOW": begin
						 	read(`FIFO_SIZE+1);
						 end
			"CONCURRENT":begin
				   		 end
		endcase
	endtask
	task read(input int N);
		repeat(N)begin
			tx=new();
			assert(tx.randomize()with{tx.rd_en==1'b1;})
			tx.print("rd_gen_tx");
			fifo_comm::rd_gen2bfm.put(tx);
		end
	endtask
endclass
