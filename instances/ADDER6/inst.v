   //
   // ADDER6
   //
   iob_adder adder6
     (
      .clk      (clk),
      .rst      (reset),

      //cpu interface
      .valid(slaves_req[`valid(`ADDER6)]),
      .address(slaves_req[`address(`ADDER6,`ADDER_ADDR_W+2)-2]),
      .wdata(slaves_req[`wdata(`ADDER6)-(`DATA_W-`ADDER_WDATA_W)]),
      .wstrb(slaves_req[`wstrb(`ADDER6)]),
      .rdata(slaves_resp[`rdata(`ADDER6)]),
      .ready(slaves_resp[`ready(`ADDER6)])
      );

