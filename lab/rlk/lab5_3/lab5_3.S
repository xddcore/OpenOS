/*
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-21 17:45:49
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-21 17:51:29
 * @FilePath: /xddcore/OpenOS/src/arm64/lab5_3/lab5_3.S
 * @Description: 
 * Copyright (c) 2023 by ${git_name_email}(www.github.com/xddcore), All Rights Reserved. 
 */

.globl main

//(1)创建bl_test的汇编函数，
//在该汇编函数里面使用BL指令来跳转到lab5_2实现的csel_test汇编函数。
lab5_2:
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
    
    ret

main://也就是bl_test
    bl lab5_2

//(2)在kernel.c文件中，使用C语言调用bl_test的汇编函数。
//直接调用 bl_test();即可 标签即是函数名
