`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
//                                                                              //
//  Author: meisq                                                               //
//          msq@qq.com                                                          //
//          ALINX(shanghai) Technology Co.,Ltd                                  //
//          heijin                                                              //
//     WEB: http://www.alinx.cn/                                                //
//     BBS: http://www.heijin.org/                                              //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
// Copyright (c) 2017,ALINX(shanghai) Technology Co.,Ltd                        //
//                    All rights reserved                                       //
//                                                                              //
// This source file may be used and distributed without restriction provided    //
// that this copyright statement is not removed from the file and that any      //
// derivative work contains the original copyright notice and the associated    //
// disclaimer.                                                                  //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

//==========================================================================
//  Revision History:
//  Date          By            Revision    Change Description
//--------------------------------------------------------------------------
//  2017/6/19     meisq         1.0         Original
//*************************************************************************/

module CMPTrig(
                 input          clk,
                 input          rst_n,
				 input [6:0]    in1,
				 input [6:0]    in2,
				 input [6:0]    in3,
				 input [6:0]    in4,
				 input [6:0]    in5,
				 input [6:0]    in6,
				 input [31:0]   bin,
                 output reg[6:0]o1,
                 output reg[6:0]o2,
				 output reg[6:0]o3,
				 output reg[6:0]o4,
				 output reg[6:0]o5,
				 output reg[6:0]o6
                );

reg[31:0] last;
reg[31:0] now;

reg[6:0]mid1;
reg[6:0]mid2;
reg[6:0]mid3;
reg[6:0]mid4;
reg[6:0]mid5;
reg[6:0]mid6;

always@(posedge clk) 
begin
    if(rst_n==0)
    begin
        last <= 32'd0;
        now <= 32'd0;
    end
    else
    begin
        now <= bin;
        last <= now;
    end
end

always@(posedge clk) 
begin
    if(rst_n==0)
    begin
        mid1 <= 7'd0;
		mid2 <= 7'd0;
		mid3 <= 7'd0;
		mid4 <= 7'd0;
		mid5 <= 7'd0;
		mid6 <= 7'd0;
    end
    else
    begin
        mid1 <= in1;
        mid2 <= in2;
		mid3 <= in3;
		mid4 <= in4;
		mid5 <= in5;
		mid6 <= in6;
    end
end

always@(posedge clk) 
begin
    if(rst_n==0)
    begin
        o1 <= 7'd0;
        o2 <= 7'd0;
		o3 <= 7'd0;
		o4 <= 7'd0;
		o5 <= 7'd0;
		o6 <= 7'd0;
    end
    else if(now == 32'd0)
    begin
        o1 <= mid1;
        o2 <= mid2;
		o3 <= mid3;
		o4 <= mid4;
		o5 <= mid5;
		o6 <= mid6;
    end
end

endmodule 