class wr_gen;
	wr_tx tx;
	task run();
		case(fifo_comm::test_name)
			"FULL":			begin
								fifo_comm::wr_gen_count=`FIFO_SIZE;
								write(`FIFO_SIZE);
				   			end
			"EMPTY":		begin
								fifo_comm::wr_gen_count=`FIFO_SIZE;
								write(`FIFO_SIZE);
				    		end
			"UNDERFLOW":	begin
								fifo_comm::wr_gen_count=`FIFO_SIZE+1;
				        		write(`FIFO_SIZE+1);
							end
			"OVERFLOW":		begin
								fifo_comm::wr_gen_count=`FIFO_SIZE;
				       			write(`FIFO_SIZE);
							end
			"CONCURRENT":	begin
				         		
							end
		endcase
	endtask
	task write(input int N);
		repeat(N)begin
			tx=new();
			assert(tx.randomize()with{tx.wr_en==1'b1;})
			tx.print("wr_gen_tx");
			fifo_comm::wr_gen2bfm.put(tx);
		end
	endtask
endclass
