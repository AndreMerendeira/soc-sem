//instantiate core in system

   //
   // UART 1
   //
	
	wire uart1_tx, uart1_rx;
	wire uart1_interr;
	
	assign irq[4] = uart1_interr;
   	
   	iob_uart uart_1
	(
			//Interrupt
      .interrupt (uart1_interr),
			
      //RS232 interface
      .txd       (uart1_txd),
      .rxd       (uart1_rxd),
      .rts       (),
      .cts       (1'b1),

      //CPU interface
      .clk       (clk),
      .rst       (reset),
      .valid(slaves_req[`valid(`UART1)]),
      .address(slaves_req[`address(`UART1,`UART1_ADDR_W+2)-2]),
      .wdata(slaves_req[`wdata(`UART1)-(`DATA_W-`UART1_WDATA_W)]),
      .wstrb(|slaves_req[`wstrb(`UART1)]),
      .rdata(slaves_resp[`rdata(`UART1)]),
      .ready(slaves_resp[`ready(`UART1)])
      );
