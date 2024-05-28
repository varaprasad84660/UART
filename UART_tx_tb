// Code your testbench here
// or browse Examples
module UART_tx_tb;
  reg clk;
  reg en;
  reg start;
  reg [7:0]in;
  wire out;
  
  UART_tx d0(clk,en,start,in,out);
  always #1 clk = ~clk;
  
  initial begin
    clk = 0;
    #7 en = 1;start = 1; in = 127;
    #25 in = 34;
    #25 in = 11; 
    #25 $finish();
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
  end
  
endmodule
