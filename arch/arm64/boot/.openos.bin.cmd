cmd_arch/arm64/boot/openos.bin := aarch64-linux-gnu-objcopy -O binary -R .note -R .note.gnu.build-id -R .comment -S  openos.strip arch/arm64/boot/openos.bin
