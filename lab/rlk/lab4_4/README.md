<!--
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-19 20:52:31
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-21 16:41:57
 * @FilePath: /xddcore/OpenOS/src/arm64/lab4_4/README.md
 * @Description: 
 * Copyright (c) 2023 by ${git_name_email}(www.github.com/xddcore), All Rights Reserved. 
-->
# Lab_4_4: 测试位段操作指令

(1)使用BFI指令把0x345中的低四位插入X0寄存器的Bit[8,11]。

> Note:     
> BFI <Xd>, <Xn>, #<lsb>, #<width>
> BFI指令的作用是用 Xn寄存器中的[0,width-1]位替换 Xd寄存器中的[lsb, lsb+width-1]位。

(2)假设x2=0x5678abcd，那么使用UBFX指令来提取第4-11位的数据到X3寄存器，使用SBFX指令来提取第4-11位的数据到x4寄存器。x3和x4寄存器的值分别是多少？

> NOTE:     
> UBFX无符号提取位段后，提取到目标寄存器中不会做符号拓展，所有高位填充0。    
> SBFX有符号提取位段后，提取到目标寄存器中会进行符号拓展，所有高位填充为提取后的最高符号位。



> ANS:    
> //x3和x4寄存器的值分别是多少?    
  //0x5678abcd的4-11bit:1011 1100   
  //x3:0000 0000 0000 0000 0000 0000 1011 1100(0xbc)    
  //x4:1111 1111 1111 1111 1111 1111 1011 1100      (0xffffffffffffffbc)     