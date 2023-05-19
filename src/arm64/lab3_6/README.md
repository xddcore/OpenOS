<!--
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-19 15:50:21
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-19 15:59:52
 * @FilePath: /xddcore/OpenOS/src/arm64/lab3_6/README.md
 * @Description: 
 * Copyright (c) 2023 by ${git_name_email}(www.github.com/xddcore), All Rights Reserved. 
-->
# Lab_3_6: LDP和STP指令的使用

(1)memset()函数的C语言原型如下。
```
void *memset(void *s, int c, size_t count)
{
    char *xs = s;

    while(count--)
        *xs++=c;
    return s;
}
```

假设内存地址s是16bytes对齐的，count也是16bytes对齐的。请使用LDP和STP指令(多字节内存加载与存储)来实现这个函数。

(2)假设内存地址s以及count不是16Bytes对齐的，请继续优化memset()函数，例如memset(0x200004, 0x55,102)