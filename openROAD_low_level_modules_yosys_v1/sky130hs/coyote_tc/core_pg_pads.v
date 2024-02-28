module core_pg_pads #(parameter NUM_PAIRS = 1) (
  `ABUT_PORTS
);
  sky130_ef_io__vccd_hvc_pad vccd [NUM_PAIRS-1:0] (`ABUT_CONNECT);
  sky130_ef_io__vssd_hvc_pad vssd [NUM_PAIRS-1:0] (`ABUT_CONNECT);
endmodule