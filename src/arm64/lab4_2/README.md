<!--
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-19 20:47:24
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-19 20:50:42
 * @FilePath: /xddcore/OpenOS/src/arm64/lab4_2/README.md
 * @Description: 
 * Copyright (c) 2023 by ${git_name_email}(www.github.com/xddcore), All Rights Reserved. 
-->
# Lab_4_2: 条件标识位的使用

编写一个汇编函数，用于实现以下C语言伪代码对应的功能。
```
unsigned long compare_and_return(unsigned long a, unsigned long b)
{
    if(a >= b)
        return 0;
    else
        return 0xffffffffffffffff;//64bit
}
```

> Note: 在ARM64函数参数传递，X0寄存器传递函数的第一个参数，X1寄存器传递函数的第二个参数。在函数返回时X0寄存器传递返回值。

