/*
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-18 23:56:09
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-19 11:33:57
 * @FilePath: /xddcore/OpenOS/src/arm64/lab3_1/lab3_1.s
 * @Description: 
 * Copyright (c) 2023 by ${git_name_email}(www.github.com/xddcore), All Rights Reserved. 
 */

.globl main
main:
    //1. 使用mov指令把0x80000加载到x1寄存器中
    mov x1 , #0x80000
    //2. 使用mov指令把立即数16加载到x3寄存器中
    mov x3 , #16
    //3. 使用ldr指令读取0x80000地址的值
    ldr x4 , [x1]
    //4. 使用ldr指令读取0x80008地址的值
    ldr x5 , [x1,#8]
    //5. 使用ldr指令读取[x1+x3]的值
    ldr x6 , [x1,x3]
    //6. 使用ldr指令读取[x1+x3<<3]的值
    ldr x7 , [x1,x3,lsl #3]
    ret

