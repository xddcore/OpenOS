<!--
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-21 17:59:13
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-21 18:03:08
 * @FilePath: /xddcore/OpenOS/src/arm64/lab6_1/README.md
 * @Description: 
 * Copyright (c) 2023 by ${git_name_email}(www.github.com/xddcore), All Rights Reserved. 
-->
# Lab_6_1：测试ADRP和LDR伪指令

(1)在汇编代码中定义my_test_data标签。
```
.align 3
.globl my_test_data
my_test_data:
    .dword 0x12345678abcdabcd
```
请使用ADR和ADRP指令来读取my_test_data的地址以及该地址的值。     
请使用LDR伪指令来读取my_test_data的地址以及该地址的值。   

(2)修改链接文件linker.ld，在树莓派4B的4MB内存地址上分配一个4KB大小的页面init_pg_dir, 用来存储也表。请使用ADRP和LDR伪指令加载init_pg_dir的地址到通用寄存器中。

