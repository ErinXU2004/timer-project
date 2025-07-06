module time_up 
  (
    input  clk,
    input  rst_n,
    input  trig,
    output [31:0] cfg_max,
    output reg [31:0] cnt
  );

  always@(posedge clk or negedge rst_n)
  begin
    if(!rst_n)
        cnt <= 32'd0;
    else if(~en)
        cnt <= 32'd0; //recount when not enable
    else  
    begin                
      if(cnt >= cfg_max)    //count back to zero when reach max
          cnt <= 32'd0;
      else
          cnt <= cnt + 32'd1;  //counting
    end 
  end
