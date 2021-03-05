   //
   // ADDER14
   //
   iob_adder adder14
     (
      .clk      (clk),
      .rst      (reset),

      //cpu interface
      .valid(slaves_req[`valid(`ADDER14)]),
      .address(slaves_req[`address(`ADDER14,`ADDER_ADDR_W+2)-2]),
      .wdata(slaves_req[`wdata(`ADDER14)-(`DATA_W-`ADDER_WDATA_W)]),
      .wstrb(slaves_req[`wstrb(`ADDER14)]),
      .rdata(slaves_resp[`rdata(`ADDER14)]),
      .ready(slaves_resp[`ready(`ADDER14)])
      );

