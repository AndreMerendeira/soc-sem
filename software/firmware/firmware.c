#include "stdlib.h"
#include "system.h"
#include "periphs.h"
#include "sem.h"
#include "iob_adder.h"

// set pointer to DDR base
#if (RUN_DDR==0)  //running firmware from SRAM
  #define DDR_MEM (EXTRA_BASE)
#else //running firmware from DDR
  #define DDR_MEM ((1<<(FIRM_ADDR_W)))
#endif

#define DATA_BASE_ADDR DDR_MEM
char* INPUT_FILE = (char*) DATA_BASE_ADDR;

void main()
{
  resp_end=0;
  int result;
  char buffer [10]="";
	unsigned int i, line;
	unsigned int bit;
	unsigned int word;
	unsigned int frame;
  //init the Adders
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

  uart_getfile("injectionRange.txt", INPUT_FILE);

  for(line=0;;line++) {
    if (INPUT_FILE[line*11]=='X')
      break;
    for (i=0;i<10;i++)
      buffer[i]=INPUT_FILE[line*11+i];
    err_injection_cmd_in_addr(buffer);
    //Test the 16 adders
    for(i=0;i<16;i++) {
      adder_send_i(i,10,5);
      if (result=adder_get_i(i)!=10+5) {
        printf_("\n\n!!!! ERROR FOUND at ADDER%d!!!!\n", i+1);
      }
    }
    err_injection_cmd_in_addr(buffer);
  }

  //query the frame
  //query_cmd(0,36,1,21);
  //inject error at slr 0, frame 36, word 1, bit 21
  //err_injection_cmd(0, 36,1,21);
	//check if bit was flipped
	//query_cmd(0,36,1,21);

	//observation_cmd();
	//wait_resp(); //Wait for response to error detection

	wait_mseconds(100); //wait 100 miliseconds

	uart_printf("\n\n");

	uart_finish();
}
