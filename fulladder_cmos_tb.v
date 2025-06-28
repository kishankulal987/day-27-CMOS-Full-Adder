`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2025 18:15:44
// Design Name: 
// Module Name: fulladder_cmos_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fulladder_cmos_tb();
reg a,b,cin;
wire cout,sum;
fulladder_cmos DUT(a,b,cin,sum,cout);
initial begin
for(integer i=0;i<2**3;i=i+1)
begin
{a,b,cin}=i;
#10;
$display("a=%b b=%b cin=%b sum=%b cout=%b",a,b,cin,sum,cout);
end
$finish;
end
endmodule
