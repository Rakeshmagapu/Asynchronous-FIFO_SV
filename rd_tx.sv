class rd_tx;
	rand bit rd_en;
	bit empty,underflow;
	bit [`WIDTH-1:0] rdata;
	function void print(input string str="rd_tx");
		$display("%0t:----------------------%0s------------------",$time,str);
		$display("rd_en=%0d",rd_en);
		$display("rdata=%0d",rdata);
		$display("empty=%0d",empty);
		$display("underflow=%0d",underflow);
	endfunction
endclass
