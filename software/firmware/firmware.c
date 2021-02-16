#include "stdlib.h"
#include "system.h"
#include "periphs.h"
#include "sem.h"

int main()
{
	//init timer and uart
	resp_end=0;
	timer_init(TIMER_BASE);
	uart_init(UART0_BASE, FREQ/BAUD);
	uart_init_i(1, UART1_BASE, FREQ/BAUD);

	reset_cmd();

	status_cmd();

	//slr 0, frame 0, word 61, bit 0
	//query_cmd(0,0,61,0);

	//flip bit at slr 0, frame 0, word 61, bit 0
	err_injection_cmd(0,0,61,0);

	//check if bit was flipped
	//query_cmd(0,0,61,0);
	
	xmem_cmd();

	observation_cmd();

	wait_resp(); //Wait for response to error detection

	wait_mseconds(100); //wait 100 miliseconds
	
	idle_cmd();

	uart_printf("\n\n");

	uart_finish();
}
