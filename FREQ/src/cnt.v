
module cnt(
                 input          clk,
                 input          rst_n,
                 //input          clr,   //Counter synchronous reset   
                 output reg[3:0]data,  //counter value
                 output reg     t,      // carry enable signal
				 output reg[31:0] bin
                );

always@(posedge clk or negedge rst_n) 
begin
    if(rst_n==0)
    begin
        data <= 4'd0;
        t <= 1'd0;
    end

    else
    begin
        if(data==4'd9)
        begin
            t<= 1'b1;    //Counter to 9 to generate carry
            data <= 4'd0;//Counter to 9 reset
        end
        else
        begin
            t <= 1'b0;
            data <= data + 4'd1;
        end
    end
end

always@(posedge clk or negedge rst_n) 
begin
    if(rst_n==0)
    begin
		bin <= 32'b0;
    end

    else
    begin
        bin <= bin + 32'b1;
    end
end

endmodule 