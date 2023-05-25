/*
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-19 11:29:15
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-19 12:34:09
 * @FilePath: /xddcore/OpenOS/src/arm64/lab3_2/lab3_2.s
 * @Description: 
 * Copyright (c) 2023 by ${git_name_email}(www.github.com/xddcore), All Rights Reserved. 
 */

.globl main

main:
    //1. 使用mov指令把0x80000加载到x1寄存器中；
    mov x1, #0x80000
    //2. 使用mov指令把立即数16加载到x3寄存器中；
    mov x3, #16
    //然后使用前变基模式的ldr指令来加载地址0x80000处的内容。
    ldr x6, [x1,#8]!
    //(2)使用后变基模式的LDR指令。
    ldr x7, [x1], #8
    