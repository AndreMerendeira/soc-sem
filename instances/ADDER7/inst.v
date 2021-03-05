   //
   // ADDER7
   //
   iob_adder adder7
     (
      .clk      (clk),
      .rst      (reset),

      //cpu interface
      .valid(slaves_req[`valid(`ADDER7)]),
      .address(slaves_req[`address(`ADDER7,`ADDER_ADDR_W+2)-2]),
      .wdata(slaves_req[`wdata(`ADDER7)-(`DATA_W-`ADDER_WDATA_W)]),
      .wstrb(slaves_req[`wstrb(`ADDER7)]),
      .rdata(slaves_resp[`rdata(`ADDER7)]),
      .ready(slaves_resp[`ready(`ADDER7)])
      );

