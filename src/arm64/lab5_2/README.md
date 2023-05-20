<!--
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-20 17:53:11
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-20 17:54:35
 * @FilePath: /OpenOS/src/arm64/lab5_2/README.md
 * @Description: 
 * Copyright (c) 2023 by ${git_name_email}(www.github.com/xddcore), All Rights Reserved. 
-->
# Lab_5_2: 条件选择指令

请使用条件选择指令来实现如下C语言函数:
```
unsigned long csel_test(unsigned long a, unsigned long b)
{
    if(a==0)
        return b+2;
    else
        return b-1;
}
```