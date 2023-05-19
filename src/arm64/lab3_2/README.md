<!--
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-19 11:34:37
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-19 12:23:47
 * @FilePath: /xddcore/OpenOS/src/arm64/lab3_2/README.md
 * @Description: 
 * Copyright (c) 2023 by ${git_name_email}(www.github.com/xddcore), All Rights Reserved. 
-->
#Lab_3_2: 前变基与后变基寻址模式-1

(1)新建一个汇编文件，在汇编函数中实现如下功能:
    1. 使用mov指令把0x80000加载到x1寄存器中；
    2. 使用mov指令把立即数16加载到x3寄存器中；
    然后使用前变基模式的ldr指令来加载地址0x80000处的内容。
    ldr x6， [x1,#8]!
    x1寄存器的值为0x80008,x6寄存器的值为地址0x80008中的值。
(2)使用后变基模式的LDR指令。
    ldr x7, [x1], #8
    x1寄存器的值为0x80008, x7寄存器的值为0x80000。
    