/*
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-20 17:11:29
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-20 17:23:50
 * @FilePath: /OpenOS/src/arm64/lab4_5/lab4_5.S
 * @Description: 
 * Copyright (c) 2023 by ${git_name_email}(www.github.com/xddcore), All Rights Reserved. 
 */
.globl main

#define TEST_VALUE 0x345
main:
    //读取ID_AA64ISAR0_EL1寄存器中的Atomic字段到X0寄存器，
    //用来判断该寄存器是否支持LSE指令。
    //Atomic字段为:第20-23位(共计4位)

    mrs x1, ID_AA64ISAR0_EL1
    ubfx x0, x1, #20, #4

    //(2)读取(1)中寄存器的AES字段到X2寄存器中，用来判断该寄存器是否支持AES指令。
    ubfx x2, x1, #4, #4

    ret