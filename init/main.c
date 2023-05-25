/*
 * @Author: Chengsen Dong 1034029664@qq.com
 * @Date: 2023-05-24 00:33:15
 * @LastEditors: Chengsen Dong 1034029664@qq.com
 * @LastEditTime: 2023-05-24 06:12:20
 * @FilePath: /OpenOS/init/main.c
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
#include <uart.h>

void kernel_main(void)
{
	uart_init();
	uart_send_string("<kernel_output>Welcome OpenOS!\r\n");
	uart_send_string("<kernel_output>i am xddcore!\r\n");
	while (1)
		uart_send(uart_recv());
}
