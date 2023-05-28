module mainctrl(
	input clk,
	input RESET,

	//Switches to select drink
	input load0,
	input load1,
	input load2,
	input load3,

	//Toggle for dispensing drink
	input out0,
	input out1,
	input out2,
	input out3,

	//Stimulus for 1s count
	output reg out_ctrl0,
	output reg out_ctrl1,
	output reg out_ctrl2,
	output reg out_ctrl3,

	//air pump
	output p0,		
	output p1,
	output p2,
	output p3

);


/*
parameter IDLE		= 3'b000;
parameter SELECT	= 3'b001;
parameter EMIT_RD   = 3'b111;
parameter EMIT0		= 3'b010;
parameter EMIT1		= 3'b011;
parameter EMIT2		= 3'b100;
parameter EMIT3		= 3'b101;


reg[2:0] state;
reg[2:0] n_state;
*/
reg [3:0] state;
reg [3:0] n_state;

parameter IDLE = 4'b0000;
parameter SELECT = 4'b0001;
parameter EMIT_RD0 = 4'b0010;
parameter EMIT_RD1 = 4'b0011;
parameter EMIT_RD2 = 4'b0100;
parameter EMIT_RD3 = 4'b0101;
parameter EMIT0 = 4'b0110;
parameter EMIT1 = 4'b0111;
parameter EMIT2 = 4'b1000;
parameter EMIT3 = 4'b1001;


//load
reg l0;
reg l1;
reg l2;
reg l3;


//state machine
always @(posedge clk) begin
	if(!RESET) state <= IDLE;
	else state <= n_state;
end


always @(*) begin
	case(state)
		IDLE :
			n_state <= SELECT;

		
		SELECT: begin
			if (l0) n_state <= EMIT_RD0;
			else if (l1) n_state <= EMIT_RD1;
			else if (l2) n_state <= EMIT_RD2;
			else if (l3) n_state <= EMIT_RD3;
			else n_state <= SELECT;
		/*
			if(l0 || l1 || l2 || l3) n_state <= EMIT0;
			else n_state <= SELECT;
			*/
		end

		EMIT_RD0: n_state <= EMIT0;
		EMIT_RD1: n_state <= EMIT1;
		EMIT_RD2: n_state <= EMIT2;
		EMIT_RD3: n_state <= EMIT3;


		EMIT0 : begin
			if(p0 == 0) n_state <= IDLE;
			else n_state <= EMIT0;
		end


		EMIT1 : begin
			if(p1 == 0) n_state <= IDLE;
			else n_state <= EMIT1;
		end


		EMIT2 : begin
			if(p2 == 0) n_state <= IDLE;
			else n_state <= EMIT2;
		end


		EMIT3 : begin
			if(p3 == 0) n_state <= IDLE;
			else n_state <= EMIT3;
		end

		default : n_state <= IDLE;
	endcase
end


always @(*) begin
	case(state)
	IDLE : begin
		l0 <= 0;
		l1 <= 0;
		l2 <= 0;
		l3 <= 0;
		out_ctrl0 <=0;
		out_ctrl1 <=0;
		out_ctrl2 <=0;
		out_ctrl3 <=0;
	end

	SELECT : begin
		l0 <= load0;
		l1 <= load1;
		l2 <= load2;
		l3 <= load3;
		out_ctrl0 <=0;
		out_ctrl1 <=0;
		out_ctrl2 <=0;
		out_ctrl3 <=0;
	end
	EMIT_RD0: out_ctrl0 <= 1;
	EMIT_RD1: out_ctrl1 <= 1;
	EMIT_RD2: out_ctrl2 <= 1;
	EMIT_RD3: out_ctrl3 <= 1;
	EMIT0 : begin
		out_ctrl0 <=1;
		l0 <= 0;
	end
	EMIT1 : begin
		out_ctrl1 <=1;
		l1 <= 0;
	end
	EMIT2 : begin
		out_ctrl2 <=1;
		l2 <= 0;
	end
	EMIT3 : begin
		out_ctrl3 <=1;
		l3 <= 0;
	end

	endcase
end
/*
always @(*) begin
	p0 <= out0;
	p1 <= out1;
	p2 <= out2;
	p3 <= out3;
end
*/

assign p0 = (state == EMIT0) ? out0 : 0;
assign p1 = (state == EMIT1) ? out1 : 0;
assign p2 = (state == EMIT2) ? out2 : 0;
assign p3 = (state == EMIT3) ? out3 : 0;
/*
assign p0 = out0;
assign p1 = out1;
assign p2 = out2;
assign p3 = out3;
*/
endmodule