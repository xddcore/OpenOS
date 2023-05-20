<!--
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-19 20:47:24
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-20 17:46:22
 * @FilePath: /OpenOS/src/arm64/lab4_2/README.md
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

>待优化:考虑使用SBC指令，来快速完成需求。而不是用b跳转操作 
   
> sub: 减法指令     


> subs: 考虑NZCV寄存器的减法指令(NZCV判定过程:subs x0, x1 , x2,x0=x1+NOT(x2)+1)    
> 公式由来:负数用补码表示，补码等于反码+1。另外，减去一个数等价于加上它的相反数。例如3-2=3+(-2),其中-2在计算过程中用补码表示  



> sbc: 考虑c位(进位)的减法指令    
> 例如:      
> sbc x0, x1, x2  
> x0 = x1 + NOT(x2) + C

