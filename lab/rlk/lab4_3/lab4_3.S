/*
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-20 16:23:25
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-21 16:28:24
 * @FilePath: /xddcore/OpenOS/src/arm64/lab4_3/lab4_3.S
 * @Description: 
 * Copyright (c) 2023 by ${git_name_email}(www.github.com/xddcore), All Rights Reserved. 
 */

 .globl main

 main:
    mov x1, #0x3
    mov x2, #0

    ands x3, x1, x2 //计算结果为0

    mrs x4, nzcv //理论上此时nzcv寄存器中z位的值应该为1
