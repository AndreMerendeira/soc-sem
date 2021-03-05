   //
   // ADDER13
   //
   iob_adder adder13
     (
      .clk      (clk),
      .rst      (reset),

      //cpu interface
      .valid(slaves_req[`valid(`ADDER13)]),
      .address(slaves_req[`address(`ADDER13,`ADDER_ADDR_W+2)-2]),
      .wdata(slaves_req[`wdata(`ADDER13)-(`DATA_W-`ADDER_WDATA_W)]),
      .wstrb(slaves_req[`wstrb(`ADDER13)]),
      .rdata(slaves_resp[`rdata(`ADDER13)]),
      .ready(slaves_resp[`ready(`ADDER13)])
      );

