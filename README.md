<!--
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-18 12:23:07
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-25 17:31:54
 * @FilePath: /xddcore/OpenOS/README.md
 * @Description: 
 * Copyright (c) 2023 by ${git_name_email}(www.github.com/xddcore), All Rights Reserved. 
-->
# OpenOS
>2023年5月，xdd说: 要把Linux研究得裤衩都不剩。于是，OpenOS产生了。   

 
OpenOS(Open Source Operating System)，一个面向ARM64的开源操作系统。 本项目旨在深入探究ARM64，Linux内核，操作系统原理等嵌入式工程师必备知识。

## 致谢:   
Linux: https://kernel.org/   
BenOS: https://github.com/runninglinuxkernel/BenOS  

## 核心特性

1. 从0到1，一步步实现一个操作系统。
2. 功能模块经过Unit Test验证。
3. 代码通过Linux CheckPatch.pl脚本检查。

## 平台支持
|  平台   | 支持情况  |
|  ----  | ----  |
| 树莓派4B  | ✅ |
| 树莓派3B  | ❌ |
| QEMU-aarch64(推荐) | ✅ |
| -  | - |

## 使用指南

### 1.获取源码

```
git clone https://github.com/xddcore/OpenOS.git
```


### 2.构建开发环境(QEMU)

#### 2.1 构建OpenOS编译环境
```
cd OpenOS/
make setenv
```

#### 2.2 手动安装QEMU
>利用树莓派4b patch重新编译安装qemu-system-aarch64,使qemu支持仿真树莓派4b

```
cd ~
git clone https://github.com/0xMirasio/qemu-patch-raspberry4.git
cd qemu-patch-raspberry4
mkdir build
cd build
../configure
make -j8
sudo make install
```

#### 2.3 测试QEMU
```
qemu-system-aarch64 -machine help
#找一下raspi4b2g是否在支持列表中
```

#### 2.4 测试OpenOS
```
make clean
make menuconfig
make
make run
```

## TODO List

### Part1

- [ ] 1. 打印"Hello, World!" 
- [ ] 2. 切换异常等级
- [ ] 3. 实现简易的printk打印函数
- [ ] 4. 中断实验 
- [ ] 5. 进程创建实验

### Part2
- [ ] 1. 进程调度实验
- [ ] 2. 中断注册
- [ ] 3. 让进程运行在用户态
- [ ] 4. 添加系统调用
- [ ] 5. 实现一个简单的物理内存页面分配器
- [ ] 6. 实现一个简单的小块内存分配器
- [ ] 7. 建立恒等映射页表
- [ ] 8. 实现简单的虚拟内存管理
- [ ] 9. 实现缺页异常机制
- [ ] 10. 实现panic功能和打印函数调用栈
- [ ] 11. 实现用户空间的内存分配函数
- [ ] 12. 写时复制功能的实现
- [ ] 13. 进程生命周期管理

### Part3
- [ ] 1. 信号量
- [ ] 2. 软中断机制
- [ ] 3. 编写SD卡的驱动
- [ ] 4. 设计和实现虚拟文件系统层
- [ ] 5. 实现ext2文件系统
- [ ] 6. 实现execv系统调用
- [ ] 7. 实现简单的shell界面
- [ ] 8. 添加多核SMP的支持
