`timescale 1ns / 1ps
module tb_ram( );

reg			sys_clk;
reg			rst_n;
wire[10:0]	addr;
wire		wr_en	;
wire[7:0]	ram_data_out;
wire[7:0]	data_out_rom;
wire[9:0]	addr_out_delay;

initial
	begin
		sys_clk=1'b1;
		rst_n<=1'b0;
		//wr_en<=1'b1;
		#40
		rst_n<=1'b1;
	end
always #10 sys_clk=~sys_clk;
/*
always@(posedge sys_clk or negedge rst_n)
	if(rst_n==1'b0) begin
		wr_en<=1'd1;
		addr<=10'd0;
		end
	else if(addr==10'd1023) begin
		addr<=10'd0;
		wr_en<=~wr_en;
		end
	else
		addr<=addr+1'd1;

//assign data_in=(wr_en==1'b1)?addr:8'd0;

wire[7:0]	rom_data_byte;


s_ram_8x256 ram_inst(
  .clka		(sys_clk	),    // input wire clka
  .wea		(wr_en	),      // input wire [0 : 0] wea
  .addra	(addr	),  // input wire [7 : 0] addra
  .dina		(rom_data_byte	),    // input wire [7 : 0] dina
  .douta	(ram_data_out)  // output wire [7 : 0] douta
);

rom_8x256 rom_inst1(
  .clka		(sys_clk),    // input wire clka
  .addra	(addr),  // input wire [7 : 0] addra
  .douta	(rom_data_byte)  // output wire [7 : 0] douta
);
*/
ram ram_inst(
	.clk		(sys_clk),
	.rst_n		(rst_n),
	.data_out	(ram_data_out),
	.wr_en_out	(wr_en),
	.data_out_rom(data_out_rom),
	.addr_out	(addr),
	.addr_out_delay(addr_out_delay)
);

endmodule
