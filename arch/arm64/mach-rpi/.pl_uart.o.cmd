cmd_arch/arm64/mach-rpi/pl_uart.o := aarch64-linux-gnu-gcc -Wp,-MD,arch/arm64/mach-rpi/.pl_uart.o.d  -nostdinc -nostdlib -g -D__KERNEL__ -Iinclude -Iinclude/std -include /home/rlk/rlk/OpenOS/include/target/config.h  -I/home/rlk/rlk/OpenOS/arch/arm64/include -Iarch/arm64/include/generated/uapi -Iarch/arm64/include/generated -Iarch/arm64/include/asm  -Iinclude -I/home/rlk/rlk/OpenOS/arch/arm64/include/uapi -Iarch/arm64/include/generated/uapi -I/home/rlk/rlk/OpenOS/include/uapi -Iinclude/generated/uapi -g -Wall -DKBUILD_CONF -Iinclude -Iinclude/std -include /home/rlk/rlk/OpenOS/include/target/config.h  -I/home/rlk/rlk/OpenOS/arch/arm64/include -Iarch/arm64/include/generated/uapi -Iarch/arm64/include/generated -Iarch/arm64/include/asm  -Iinclude -I/home/rlk/rlk/OpenOS/arch/arm64/include/uapi -Iarch/arm64/include/generated/uapi -I/home/rlk/rlk/OpenOS/include/uapi -Iinclude/generated/uapi -fomit-frame-pointer    -o arch/arm64/mach-rpi/pl_uart.o -c arch/arm64/mach-rpi/pl_uart.c

deps_arch/arm64/mach-rpi/pl_uart.o := \
  arch/arm64/mach-rpi/pl_uart.c \
  /home/rlk/rlk/OpenOS/include/target/config.h \
    $(wildcard include/config/h/include//.h) \
    $(wildcard include/config/sys/noirq.h) \
    $(wildcard include/config/sys/poll/rt.h) \
    $(wildcard include/config/sys/task.h) \
  include/mach/uart.h \
  include/mach/base.h \
    $(wildcard include/config/board/pi3b.h) \
  include/mach/gpio.h \
  include/asm/io.h \

arch/arm64/mach-rpi/pl_uart.o: $(deps_arch/arm64/mach-rpi/pl_uart.o)

$(deps_arch/arm64/mach-rpi/pl_uart.o):
