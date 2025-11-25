class wr_tx;
	rand bit wr_en;
	bit full,overflow;
	rand bit [`WIDTH-1:0]wdata;
	function void print(input string str="wr_tx");
		$display("%0t:----------------%0s------------",$time,str);
		$display("wr_en=%0d",wr_en);
		$display("wdata=%0d",wdata);
		$display("full=%0d",full);
		$display("overflow=%0d",overflow);
	endfunction
endclass
