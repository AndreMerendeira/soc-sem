   //
   // ADDER12
   //
   iob_adder adder12
     (
      .clk      (clk),
      .rst      (reset),

      //cpu interface
      .valid(slaves_req[`valid(`ADDER12)]),
      .address(slaves_req[`address(`ADDER12,`ADDER_ADDR_W+2)-2]),
      .wdata(slaves_req[`wdata(`ADDER12)-(`DATA_W-`ADDER_WDATA_W)]),
      .wstrb(slaves_req[`wstrb(`ADDER12)]),
      .rdata(slaves_resp[`rdata(`ADDER12)]),
      .ready(slaves_resp[`ready(`ADDER12)])
      );

