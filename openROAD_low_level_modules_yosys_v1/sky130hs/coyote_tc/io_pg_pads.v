module io_pg_pads #(parameter NUM_PAIRS = 1) (
  `ABUT_PORTS
);
    sky130_ef_io__vddio_hvc_pad vddio [NUM_PAIRS-1:0] (`ABUT_CONNECT);
    sky130_ef_io__vssio_hvc_pad vssio [NUM_PAIRS-1:0] (`ABUT_CONNECT);
endmodule