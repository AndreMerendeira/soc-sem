   //
   // ADDER1
   //
   iob_adder adder1
     (
      .clk      (clk),
      .rst      (reset),

      //cpu interface
      .valid(slaves_req[`valid(`ADDER1)]),
      .address(slaves_req[`address(`ADDER1,`ADDER_ADDR_W+2)-2]),
      .wdata(slaves_req[`wdata(`ADDER1)-(`DATA_W-`ADDER_WDATA_W)]),
      .wstrb(slaves_req[`wstrb(`ADDER1)]),
      .rdata(slaves_resp[`rdata(`ADDER1)]),
      .ready(slaves_resp[`ready(`ADDER1)])
      );

