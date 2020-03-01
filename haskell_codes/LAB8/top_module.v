`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    15:22:14 03/11/2019
// Design Name:
// Module Name:    interface
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module top_module(clk, PB1, PB2, A, LCD_RS, LCD_W, LCD_E, data);
    
    input clk, PB1, PB2;
    input [3:0] A;
   
    reg [3:0] counter;
    reg [2:0] state;
    reg [4:0] cycle_counter;
    reg [4:0] read_port1;
    reg [4:0] read_port2;
    reg [4:0] write_port;
    reg [15:0] write_A;
   
    reg valid_port1, valid_port2, valid_port3, en;
    reg [15:0] output_line1, output_line2;
 
    reg [15:0] read_A1;
    reg [15:0] read_A2;
    reg [3:0] shift;
 
    reg [127:0] line1, line2;
     
    output LCD_RS, LCD_W, LCD_E;
    wire LCD_RS, LCD_W, LCD_E;
    output [3:0] data;
    wire [3:0] data;
     
     initial begin
        counter <= 4'b0;
        state <= 3'b0;
        cycle_counter <= 5'b0;
        read_port1 <= 5'b0;
        read_port2 <= 5'b0;
        write_port <= 5'b0;
        write_A <= 16'b0;
        valid_port1 <= 0;
        valid_port2 <= 0;
        valid_port3 <= 0;
        en <= 0;
        shift <= 4'b0;
        output_line1 <= "                ";
        output_line2 <= "                ";
        line1 <= "                ";
        line2 <= "                ";
     end
     
    lcd_driver LDrv(clk, line1, line2, LCD_RS, LCD_W, LCD_E, data);
 
    interface RF(clk, read_port1, read_port2, write_port, write_A, valid_port1,
                 valid_port2, valid_port3, read_A1, read_A2);
 
    always @(posedge PB1) begin
        counter <= 0;
        state <= A[3:1];
    end
 
    always @(posedge PB2) begin

        if(state == 0) begin
            if (counter == 0) begin
                write_port[4:1] <= A;
            end
            if (counter == 1) begin
                write_port[0] <= A[3];
            end
            if (counter == 2) begin
                write_A_t[15:12] <= A;
            end
            if (counter == 3) begin
                write_A_t[11:8] <= A;
            end
            if (counter == 4) begin
                write_A_t[7:4] <= A;
            end
            if (counter == 5) begin
                write_A_t[3:0] <= A;
            end
            if (counter == 6) begin
                en <= 1;
            end
        end
 
        if(state == 1) begin
            if (counter == 0) begin
                read_port1[4:1] <= A;  
            end
            if (counter == 1) begin
                read_port1[0] <= A[3];
            end
            if (counter == 2) begin
                valid_port1 <= 1;
                en <= 1;
            end
        end
 
        if(state == 2) begin
            if (counter == 0) begin
                read_port1[4:1] <= A;      
            end
            if (counter == 1) begin
                read_port1[0] <= A[3];
            end
            if (counter == 2) begin
                read_port2[4:1] <= A;      
            end
            if (counter == 3) begin
                read_port2[0] <= A[3];
            end
            if (counter == 4) begin
                valid_port1 <= 1;
                valid_port2 <= 1;
                en <= 1;
            end
        end
 
        if(state == 3) begin
            if (counter == 0) begin
                read_port1[4:1] <= A;      
            end
            if (counter == 1) begin
                read_port1[0] <= A[3];
            end
            if (counter == 2) begin
                write_port[4:1] <= A;      
            end
            if (counter == 3) begin
                write_port[0] <= A[3];
            end
            if (counter == 4) begin
                write_A[15:12] <= A;
            end
            if (counter == 5) begin
                write_A[11:8] <= A;
            end
            if (counter == 6) begin
                write_A[7:4] <= A;
            end
            if (counter == 7) begin
                write_A[3:0] <= A;
            end
            if (counter == 8) begin
                valid_port1 <= 1;
                valid_port3 <= 1;
                en <= 1;
            end
        end
 
        if(state == 4) begin
            if (counter == 0) begin
                read_port1[4:1] <= A;      
            end
            if (counter == 1) begin
                read_port1[0] <= A[3];
            end
            if (counter == 2) begin
                read_port2[4:1] <= A;      
            end
            if (counter == 3) begin
                read_port2[0] <= A[3];
            end
            if (counter == 4) begin
                write_port[4:1] <= A;      
            end
            if (counter == 5) begin
                write_port[0] <= A[3];
            end
            if (counter == 6) begin
                write_A[15:12] <= A;
            end
            if (counter == 7) begin
                write_A[11:8] <= A;
            end
            if (counter == 8) begin
                write_A[7:4] <= A;
            end
            if (counter == 9) begin
                write_A[3:0] <= A;
            end
            if (counter == 10) begin
                valid_port1 <= 1;
                valid_port2 <= 1;
                valid_port3 <= 1;
                en <= 1;
            end
        end
 
        if(state == 5) begin
            if (counter == 0) begin
                read_port1[4:1] <= A;      
            end
            if (counter == 1) begin
                read_port1[0] <= A[3];
            end
            if (counter == 2) begin
                read_port2[4:1] <= A;      
            end
            if (counter == 3) begin
                read_port2[0] <= A[3];
            end
            if (counter == 4) begin
                write_port[4:1] <= A;      
            end
            if (counter == 5) begin
                write_port[0] <= A[3];
            end
            if (counter == 6) begin
                valid_port1 <= 1;
                valid_port2 <= 1;
                en <= 1;
            end
        end
       
        if(state == 6) begin
            if (counter == 0) begin
                read_port1[4:1] <= A;      
            end
            if (counter == 1) begin
                read_port1[0] <= A[3];
            end
            if (counter == 2) begin
                read_port2[4:1] <= A;      
            end
            if (counter == 3) begin
                read_port2[0] <= A[3];
            end
            if (counter == 4) begin
                write_port[4:1] <= A;      
            end
            if (counter == 5) begin
                write_port[0] <= A[3];
            end
            if (counter == 6) begin
                valid_port1 <= 1;
                valid_port2 <= 1;
                en <= 1;
            end
        end
       
        if(state == 7) begin
            if (counter == 0) begin
                read_port1[4:1] <= A;      
            end
            if (counter == 1) begin
                read_port1[0] <= A[3];
            end
            if (counter == 2) begin
                write_port[4:1] <= A;      
            end
            if (counter == 3) begin
                write_port[0] <= A[3];
            end
            if (counter == 4) begin
                shift <= A;
            end
            if (counter == 5) begin
                valid_port1 <= 1;
                valid_port2 <= 1;
                en <= 1;
            end
        end
 
        counter <= counter + 1;
    end
 
    always @ (posedge clk) begin
        if (en == 1) begin
            if (cycle_counter == 2) begin
                if (state == 0) begin
                    output_line1 <= write_port;
                    output_line2 <= write_A;
                end
                else if (state == 1) begin
                    output_line1 <= read_port1;
                    output_line2 <= read_A1;
                end
                else if (state == 2) begin
                    output_line1 <= read_A1;
                    output_line2 <= read_A2;
                end
                else if (state == 3) begin
                    output_line1 <= read_port1;
                    output_line2 <= read_A1;
                end
                else if (state == 4) begin
                    output_line1 <= read_A1;
                    output_line2 <= read_A2;
                end
                if (state == 5) begin
                    output_line1 <= write_port;
                    output_line2 <= read_A1 + read_A2;
                    write_A <= read_A1 + read_A2;
                end
                else if (state == 6) begin
                    output_line1 <= write_port;
                    output_line2 <= read_A1 - read_A2;
                    write_A <= read_A1 - read_A2;
                end
                else if (state == 7) begin
                    output_line1 <= write_port;
                    output_line2 <= read_A1 << shift;
                    write_A <= read_A1 << shift;
                end
                cycle_counter <= 3;
            end
            else if (cycle_counter == 18) begin

                if (state == 0) begin
                    output_line1 <= write_port;
                    output_line2 <= write_data;
                end

                else if (state == 1) begin
                    output_line1 <= read_port1;
                    output_line2 <= read_data1;
                end

                else if (state == 2) begin
                    output_line1 <= read_data1;
                    output_line2 <= read_data2;
                end
                
                else if (state == 3) begin
                    output_line1 <= read_port1;
                    output_line2 <= read_data1;
                end
                
                else if (state == 4) begin
                    output_line1 <= read_data1;
                    output_line2 <= read_data2;
                end
                
                else if (state == 5) begin
                    write_data <= output_line2;
                    valid_port3 <= 1;
                end
                else if (state == 6) begin
                    write_data = output_line2;
                    valid_port3 <= 1;
                end
                else if (state == 7) begin
                    write_data <= output_line2;
                    valid_port3 <= 1;
                end
                cycle_counter <= 19;
            end
            else if (cycle_counter == 21) begin
                // Update line 1 and line 2
                line1[127:120] <= 48 + output_line1[15];
                line1[119:112] <= 48 + output_line1[14];
                line1[111:104] <= 48 + output_line1[13];
                line1[103:96] <= 48 + output_line1[12];
                line1[95:88] <= 48 + output_line1[11];
                line1[87:80] <= 48 + output_line1[10];
                line1[79:72] <= 48 + output_line1[9];
                line1[71:64] <= 48 + output_line1[8];
                line1[63:56] <= 48 + output_line1[7];
                line1[55:48] <= 48 + output_line1[6];
                line1[47:40] <= 48 + output_line1[5];
                line1[39:32] <= 48 + output_line1[4];
                line1[31:24] <= 48 + output_line1[3];
                line1[23:16] <= 48 + output_line1[2];
                line1[15:8] <= 48 + output_line1[1];
                line1[7:0] <= 48 + output_line1[0];
                line2[127:120] <= 48 + output_line2[15];
                line2[119:112] <= 48 + output_line2[14];
                line2[111:104] <= 48 + output_line2[13];
                line2[103:96] <= 48 + output_line2[12];
                line2[95:88] <= 48 + output_line2[11];
                line2[87:80] <= 48 + output_line2[10];
                line2[79:72] <= 48 + output_line2[9];
                line2[71:64] <= 48 + output_line2[8];
                line2[63:56] <= 48 + output_line2[7];
                line2[55:48] <= 48 + output_line2[6];
                line2[47:40] <= 48 + output_line2[5];
                line2[39:32] <= 48 + output_line2[4];
                line2[31:24] <= 48 + output_line2[3];
                line2[23:16] <= 48 + output_line2[2];
                line2[15:8] <= 48 + output_line2[1];
                line2[7:0] <= 48 + output_line2[0];

                cycle_counter <= 0;
                en <= 0;
            end
            else begin
                cycle_counter <= cycle_counter + 1;
            end
        end
    end
 
endmodule
