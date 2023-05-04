`timescale  1ns/1ns
/////////////////////////////////////////////////////////////////////////
// Author        : EmbedFire
// Create Date   : 2019/12/05
// Module Name   : tb_rom
// Project Name  : rom
// Target Devices: Altera EP4CE10F17C8N
// Tool Versions : Quartus 13.0
// Description   : rom IP核仿真文件
// 
// Revision      : V1.0
// Additional Comments:
// 
// 实验平台: 野火_征途Pro_FPGA开发板
// 公司    : http://www.embedfire.com
// 论坛    : http://www.firebbs.cn
// 淘宝    : https://fire-stm32.taobao.com
////////////////////////////////////////////////////////////////////////

module  tb_rom();

//********************************************************************//
//****************** Parameter and Internal Signal *******************//
//********************************************************************//

//wire  define
wire    stcp;
wire    shcp;
wire    ds  ;
wire    oe  ;

//reg   define
reg         sys_clk     ;
reg         sys_rst_n   ;
reg [1:0]   key         ;

//********************************************************************//
//***************************** Main Code ****************************//
//********************************************************************//

//对sys_clk,sys_rst赋初值，并模拟按键抖动
initial
    begin
            sys_clk     =   1'b1 ;
            sys_rst_n   <=  1'b0 ;
            key         <=  2'b11;
    #200    sys_rst_n   <=  1'b1 ;
//按下按键key[0]
    #2000000    key[0]      <=  1'b0;//按下按键
    #20         key[0]      <=  1'b1;//模拟抖动
    #20         key[0]      <=  1'b0;//模拟抖动
    #20         key[0]      <=  1'b1;//模拟抖动
    #20         key[0]      <=  1'b0;//模拟抖动
    #200        key[0]      <=  1'b1;//松开按键
    #20         key[0]      <=  1'b0;//模拟抖动
    #20         key[0]      <=  1'b1;//模拟抖动
    #20         key[0]      <=  1'b0;//模拟抖动
    #20         key[0]      <=  1'b1;//模拟抖动
//按下按键key[1]
    #2000000    key[1]      <=  1'b0;//按下按键
    #20         key[1]      <=  1'b1;//模拟抖动
    #20         key[1]      <=  1'b0;//模拟抖动
    #20         key[1]      <=  1'b1;//模拟抖动
    #20         key[1]      <=  1'b0;//模拟抖动
    #200        key[1]      <=  1'b1;//松开按键
    #20         key[1]      <=  1'b0;//模拟抖动
    #20         key[1]      <=  1'b1;//模拟抖动
    #20         key[1]      <=  1'b0;//模拟抖动
    #20         key[1]      <=  1'b1;//模拟抖动
//按下按键key[1]
    #2000000    key[1]      <=  1'b0;//按下按键
    #20         key[1]      <=  1'b1;//模拟抖动
    #20         key[1]      <=  1'b0;//模拟抖动
    #20         key[1]      <=  1'b1;//模拟抖动
    #20         key[1]      <=  1'b0;//模拟抖动
    #200        key[1]      <=  1'b1;//松开按键
    #20         key[1]      <=  1'b0;//模拟抖动
    #20         key[1]      <=  1'b1;//模拟抖动
    #20         key[1]      <=  1'b0;//模拟抖动
    #20         key[1]      <=  1'b1;//模拟抖动
//按下按键key[1]
    #2000000    key[1]      <=  1'b0;//按下按键
    #20         key[1]      <=  1'b1;//模拟抖动
    #20         key[1]      <=  1'b0;//模拟抖动
    #20         key[1]      <=  1'b1;//模拟抖动
    #20         key[1]      <=  1'b0;//模拟抖动
    #200        key[1]      <=  1'b1;//松开按键
    #20         key[1]      <=  1'b0;//模拟抖动
    #20         key[1]      <=  1'b1;//模拟抖动
    #20         key[1]      <=  1'b0;//模拟抖动
    #20         key[1]      <=  1'b1;//模拟抖动
//按下按键key[0]
    #2000000    key[0]      <=  1'b0;//按下按键
    #20         key[0]      <=  1'b1;//模拟抖动
    #20         key[0]      <=  1'b0;//模拟抖动
    #20         key[0]      <=  1'b1;//模拟抖动
    #20         key[0]      <=  1'b0;//模拟抖动
    #200        key[0]      <=  1'b1;//松开按键
    #20         key[0]      <=  1'b0;//模拟抖动
    #20         key[0]      <=  1'b1;//模拟抖动
    #20         key[0]      <=  1'b0;//模拟抖动
    #20         key[0]      <=  1'b1;//模拟抖动
//按下按键key[0]
    #2000000    key[0]      <=  1'b0;//按下按键
    #20         key[0]      <=  1'b1;//模拟抖动
    #20         key[0]      <=  1'b0;//模拟抖动
    #20         key[0]      <=  1'b1;//模拟抖动
    #20         key[0]      <=  1'b0;//模拟抖动
    #200        key[0]      <=  1'b1;//松开按键
    #20         key[0]      <=  1'b0;//模拟抖动
    #20         key[0]      <=  1'b1;//模拟抖动
    #20         key[0]      <=  1'b0;//模拟抖动
    #20         key[0]      <=  1'b1;//模拟抖动
    end
    
//sys_clk:模拟系统时钟，每10ns电平取反一次，周期为20ns，频率为50Mhz
always  #10 sys_clk =   ~sys_clk;

//重新定义参数值，缩短仿真时间仿真
defparam    rom_inst.key1_filter_inst.CNT_MAX   =   5 ;
defparam    rom_inst.key2_filter_inst.CNT_MAX   =   5 ;
defparam    rom_inst.rom_ctrl_inst.CNT_MAX      =   99;

//********************************************************************//
//*************************** Instantiation **************************//
//********************************************************************//

//---------------rom_inst--------------
rom rom_inst
(
    .sys_clk     (sys_clk   ),   //系统时钟，频率50MHz
    .sys_rst_n   (sys_rst_n ),   //复位信号，低电平有效
    .key         (key       ),   //输入按键信号

    .stcp        (stcp      ), //输出数据存储寄时钟
    .shcp        (shcp      ), //移位寄存器的时钟输入
    .ds          (ds        ), //串行数据输入
    .oe          (oe        )  //输出使能信号

);

endmodule
