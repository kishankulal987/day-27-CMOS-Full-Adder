`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2025 18:03:08
// Design Name: 
// Module Name: fulladder_cmos
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


module fulladder_cmos(input a,b,cin,output sum,cout);
// sum a xor b xor cin
//carry ab + c(a xor b)
wire t1,t2,t3,t4,t5,t6,t7;
//sum
cmosnand n1(a,b,t1);
cmosnand n2(t1,a,t2);
cmosnand n3(t1,b,t3);
cmosnand n4(t2,t3,t4);
cmosnand n5(t4,cin,t5);
cmosnand n6(t5,t4,t6);
cmosnand n7(t5,cin,t7);
cmosnand n8(t6,t7,sum);

// carry
cmosnand n9(t1,t5,cout);
endmodule
