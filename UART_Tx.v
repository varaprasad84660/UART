
`include "states.vh"

module UART_tx(
             input clk,
             input en,
             input start,
             input [7:0]in,
             output reg out
             );
  
  reg [2:0]state = `RESET;
  reg [7:0]data = 8'b0;
  reg [2:0]index = 8'b0; 
  wire parity;
  
  always @(posedge clk)begin
    case(state)
      default : begin
        state <= `IDLE;
      end
      
      `IDLE : begin
        out <= 1'b1;
        data <= 8'b0;
        index <= 2'b0;
        
        if(start & en)begin
          state <= `START;
          
        end
      end
      
     `START : begin
       out <= 1'b0;
       data <=in;
       state<= `DATA;
       
   end
     
     `DATA : begin
       if(index == 7)begin
         index <= 0;
         state <= `PARITY;
     end
       else begin
         out <= data[index];
          index <= index+1;
       end
     end
      
      `PARITY : begin
        if(parity == 0) begin
          out <= 0;
         state <= `STOP;
        end
        
        else begin
          out <= 1;
         state <= `STOP;
        end
      end
        
        `STOP: begin
          out <= 1;
          data <= 8'b0;
          state <= `IDLE;
        end
        
    endcase
      end
      
      assign parity = ^in;
      
      endmodule
      
