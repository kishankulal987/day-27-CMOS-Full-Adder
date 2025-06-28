`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2025 17:48:12
// Design Name: 
// Module Name: cmosnand
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


module cmosnand(input x,y,output f);
supply1 vdd;
supply0 gnd;
wire a;
pmos p1(f,vdd,x);
pmos p2(f,vdd,y);
nmos n1(f,a,x);
nmos n2(a,gnd,y);
endmodule

