   //
   // ADDER11
   //
   iob_adder adder11
     (
      .clk      (clk),
      .rst      (reset),

      //cpu interface
      .valid(slaves_req[`valid(`ADDER11)]),
      .address(slaves_req[`address(`ADDER11,`ADDER_ADDR_W+2)-2]),
      .wdata(slaves_req[`wdata(`ADDER11)-(`DATA_W-`ADDER_WDATA_W)]),
      .wstrb(slaves_req[`wstrb(`ADDER11)]),
      .rdata(slaves_resp[`rdata(`ADDER11)]),
      .ready(slaves_resp[`ready(`ADDER11)])
      );

