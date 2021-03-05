   //
   // ADDER1
   //
   iob_adder adder4
     (
      .clk      (clk),
      .rst      (reset),

      //cpu interface
      .valid(slaves_req[`valid(`ADDER4)]),
      .address(slaves_req[`address(`ADDER4,`ADDER_ADDR_W+2)-2]),
      .wdata(slaves_req[`wdata(`ADDER4)-(`DATA_W-`ADDER_WDATA_W)]),
      .wstrb(slaves_req[`wstrb(`ADDER4)]),
      .rdata(slaves_resp[`rdata(`ADDER4)]),
      .ready(slaves_resp[`ready(`ADDER4)])
      );

