#include "stdlib.h"
#include "system.h"
#include "periphs.h"
#include "sem.h"
//#include "iob_adder.h"

#define N 10

void main()
{
	int a,b;
 	a=10;
  	b=5;
	unsigned int i;
	unsigned int v [N];
	unsigned int bit;
	unsigned int word;
	unsigned int frame;
	//init timer and uart
	resp_end=0;
	timer_init(TIMER_BASE);
	uart_init(UART0_BASE, FREQ/BAUD);
	uart_init_i(1, UART1_BASE, FREQ/BAUD);

	reset_cmd();

	status_cmd();
	//Adder usage
	/*
	adder_init(ADDER1_BASE);
  	adder_send(a,b);
  	printf_("%d+%d=%d\n\n",a,b,adder_get());
	*/
	
	//slr 0, frame 0, word 61, bit 0
	//query_cmd(0,0,61,0);

  for(frame=7000; frame <10000; frame++) {
    for(word=30; word<80; word++){ //Most errors "break" riscv between word 30 and 80
      if(word!=60 && word!=61) {  //ignore words 60 and 61 (ECC value)
	      for (bit=0; bit<32; bit++) {
	        //flip bit at slr 0, frame 0, word <word>, bit <bit>
	        err_injection_cmd(0,frame,word,bit);
	        
	        //wait_mseconds(100); //wait 100 miliseconds
	        //timer_reset();
	        //unsigned int time = timer_time_us();
	        //uart_printf("Starting test\n");
	        
	        for (i=0;i<N;i++)
		        v[i]=i;
		        
	        //uart_printf("Finished test\n");
	        //uart_printf("Starting check\n");
	        
	        for (i=0;i<N;i++) {
		        if(v[i]!=i) {
		          uart_printf("ERROR at i=%d\n",i);
		          return;		
		        }
	        }
	        
	        //uart_printf("Finished check\n");	
	        
	        //time = timer_time_us() - time;
	        //uart_printf("It took %d us\n\n",time);
        }
      }
    }
  }
	//check if bit was flipped
	//query_cmd(0,0,61,0);

	observation_cmd();

	wait_resp(); //Wait for response to error detection

	wait_mseconds(100); //wait 100 miliseconds

	uart_printf("\n\n");

	uart_finish();
}
