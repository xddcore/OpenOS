<!--
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-19 12:54:05
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-19 13:07:45
 * @FilePath: /xddcore/OpenOS/src/arm64/lab3_3/README.md
 * @Description: 
 * Copyright (c) 2023 by ${git_name_email}(www.github.com/xddcore), All Rights Reserved. 
-->
# Lab_3_3: 前变基与后变基寻址模式-2

(1)请输入下面的汇编代码。   
```
mov x2, 0x400000
ldr x6, =0x1234abce
str x6, [x2,#8]!
```
x2寄存器的值是多少？地址0x400000处的值是多少？   

>ANS: x2寄存器的值为0x400000，地址0x400000处的值未知。第二行之后x6的值为0x1234abce；第三行时，由于是前变基str指令，x2的值为0x400008，x6把0x1234abce存储到地址0x400008中。

(2)请输入下面汇编代码。   
```
mov x2, 0x500000
str x6, [x2], #8
```
x2寄存器的值是多少？地址0x500000处的值是多少？    
>ANS: x2寄存器的值是0x500000；第二行采用后变基str指令，将x6的值存储值地址0x500000中。再将x2的值+8变为0x500008。


