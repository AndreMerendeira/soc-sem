   //
   // ADDER1
   //
   iob_adder adder2
     (
      .clk      (clk),
      .rst      (reset),

      //cpu interface
      .valid(slaves_req[`valid(`ADDER2)]),
      .address(slaves_req[`address(`ADDER2,`ADDER_ADDR_W+2)-2]),
      .wdata(slaves_req[`wdata(`ADDER2)-(`DATA_W-`ADDER_WDATA_W)]),
      .wstrb(slaves_req[`wstrb(`ADDER2)]),
      .rdata(slaves_resp[`rdata(`ADDER2)]),
      .ready(slaves_resp[`ready(`ADDER2)])
      );

