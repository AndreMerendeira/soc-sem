#include "stdlib.h"
#include "system.h"
#include "periphs.h"
#include "sem.h"
#include "iob_adder.h"

#define N 10

void main()
{
  resp_end=0;
  int a,b, result;
 	a=10;
  b=5;
	unsigned int i;
	unsigned int bit;
	unsigned int word;
	unsigned int frame;
  //Adder init
  adder_init_i(0, ADDER1_BASE);
  adder_init_i(1, ADDER2_BASE);
  adder_init_i(2, ADDER3_BASE);
  adder_init_i(3, ADDER4_BASE);
  adder_init_i(4, ADDER5_BASE);
  adder_init_i(5, ADDER6_BASE);
  adder_init_i(6, ADDER7_BASE);
  adder_init_i(7, ADDER8_BASE);
  adder_init_i(8, ADDER9_BASE);
  adder_init_i(9, ADDER10_BASE);
  adder_init_i(10, ADDER11_BASE);
  adder_init_i(11, ADDER12_BASE);
  adder_init_i(12, ADDER13_BASE);
  adder_init_i(13, ADDER14_BASE);
  adder_init_i(14, ADDER15_BASE);
  adder_init_i(15, ADDER16_BASE);
	//init timer and uart
	timer_init(TIMER_BASE);
	uart_init(UART0_BASE, FREQ/BAUD);
	uart_init_i(1, UART1_BASE, FREQ/BAUD);

	reset_cmd();

	status_cmd();

/*
  err_injection_cmd(0, 36,1,21);
  for(i=0;i<16;i++) {
    adder_send_i(i,a,i);
    if (result=adder_get_i(i)!=a+i) {
      printf_("\n\n!!!! ERROR FOUND at ADDER%d!!!!\n", i+1);
      printf_("%d+%d=%d!=%d\n\n",a, i, a+i, result);
      uart_finish();
      return;
    }
  }
*/
	//slr 0, frame 0, word 61, bit 0
	//query_cmd(0,0,61,0);

  for(frame=26000; frame>7000; frame--) {
    for(word=0; word<123; word++){ //Most errors "break" riscv between word 30 and 80
      if(word!=60 && word!=61) {  //ignore words 60 and 61 (ECC value)
	      for (bit=0; bit<32; bit++) {
	        //flip bit at slr 0, frame 0, word <word>, bit <bit>
	        err_injection_cmd(0,frame,word,bit);

          for(i=0;i<16;i++) {
            adder_send_i(i,a,i);
            if (result=adder_get_i(i)!=a+i) {
              printf_("%d.%d.%d\t", frame, word, bit);
              printf_("ADDER%d\n\n", i+1);
              err_injection_cmd(0,frame,word,bit); //Correct the error
              //printf_("%d+%d=%d!=%d\n\n",a, i, a+i, result);
              //uart_finish();
              //return;
            }
          }
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
