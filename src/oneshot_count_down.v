module time_up 
  (
    input  clk,
    input  rst_n,
    input  reload,
    input [31:0] cfg_reload,
    output reg [31:0] cnt
  );

  always@(posedge clk or negedge rst_n)
  begin
    if(!rst_n)
        cnt <= 32'hffffffff;
    else if(reload)
        cnt <= cfg_reload;
    else
    begin  
      if(trig)                
          cnt <= cfg_reload - 32'd1;
      else if(cnt == 32'd0)  
          cnt <= cfg_reload;
      else if(cnt < cfg_reload)      
          cnt <= cnt - 32'd1;
    end
  end
