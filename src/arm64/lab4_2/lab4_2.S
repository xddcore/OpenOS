/*
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-20 16:14:42
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-21 16:25:25
 * @FilePath: /xddcore/OpenOS/src/arm64/lab4_2/lab4_2.S
 * @Description: 
 * Copyright (c) 2023 by ${git_name_email}(www.github.com/xddcore), All Rights Reserved. 
 */

 .globl main


1:
    mov x0, #0
    ret //return
    
 main:
    //测试情况1: a>b
    /*mov x0, #5 //a=5
    mov x1, #4 //b=4
    cmp x0, x1
    b.cs 1b //if x0 >= x1, c bit will set, and jump to 1 label.
    mov x0, #0xffffffffffffffff
    */
    
    //测试情况2: a=b
    /*
    mov x0, #4 //a=4
    mov x1, #4 //b=4
    cmp x0, x1
    b.cs 1b //if x0 >= x1, c bit will set, and jump to 1 label.
    mov x0, #0xffffffffffffffff
    */
    //测试情况3: a<b
    mov x0, #4 //a=4
    mov x1, #5 //b=5
    cmp x0, x1
    b.cs 1b //if x0 >= x1, c bit will set, and jump to 1 label.
    mov x0, #0xffffffffffffffff

    ret

    //sbc优化版本
    //cmp x0, x1
    //sbc x0, xzr, xzr 
    //xzr为0寄存器，里面的值都是0
    //SBC指令计算过程=0+NOT(0)+C

