/*
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-20 16:14:42
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-20 16:22:57
 * @FilePath: /OpenOS/src/arm64/lab4_2/lab4_2.S
 * @Description: 
 * Copyright (c) 2023 by ${git_name_email}(www.github.com/xddcore), All Rights Reserved. 
 */

 .globl main

 main:
    cmp x0, x1
    b.cs 1b //if x0 >= x1, c bit will set, and jump to 1 label.
    mov x0, #0xffffffffffffffff


1:
    mov x0, #0
    ret //return

