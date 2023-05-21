/*
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-21 17:31:09
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-21 17:43:37
 * @FilePath: /xddcore/OpenOS/src/arm64/lab5_2/lab5_2.S
 * @Description: 
 * Copyright (c) 2023 by ${git_name_email}(www.github.com/xddcore), All Rights Reserved. 
 */
.globl main
main:
    // a!0时，x0应该返回1
    mov x0, #1 // test a=1
    
    mov x1, #2 // test b=2
    // b+2 = 4
    add x2, x1, #2 
    // b-1 = 1
    add x3, x1, #-1

    cmp x0, #0
    csel x0, x2, x3, eq //if(a==0){x0=x2=b+2}else{x0=x3=b-1}

    //a=0时，x0应该返回4
    mov x0, #0 // test a=0
    cmp x0, #0
    csel x0, x2, x3, eq //if(a==0){x0=x2=b+2}else{x0=x3=b-1}