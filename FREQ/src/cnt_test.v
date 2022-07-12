`timescale 1ns / 1ps

module cnt_test(
                input      clk,
				input      in,
                input      rst_n,
                output[5:0]seg_sel,
                output[7:0]seg_data
                );
					 
reg[31:0] timer_cnt;
reg en_1hz;                          //1 second , 1 counter enable
always@(posedge clk)
begin
    if(rst_n == 1'b0)
    begin
        en_1hz <= 1'b0;
        timer_cnt <= 32'd0;
    end
    else if(timer_cnt >= 32'd49_999_999)
    begin
        en_1hz <= 1'b1;
        timer_cnt <= 32'd0;
    end
    else
    begin
        en_1hz <= 1'b0;
        timer_cnt <= timer_cnt + 32'd1; 
    end
end


wire[3:0] count0;
wire t0;
wire sig_rst;
wire bin_wire;

cnt count10_m0(
    .clk    (in),
    .rst_n  (~en_1hz),
    //.clr   (1'b0),
	//.clr   (en_1hz),
    .data   (count0),
    .t      (t0),
	.bin    (bin_wire)
 );
wire[3:0] count1;
wire t1;
cnt count10_m1(
     .clk    (t0),
     .rst_n  (~en_1hz),
     //.clr   (1'b0),
	//.clr   (en_1hz),
     .data   (count1),
     .t      (t1)
 );

wire[3:0] count2;
wire t2;
cnt count10_m2(
    .clk   (t1),
    .rst_n  (~en_1hz),
    //.clr   (1'b0),
	//.clr   (en_1hz),
	.data  (count2),
    .t     (t2)
);

wire[3:0] count3;
wire t3;
cnt count10_m3(
    .clk   (t2),
    .rst_n  (~en_1hz),
    //.clr   (1'b0),
	//.clr   (en_1hz),
    .data  (count3),
    .t     (t3)
);

wire[3:0] count4;
wire t4;
cnt count10_m4(
    .clk   (t3),
    .rst_n  (~en_1hz),
    //.clr   (1'b0),
	//.clr   (en_1hz),
    .data  (count4),
    .t     (t4)
);

wire[3:0] count5;
wire t5;
cnt count10_m5(
    .clk   (t4),
    .rst_n  (~en_1hz),
    //.clr   (1'b0),
	//.clr   (en_1hz),
    .data  (count5),
    .t     (t5)
);

wire[6:0] seg_data_0;
seg_decoder seg_decoder_m0(
    .bin_data  (count5),
    .seg_data  (seg_data_0)
);
wire[6:0] seg_data_1;
seg_decoder seg_decoder_m1(
    .bin_data  (count4),
    .seg_data  (seg_data_1)
);
wire[6:0] seg_data_2;
seg_decoder seg_decoder_m2(
    .bin_data  (count3),
    .seg_data  (seg_data_2)
);
wire[6:0] seg_data_3;
seg_decoder seg_decoder_m3(
    .bin_data  (count2),
    .seg_data  (seg_data_3)
);
wire[6:0] seg_data_4;
seg_decoder seg_decoder_m4(
    .bin_data  (count1),
    .seg_data  (seg_data_4)
);

wire[6:0] seg_data_5;
seg_decoder seg_decoder_m5(
    .bin_data  (count0),
    .seg_data  (seg_data_5)
);

wire[6:0] out1;
wire[6:0] out2;
wire[6:0] out3;
wire[6:0] out4;
wire[6:0] out5;
wire[6:0] out6;
CMPTrig dtrig_0(
        .clk   (en_1hz),
        .rst_n (rst_n),
		.in1   (seg_data_0),
		.in2   (seg_data_1),
		.in3   (seg_data_2),
		.in4   (seg_data_3),
		.in5   (seg_data_4),
		.in6   (seg_data_5),
		.bin   (bin_wire),
        .o1    (out1),
        .o2    (out2),
		.o3    (out3),
		.o4    (out4),
		.o5    (out5),
		.o6    (out6)
                );
				
seg_scan seg_scan_m0(
    .clk        (clk),
    .rst_n      (rst_n),
    .seg_sel    (seg_sel),
    .seg_data   (seg_data),
    .seg_data_0 ({1'b1,out1}),      //The  decimal point at the highest bit,and low level effecitve
    .seg_data_1 ({1'b1,out2}), 
    .seg_data_2 ({1'b0,out3}),
    .seg_data_3 ({1'b1,out4}),
    .seg_data_4 ({1'b1,out5}),
    .seg_data_5 ({1'b1,out6})
);
endmodule 