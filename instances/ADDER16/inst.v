   //
   // ADDER16
   //
   iob_adder adder16
     (
      .clk      (clk),
      .rst      (reset),

      //cpu interface
      .valid(slaves_req[`valid(`ADDER16)]),
      .address(slaves_req[`address(`ADDER16,`ADDER_ADDR_W+2)-2]),
      .wdata(slaves_req[`wdata(`ADDER16)-(`DATA_W-`ADDER_WDATA_W)]),
      .wstrb(slaves_req[`wstrb(`ADDER16)]),
      .rdata(slaves_resp[`rdata(`ADDER16)]),
      .ready(slaves_resp[`ready(`ADDER16)])
      );

