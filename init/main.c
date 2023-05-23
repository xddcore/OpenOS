#include <uart.h>

void kernel_main(void)
{
	uart_init();
	uart_send_string("=Welcome OpenOS!\r\n");
	uart_send_string("i am xddcore!\r\n");

	while (1)
		uart_send(uart_recv());
}
