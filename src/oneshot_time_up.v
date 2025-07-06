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
        cnt <= 32'd
    else
    begin  
      if(trig)                
          cnt <= 32'd1;
      else if(cnt >= cfg_max)  //stop counting
          cnt <= 32'd0;
      else if(cnt > 32'd0)      //counting
          cnt <= cnt + 32'd1;
    end
  end
