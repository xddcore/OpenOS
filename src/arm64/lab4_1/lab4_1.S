
.globl main
    
main:
    //(1)使用adds指令来创建一个无符号数溢出的场景，然后使用ADC指令来测试C条件标志位。
    mov x1, 0xffffffffffffffff
    adds x0, x1, #2
    mrs x3, nzcv //取出nzcv标志位，由此可以看出carry位的值。

    //(2)使用cmp指令来比较两个数，然后使用adc指令来测试
    mov x4, #3
    mov x5, #2
    cmp x4, x5 //=subs x4, x5=x4 - x5 = x4 + NOT(X5) + 1
    //3+0xfffffffffffffffd+1 = 1,在此过程中出现无符号溢出且出现进位。
    //所以C标志位为1
    
    //使用adc指令进行测试
    adc x6, #0xfffffffffffffffd, #1 //x6 = NOT(x5)+1
    adc x7, x4, x6 //x7 = x4+x6 = x4 + NOT(x5) + 1
    mrs x8, nzcv
    //使用gdb检查x7的值，若x7的值等于1，且nzcv中出现无符号溢出且出现进位，
    //则测试通过 



    
