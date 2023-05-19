<!--
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-18 18:28:13
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-19 21:09:25
 * @FilePath: /xddcore/OpenOS/src/arm64/README.md
 * @Description: 
 * Copyright (c) 2023 by ${git_name_email}(www.github.com/xddcore), All Rights Reserved. 
-->
# ARM64

本目录为Lab目录，装载有关A64指令集，GNU编译器，操作系统等的小实验。

>**本目录下所有小实验来源于《ARM64体系结构与编程实践》一书，感谢奔跑吧Linux社区的大牛们！(官方仓库地址:https://github.com/runninglinuxkernel/arm64_programming_practice)**

## 需要的设备(二选一)

1. 树莓派4b(任意内存大小)
2. Ubuntu20.04+QEMU(物理机/虚拟机均可)

## 如何开始？

请参考SleepPanda开源项目 (https://github.com/xddcore/SleepPanda) 中的Raspberry Pi OS安装配置部分内容，以完成对树莓派4b的开发环境准备工作。


## 目录结构

### A64指令集

**加载与存储指令**

- [x] 1. Lab_3_1：熟悉MOV和LDR指令
- [x] 2. Lab_3_2: 前变基与后变基寻址模式-1
- [x] 3. Lab_3_3: 前变基与后变基寻址模式-2
- [x] 4. Lab_3_4: PC相对地址寻址
- [x] 5. Lab_3_5: memcpy()函数的实现
- [x] 6. Lab_3_6: LDP和STP指令的使用

**算术与移位指令**

- [ ] 1. Lab_4_1：测试ADDS和CMP指令的C标志位
- [ ] 2. Lab_4_2: 条件标识位的使用
- [ ] 3. Lab_4_3: 测试ANDS指令以及Z标志位
- [ ] 4. Lab_4_4: 测试位段操作指令
- [ ] 5. Lab_4_5: 使用位段指令来读取寄存器

**比较指令与跳转指令**

- [ ] 1. Lab_5_1：CMP和CMN指令
- [ ] 2. Lab_5_2: 条件选择指令
- [ ] 3. Lab_5_3: 子函数跳转

**其他重要指令**

- [ ] 1. Lab_6_1：测试ADRP和LDR伪指令
- [ ] 2. Lab_6_2: ADRP和LDR伪指令陷阱
- [ ] 3. Lab_6_3: LDXR和STXR指令的使用1
- [ ] 4. Lab_6_4: LDXR和STXR指令的使用2

**A64指令集的陷阱**

- [ ] 1. Lab_7_1：加载宏标签
- [ ] 2. Lab_7_2: 加载字符串
- [ ] 3. Lab_7_3: 读写寄存器导致树莓派4B死机
- [ ] 4. Lab_7_4: LDXR指令导致树莓派4B死机
- [ ] 5. Lab_7_5: 在汇编中实现串口输出功能
- [ ] 6. Lab_7_6: 分析Linux5.0的启动汇编代码

### GNU相关

**GNU编译器**

- [ ] 1. Lab_8_1：汇编语言练习-求最大数
- [ ] 2. Lab_8_2: 汇编语言练习-通过C语言调用汇编函数
- [ ] 3. Lab_8_3: 汇编语言练习-通过汇编语言调用C函数
- [ ] 4. Lab_8_4: 使用汇编语言伪操作来实现一张表
- [ ] 5. Lab_8_5: 汇编宏的使用
- [ ] 6. Lab_8_6: 分析Linux5.0的启动汇编代码

**链接器与链接脚本**

- [ ] 1. Lab_9_1：汇编语言练习-求最大数
- [ ] 2. Lab_9_2: 汇编语言练习-通过C语言调用汇编函数
- [ ] 3. Lab_9_3: 汇编语言练习-通过汇编语言调用C函数
- [ ] 4. Lab_9_4: 使用汇编语言伪操作来实现一张表
- [ ] 5. Lab_9_5: 汇编宏的使用

**GNU内嵌汇编代码**

- [ ] 1. Lab_10_1：实现简单的memcpy函数
- [ ] 2. Lab_10_2: 使用汇编符号名编写内嵌汇编代码
- [ ] 3. Lab_10_3: 使用内嵌汇编代码完善(__memset_16bytes)
- [ ] 4. Lab_10_4: 使用内嵌汇编代码与宏
- [ ] 5. Lab_10_5: goto模版的内嵌汇编函数

### ARM V8相关

1. 异常处理
2. 中断处理
3. CIC-V2
4. 内存管理
5. 高速缓存基础知识
6. 缓存一致性
7. TLB管理
8. 内存屏障指令+合理使用内存屏障指令
9. 原子操作
10. 操作系统相关
11. 浮点运算与NEON指令
12. 可伸缩矢量计算与优化
