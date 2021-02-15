// This is free and unencumbered software released into the public domain.
//
// Anyone is free to copy, modify, publish, use, compile, sell, or
// distribute this software, either in source code form or as a compiled
// binary, for any purpose, commercial or non-commercial, and by any
// means.

#include "irq.h"
#include "iob-uart.h"

volatile char resp_buffer[1400];
volatile unsigned int resp_end = 0;

uint32_t *irq(uint32_t *regs, uint32_t irqs)
{
	/*
	IRQ[0] = Timer Interrupt
	IRQ[1] = EBREAK/ECALL or Illegal Instruction
 	IRQ[2] = BUS Error (Unalign Memory Access)
 	IRQ[4] = UART_1
 	*/
 	static unsigned int i=0;

	//Handle interruption for irq[4] here
	if ((irqs & (1<<4)) != 0 && resp_end==0 && uart_rxstatus_i(1)) {
		char c = uart_getc_i(1);
		if (c=='\r')	//SEM core sends a \r at the end of each line
			c='\n';		//Swap it for a \n
		resp_buffer[i++]=c;
  		resp_buffer[i]='\0';
		// "> " signals the end of a response
		if(i>1 && resp_buffer[i-2]=='>') {
			resp_end = 1;
			i=0;
		}
	}

	return regs;
}
