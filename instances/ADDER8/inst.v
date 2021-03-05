   //
   // ADDER8
   //
   iob_adder adder8
     (
      .clk      (clk),
      .rst      (reset),

      //cpu interface
      .valid(slaves_req[`valid(`ADDER8)]),
      .address(slaves_req[`address(`ADDER8,`ADDER_ADDR_W+2)-2]),
      .wdata(slaves_req[`wdata(`ADDER8)-(`DATA_W-`ADDER_WDATA_W)]),
      .wstrb(slaves_req[`wstrb(`ADDER8)]),
      .rdata(slaves_resp[`rdata(`ADDER8)]),
      .ready(slaves_resp[`ready(`ADDER8)])
      );

