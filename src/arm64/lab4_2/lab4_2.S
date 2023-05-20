/*
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-20 16:14:42
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-20 17:31:42
 * @FilePath: /OpenOS/src/arm64/lab4_2/lab4_2.S
 * @Description: 
 * Copyright (c) 2023 by ${git_name_email}(www.github.com/xddcore), All Rights Reserved. 
 */

 .globl main

 main:
    cmp x0, x1
    b.cs 1b //if x0 >= x1, c bit will set, and jump to 1 label.
    mov x0, #0xffffffffffffffff


1:
    mov x0, #0
    ret //return

    //sbc优化版本
    //cmp x0, x1
    //sbc x0, xzr, xzr 
    //xzr为0寄存器，里面的值都是0
    //SBC指令计算过程=0+NOT(0)+C

