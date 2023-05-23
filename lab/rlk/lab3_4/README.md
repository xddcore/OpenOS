<!--
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-19 14:32:31
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-19 14:45:46
 * @FilePath: /xddcore/OpenOS/src/arm64/lab3_4/README.md
 * @Description: 
 * Copyright (c) 2023 by ${git_name_email}(www.github.com/xddcore), All Rights Reserved. 
-->
# Lab_3_4: PC相对地址寻址

在汇编文件中输入如下代码:
```
#define MY_LABEL 0x20

ldr x6, MY_LABEL
ldr x7, =MY_LABEL
```
x6和x7寄存器的值分别是多少？   

>ANS:x6寄存器的值为内存地址为PC+0x20的内存单元中的值；x7为伪指令赋值，x7的值为0x20

> Note: 汇编文件名必须为大写的.S，这样才能使GCC编译器自动识别C语言中的预处理指令(#include,#define等)


