   //
   // ADDER1
   //
   iob_adder adder3
     (
      .clk      (clk),
      .rst      (reset),

      //cpu interface
      .valid(slaves_req[`valid(`ADDER3)]),
      .address(slaves_req[`address(`ADDER3,`ADDER_ADDR_W+2)-2]),
      .wdata(slaves_req[`wdata(`ADDER3)-(`DATA_W-`ADDER_WDATA_W)]),
      .wstrb(slaves_req[`wstrb(`ADDER3)]),
      .rdata(slaves_resp[`rdata(`ADDER3)]),
      .ready(slaves_resp[`ready(`ADDER3)])
      );

