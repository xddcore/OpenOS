<!--
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-19 20:55:38
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-20 17:25:57
 * @FilePath: /OpenOS/src/arm64/lab4_5/README.md
 * @Description: 
 * Copyright (c) 2023 by ${git_name_email}(www.github.com/xddcore), All Rights Reserved. 
-->
# Lab_4_5: 使用位段指令来读取寄存器

在Lab4_4的基础上做如下实验。

(1)读取ID_AA64ISAR0_EL1寄存器中的Atomic字段到X0寄存器，用来判断该寄存器是否支持LSE指令。

> Note: Atomic字段为:第20-23位     
> ID_AA64ISAR0_EL1寄存器可以使用 mrs指令 读取

(2)读取(1)中寄存器的AES字段到X2寄存器中，用来判断该寄存器是否支持AES指令。

> Note: AES字段为:第4-7位
