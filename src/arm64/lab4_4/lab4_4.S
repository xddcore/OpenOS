/*
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-20 16:43:17
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-20 17:07:51
 * @FilePath: /OpenOS/src/arm64/lab4_4/lab4_4.S
 * @Description: 
 * Copyright (c) 2023 by ${git_name_email}(www.github.com/xddcore), All Rights Reserved. 
 */

 .globl main

#define TEST_VALUE 0x345
main:
    //(1)使用BFI指令把0x345中的低四位插入X0寄存器的Bit[8,11]。
    ldr x1, =TEST_VALUE //使用ldr伪指令将0x345赋值给x1
    bfi x0, x1, #8, #4 //位段插入指令

    //(2)假设x2=0x5678abcd，
    //那么使用UBFX指令来提取第4-11位的数据到X3寄存器，
    mov x2, #0x0x5678abcd
    ubfx x3, x2, #4, #8 
    //使用SBFX指令来提取第4-11位的数据到x4寄存器。
    sbfx x3, x2, #4, #8 
    //x3和x4寄存器的值分别是多少？
    //0x5678abcd的4-11bit:1011 1100
    //x3:0000 0000 0000 0000 0000 1011 1100 0000
    //x4:1111 1111 1111 1111 1111 1011 1100 0000


    
