<!--
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-21 18:16:48
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-21 18:24:22
 * @FilePath: /xddcore/OpenOS/src/arm64/lab6_3/README.md
 * @Description: 
 * Copyright (c) 2023 by ${git_name_email}(www.github.com/xddcore), All Rights Reserved. 
-->
# Lab_6_3: LDXR和STXR指令的使用1

(1) 在汇编代码里定义数据my_data，初始化为0，并实现一个汇编函数my_atomic_write()，在C语言中调用该函数来写入新数据。

> p1 = my_atomic_write(0x34); //往my_data中写入0x34

(2) 某开发人员实现了上面的汇编函数my_atomic_write(), 编译运行后出现了段错误。   
请找出段错误的原因。    
> Note: 请从代码段和数据段的角度来思考这个问题。


(3) 请使用LDXR和STXR指令写一段汇编代码来实现atomic_set()函数，用来设置某位。atomic_set()函数的C语言实现如下。
```
void atomic_set(int nr, volatile unsigned long *addr)
{
    unsigned long mask = 1UL << nr;

    *p |=mask;
}
```