//add core test module in testbench

   iob_uart uart_0_tb
     (
      .clk       (clk),
      .rst       (reset),
      
      .interrupt (),

      .valid     (uart_valid),
      .address   (uart_addr),
      .wdata     (uart_wdata[`UART0_WDATA_W-1:0]),
      .wstrb     (uart_wstrb),
      .rdata     (uart_rdata),
      .ready     (uart_ready),

      .txd       (uart_rxd),
      .rxd       (uart_txd),
      .rts       (uart_cts),
      .cts       (uart_rts)
      );
