//instantiate SEM core in system

   //
   // SEM
   //
   
	sem_ultra_0_example_design sem_ultra (
		.clk		(clk),
		.uart_tx	(uart1_rx),
		.uart_rx 	(uart1_tx)
		);
