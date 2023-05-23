.globl main
main:
    //(1)请输入下面的汇编代码。
    mov x2, 0x400000
    ldr x6, =0x1234abce //ldr伪指令
    str x6, [x2,#8]! //前变基
    //(2)请输入下面汇编代码。 
    mov x2, 0x500000
    str x6, [x2], #8
    