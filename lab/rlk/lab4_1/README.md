<!--
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-19 20:44:46
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-20 15:41:58
 * @FilePath: /OpenOS/src/arm64/lab4_1/README.md
 * @Description: 
 * Copyright (c) 2023 by ${git_name_email}(www.github.com/xddcore), All Rights Reserved. 
-->
# Lab_4_1：测试ADDS和CMP指令的C标志位

(1)使用adds指令来创建一个无符号数溢出的场景，然后使用ADC指令来测试C条件标志位。

> Note: nzcv标志位属于PSTATE寄存器。N(Negative), Z(Zero), C(Carry), V(OVerflow)

(2)使用cmp指令来比较两个数，然后使用adc指令来测试

> Note: A64指令集中cmp指令内部由sub指令实现。

例如:

```
cmp x1, x2
等价于
sub x1, x2
结果等价于
x1 + NOT(x2) + 1(一个数减另外一个数，等于它加上这个数的取反数再+1)
```

