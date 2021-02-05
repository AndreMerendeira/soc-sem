#include "stdlib.h"
#include "system.h"
#include "periphs.h"
#include "iob-uart.h"
#include "printf.h"
#include "iob_timer.h"
#include "irq.h"

extern volatile char resp_buffer[1300];
extern volatile unsigned int resp_end;

void wait_resp () {

	while (resp_end!=1) { }

	uart_printf("%s",resp_buffer);
	resp_end = 0;
}

void wait_resp_w_word (unsigned int word) {
	unsigned int i, line=0;

	while (resp_end!=1) { }

	for (i=0; resp_buffer[i] != '\0'; i++) {
		if(resp_buffer[i]=='\n') {
			if (line-1==word)
				uart_printf(" <-----");
			line++;
		}
		uart_putc(resp_buffer[i]);
	}
	resp_end = 0;
}

void idle_cmd() {

  	uart_puts_i(1, "I\r"); //Enter IDLE

 	wait_resp();
}

void observation_cmd() {

  	uart_puts_i(1, "O\r"); //Enter OBSERVATION

 	wait_resp();
}

void reset_cmd() {

	idle_cmd();
	uart_puts_i(1, "R 04\r"); //Send reset command

	wait_resp();
}

void status_cmd() {

	uart_puts_i(1, "S\r"); //Send status command

  	wait_resp();
}

void query_cmd (unsigned int slr, unsigned int lfa, unsigned int word, unsigned int bit) {
	char cmd_buffer [15] = "";
	unsigned int location = 0;

	location |= bit;
	location |= word << 5;
	location |= lfa << 12;
	location |= slr << 29;

	uart_printf_i(1,"Q C0%08X\r", location); //Send query command

	wait_resp_w_word(word);
}

void err_injection_cmd (unsigned int slr, unsigned int lfa, unsigned int word, unsigned int bit) {
	char cmd_buffer [15] = "";
	unsigned int location = 0;

	location |= bit;
	location |= word << 5;
	location |= lfa << 12;
	location |= slr << 29;

	uart_printf_i(1,"N C0%08X\r", location); //Send error injection command

	wait_resp();
}

int main()
{
	//init timer and uart
	resp_end=0;
	timer_init(TIMER_BASE);
	uart_init(UART0_BASE, FREQ/BAUD);
	uart_printf("HELLO\n");
	uart_init_i(1, UART1_BASE, FREQ/BAUD);

	reset_cmd();

	idle_cmd();

	status_cmd();

	//slr 0, frame 0, word 61, bit 0
	query_cmd(0,0,61,0);

	err_injection_cmd(0,0,61,0);

	query_cmd(0,0,61,0);

	observation_cmd();

	wait_resp(); //Wait for response to error detection

	uart_printf("\n\n");

	uart_finish();
}
