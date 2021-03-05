   //
   // ADDER15
   //
   iob_adder adder15
     (
      .clk      (clk),
      .rst      (reset),

      //cpu interface
      .valid(slaves_req[`valid(`ADDER15)]),
      .address(slaves_req[`address(`ADDER15,`ADDER_ADDR_W+2)-2]),
      .wdata(slaves_req[`wdata(`ADDER15)-(`DATA_W-`ADDER_WDATA_W)]),
      .wstrb(slaves_req[`wstrb(`ADDER15)]),
      .rdata(slaves_resp[`rdata(`ADDER15)]),
      .ready(slaves_resp[`ready(`ADDER15)])
      );

