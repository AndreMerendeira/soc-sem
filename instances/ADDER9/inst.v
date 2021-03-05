   //
   // ADDER9
   //
   iob_adder adder9
     (
      .clk      (clk),
      .rst      (reset),

      //cpu interface
      .valid(slaves_req[`valid(`ADDER9)]),
      .address(slaves_req[`address(`ADDER9,`ADDER_ADDR_W+2)-2]),
      .wdata(slaves_req[`wdata(`ADDER9)-(`DATA_W-`ADDER_WDATA_W)]),
      .wstrb(slaves_req[`wstrb(`ADDER9)]),
      .rdata(slaves_resp[`rdata(`ADDER9)]),
      .ready(slaves_resp[`ready(`ADDER9)])
      );

