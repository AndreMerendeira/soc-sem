//add core test module in testbench

   iob_uart uart_1_tb
     (
      .clk       (clk),
      .rst       (reset),
      
      .interrupt (),
      
	 		.valid     (uart1_valid),
      .address   (uart1_addr),
      .wdata     (uart1_wdata[`UART1_WDATA_W-1:0]),
      .wstrb     (uart1_wstrb),
      .rdata     (uart1_rdata),
      .ready     (uart1_ready),

      .txd       (uart1_rxd),
      .rxd       (uart1_txd),
      .rts       (uart1_cts),
      .cts       (uart1_rts)
      );
