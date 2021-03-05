   //
   // ADDER1
   //
   iob_adder adder5
     (
      .clk      (clk),
      .rst      (reset),

      //cpu interface
      .valid(slaves_req[`valid(`ADDER5)]),
      .address(slaves_req[`address(`ADDER5,`ADDER_ADDR_W+2)-2]),
      .wdata(slaves_req[`wdata(`ADDER5)-(`DATA_W-`ADDER_WDATA_W)]),
      .wstrb(slaves_req[`wstrb(`ADDER5)]),
      .rdata(slaves_resp[`rdata(`ADDER5)]),
      .ready(slaves_resp[`ready(`ADDER5)])
      );

