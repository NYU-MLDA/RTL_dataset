module network_input_blk_multi_out
   #(parameter LOG2_NUMBER_FIFO_ELEMENTS = 2)
(
   input wire clk,
   input wire reset,
   input wire [64-1:0] data_in,
   input wire valid_in,
   input wire thanks_in,

   output wire yummy_out,
   // data_val and data_val1 are the same, this is just done for buffering to
   // convince the synthesis tool to buffer up these high fanout nets
   output wire [64-1:0] data_val,
   output wire [64-1:0] data_val1,
   output wire data_avail
);

reg [64-1:0] storage_data_f [0:(1<<LOG2_NUMBER_FIFO_ELEMENTS)-1];

reg [LOG2_NUMBER_FIFO_ELEMENTS-1:0] head_ptr_f;
reg [LOG2_NUMBER_FIFO_ELEMENTS-1:0] tail_ptr_f;
reg [LOG2_NUMBER_FIFO_ELEMENTS:0] elements_in_array_f;

reg [LOG2_NUMBER_FIFO_ELEMENTS-1:0] head_ptr_next;
reg [LOG2_NUMBER_FIFO_ELEMENTS-1:0] tail_ptr_next;
reg [LOG2_NUMBER_FIFO_ELEMENTS:0] elements_in_array_next;

reg yummy_out_f;

assign yummy_out = yummy_out_f;

// data_val and data_val1 are the same, just done for buffering
assign data_val = storage_data_f[head_ptr_f];
assign data_val1 = storage_data_f[head_ptr_f];
assign data_avail = elements_in_array_f != 0;

always @ *
begin
   head_ptr_next = head_ptr_f;
   tail_ptr_next = tail_ptr_f;
   elements_in_array_next = elements_in_array_f;
   case({valid_in,thanks_in})
      2'b00:
         begin
            // do nothing here
         end
      2'b01:
         begin
            // we are being dequeued from
            head_ptr_next = head_ptr_f + 1;
            elements_in_array_next = elements_in_array_f - 1;
         end
      2'b10:
         begin
            // we are being enqueued into
            tail_ptr_next = tail_ptr_f + 1;
            elements_in_array_next = elements_in_array_f + 1;
         end
      2'b11:
         begin
            // simultaneous enqueue and dequeue
            head_ptr_next = head_ptr_f + 1;
            tail_ptr_next = tail_ptr_f + 1;
         end
      default:
         begin
            // this is an error because this is a full parallel case statement
         end
   endcase
end

always @ (posedge clk)
begin
   if (reset)
   begin
      yummy_out_f <= 0;
      head_ptr_f <= 0;
      tail_ptr_f <= 0;
      elements_in_array_f <= 0;
   end
   else
   begin
      yummy_out_f <= thanks_in; // this is just a feed through via a flip flop
      head_ptr_f <= head_ptr_next;
      tail_ptr_f <= tail_ptr_next;
      elements_in_array_f <= elements_in_array_next;
      if(valid_in)
      begin
         storage_data_f[tail_ptr_f] <= data_in;
      end
   end
end

endmodule