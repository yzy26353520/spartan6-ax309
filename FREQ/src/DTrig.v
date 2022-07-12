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

module DTrig(
                 input          clk,
                 input          rst_n,
				 input [6:0]    in1,
				 input [6:0]    in2,
				 input [6:0]    in3,
				 input [6:0]    in4,
				 input [6:0]    in5,
				 input [6:0]    in6,
                 output reg[6:0]o1,
                 output reg[6:0]o2,
				 output reg[6:0]o3,
				 output reg[6:0]o4,
				 output reg[6:0]o5,
				 output reg[6:0]o6
                );
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
    else
    begin
        o1 <= in1;
        o2 <= in2;
		o3 <= in3;
		o4 <= in4;
		o5 <= in5;
		o6 <= in6;
    end
end

endmodule 