/*
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-21 16:52:25
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-21 17:24:50
 * @FilePath: /xddcore/OpenOS/src/arm64/lab5_1/lab5_1.S
 * @Description: 
 * Copyright (c) 2023 by ${git_name_email}(www.github.com/xddcore), All Rights Reserved. 
 */

.globl main

add_3:
    add x1, x1, #1 //x1+=1
    cmp x2, x1
    b.cs add_3 //cmp等价于subs= x2-not(x1)+1，
    //当x2>=x1时，会发生进位，故只要检测cs，carry位是否被set即可
    ret

add_2:
    cmp x2, x1
    b.cs add_3

add_1:
    add x2, x2, #1
    cmn x1,x2
    b.mi add_1 //.mi条件后缀代表当N标志位Set时 跳转
    //完成(1)后，重新设置x1,x2，然后进入2
    mov x1, #1
    mov x2, #3
    b add_2

    

main:
    //(1)练习CMN指令。假设X1=1，X2=-3，
    //使用CMN指令来比较两个数，当结果为负数的时候，继续循环和比较，
    //并且令x2+=1。使用NZCV寄存器来查看对应条件标志位变化情况。
    mov x1, #1
    mov x2, #-3

    cmn x1,x2
    b.mi add_1 //.mi条件后缀代表当N标志位Set时 跳转

    ret

