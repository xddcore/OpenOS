/*
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-19 14:32:08
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-19 15:11:30
 * @FilePath: /xddcore/OpenOS/src/arm64/lab3_4/lab3_4.S
 * @Description: 
 * Copyright (c) 2023 by ${git_name_email}(www.github.com/xddcore), All Rights Reserved. 
 */
 
#define MY_LABEL 0x20

.globl main

main:

    ldr x6, MY_LABEL
    ldr x7, =MY_LABEL
    