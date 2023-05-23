/*
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-19 15:31:46
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-19 15:43:41
 * @FilePath: /xddcore/OpenOS/src/arm64/lab3_5/lab3_5.S
 * @Description: 
 * Copyright (c) 2023 by ${git_name_email}(www.github.com/xddcore), All Rights Reserved. 
 */

 .global main
    
main:
    mov x1, 0x80000
    mov x2, 0x200000
    add x3, x1, #32

1:
    ldr x4, [x1], #8 //后变基
    str x4, [x2], #8
    cmp x1, x3
    b.cc 1b //当条件标识位为0（也就是x1的地址不等于x3时)跳转至1 label
    ret
