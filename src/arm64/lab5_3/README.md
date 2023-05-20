<!--
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-20 17:54:53
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-20 17:56:19
 * @FilePath: /OpenOS/src/arm64/lab5_3/README.md
 * @Description: 
 * Copyright (c) 2023 by ${git_name_email}(www.github.com/xddcore), All Rights Reserved. 
-->
# Lab_5_3: 子函数跳转

(1)创建bl_test的汇编函数，在该汇编函数里面使用BL指令来跳转到lab5_2实现的csel_test汇编函数。

(2)在kernel.c文件中，使用C语言调用bl_test的汇编函数。