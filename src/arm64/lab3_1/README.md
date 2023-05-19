<!--
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-18 21:21:20
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-18 22:15:26
 * @FilePath: /xddcore/OpenOS/src/arm64/Lab_3_1/README.md
 * @Description: 
 * Copyright (c) 2023 by ${git_name_email}(www.github.com/xddcore), All Rights Reserved. 
-->
# Lab_3_1：熟悉MOV和LDR指令


**ldr&前变基&后变基**
```
ldr x0, [x1, #8] //内存地址为x1寄存器的值+8的偏移量(不更新x1寄存器的值)，加载此内存地址里面的值到x0寄存器

ldr x0, [x1, #8]! //前变基模式，先更新x1寄存器的值为x1寄存器的值+8，然后以新的值为内存地址，加载此内存地址里的值到x0寄存器

ldr x0, [x1], #8 //后变基模式，内存地址为x1的值，访问该地址的值存入x1寄存器。再更新x1寄存器的值(+8)
```

**mov**

```
mov可以接收的立即数:
1.16bit立即数
2.16bit立即数左移16，32，48bit的立即数
```

### 实验要求
1. 使用mov指令把0x80000加载到x1寄存器中
2. 使用mov指令把立即数16加载到x3寄存器中
3. 使用ldr指令读取0x80000地址的值
4. 使用ldr指令读取0x80008地址的值
5. 使用ldr指令读取[x1+x3]的值
6. 使用ldr指令读取[x1+x3<<3]的值

**编写汇编代码，并使用GDB来单步调试**
> Note: 在GDB中可以使用x命令来读取内存地址的值，然后和寄存器的值进行比较来验证是否正确。