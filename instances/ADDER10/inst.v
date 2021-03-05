   //
   // ADDER10
   //
   iob_adder adder10
     (
      .clk      (clk),
      .rst      (reset),

      //cpu interface
      .valid(slaves_req[`valid(`ADDER10)]),
      .address(slaves_req[`address(`ADDER10,`ADDER_ADDR_W+2)-2]),
      .wdata(slaves_req[`wdata(`ADDER10)-(`DATA_W-`ADDER_WDATA_W)]),
      .wstrb(slaves_req[`wstrb(`ADDER10)]),
      .rdata(slaves_resp[`rdata(`ADDER10)]),
      .ready(slaves_resp[`ready(`ADDER10)])
      );

