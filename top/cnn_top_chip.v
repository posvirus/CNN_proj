module cnn_top_chip(
    //clkgen
	clk_signal_ext,rst_n,clk_div1024_out,     
    //cnn	
	write_en,
	//scan
	phi,phib,phi_out,scan_i0o1,load,scan_in,scan_out,phib_out,scan_i0o1_out,load_out  //scan
);


//IO pad
input clk_signal_ext,rst_n;
input write_en;
input phi,phib,scan_i0o1,load,scan_in;
output scan_out,phi_out,phib_out,scan_i0o1_out,load_out;
output clk_div1024_out;


//IO wire
wire net_clk_signal_ext, net_rst_n, net_write_en, net_phi, net_phib, net_scan_i0o1, net_load, net_scan_in;
wire net_scan_out, net_phi_out, net_clk_div1024_out, net_phib_out, net_scan_i0o1_out, net_load_out;


HPDWUW1416DGP
    HPDWUW1416DGP_I_clk_signal_ext(.PAD(clk_signal_ext),.C(net_clk_signal_ext),.IE(1'b1)),
    HPDWUW1416DGP_I_rst_n(.PAD(rst_n),.C(net_rst_n),.IE(1'b1)),
    HPDWUW1416DGP_I_write_en(.PAD(write_en),.C(net_write_en),.IE(1'b1)),
    HPDWUW1416DGP_I_phi(.PAD(phi),.C(net_phi),.IE(1'b1)),
    HPDWUW1416DGP_I_phib(.PAD(phib),.C(net_phib),.IE(1'b1)),
    HPDWUW1416DGP_I_scan_i0o1(.PAD(scan_i0o1),.C(net_scan_i0o1),.IE(1'b1)),
    HPDWUW1416DGP_I_load(.PAD(load),.C(net_load),.IE(1'b1)),
    HPDWUW1416DGP_I_scan_in(.PAD(scan_in),.C(net_scan_in),.IE(1'b1));
   
HPDWUW1416DGP
    HPDWUW1416DGP_O_scan_out(.PAD(scan_out),.I(net_scan_out),.OE(1'b1)),
    HPDWUW1416DGP_O_phi_out(.PAD(phi_out),.I(net_phi_out),.OE(1'b1)),
    HPDWUW1416DGP_O_clk_div1024_out(.PAD(clk_div1024_out),.I(net_clk_div1024_out),.OE(1'b1)),
    HPDWUW1416DGP_O_phib_out(.PAD(phib_out),.I(net_phib_out),.OE(1'b1)),
    HPDWUW1416DGP_O_scan_i0o1_out(.PAD(scan_i0o1_out),.I(net_scan_i0o1_out),.OE(1'b1)),
    HPDWUW1416DGP_O_load_out(.PAD(load_out),.I(net_load_out),.OE(1'b1));
	


cnn_top inst_cnn_top(
	//clkgen
	.clk_signal_ext(net_clk_signal_ext),
	.rst_n(net_rst_n),
	.clk_div1024_out(net_clk_div1024_out),   
	//cnn   
	.write_en(net_write_en),
	//scan
	.phi(net_phi),
	.phib(net_phib),
	.phi_out(net_phi_out),
	.scan_i0o1(net_scan_i0o1),
	.load(net_load),
	.scan_in(net_scan_in),
	.scan_out(net_scan_out),
	.phib_out(net_phib_out),
	.scan_i0o1_out(net_scan_i0o1_out),
	.load_out(net_load_out) 
);


endmodule