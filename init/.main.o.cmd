cmd_init/main.o := aarch64-linux-gnu-gcc -Wp,-MD,init/.main.o.d  -nostdinc -nostdlib -g -D__KERNEL__ -Iinclude -Iinclude/std -include /home/rlk/rlk/OpenOS/include/target/config.h  -I/home/rlk/rlk/OpenOS/arch/arm64/include -Iarch/arm64/include/generated/uapi -Iarch/arm64/include/generated -Iarch/arm64/include/asm  -Iinclude -I/home/rlk/rlk/OpenOS/arch/arm64/include/uapi -Iarch/arm64/include/generated/uapi -I/home/rlk/rlk/OpenOS/include/uapi -Iinclude/generated/uapi -g -Wall -DKBUILD_CONF -Iinclude -Iinclude/std -include /home/rlk/rlk/OpenOS/include/target/config.h  -I/home/rlk/rlk/OpenOS/arch/arm64/include -Iarch/arm64/include/generated/uapi -Iarch/arm64/include/generated -Iarch/arm64/include/asm  -Iinclude -I/home/rlk/rlk/OpenOS/arch/arm64/include/uapi -Iarch/arm64/include/generated/uapi -I/home/rlk/rlk/OpenOS/include/uapi -Iinclude/generated/uapi -fomit-frame-pointer    -o init/main.o -c init/main.c

deps_init/main.o := \
  init/main.c \
  /home/rlk/rlk/OpenOS/include/target/config.h \
    $(wildcard include/config/h/include//.h) \
    $(wildcard include/config/sys/noirq.h) \
    $(wildcard include/config/sys/poll/rt.h) \
    $(wildcard include/config/sys/task.h) \
  arch/arm64/include/asm/uart.h \

init/main.o: $(deps_init/main.o)

$(deps_init/main.o):
