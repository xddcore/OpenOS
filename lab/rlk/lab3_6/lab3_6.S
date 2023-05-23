/*
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-19 15:50:15
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-19 16:04:00
 * @FilePath: /xddcore/OpenOS/src/arm64/lab3_6/lab3_6.S
 * @Description: 
 * Copyright (c) 2023 by ${git_name_email}(www.github.com/xddcore), All Rights Reserved. 
 */

 .globl main

//(1)内存地址16bytes对齐,x0=*s,x1=c,x2=count
 main:
    mov x4, #0

1:
    //把x1的值存入x0中，然后因为后变基，将x0的地址+16bytes成为x0的新地址，再将x1的值存入新地址中。
    stp x1, x1, [x0], #16
    add x4, x4, #16 // x4= x4+16
    cmp x4, x2
    bne 1b //bne:if x4,x2 not equal,则跳转到1 label
    ret 