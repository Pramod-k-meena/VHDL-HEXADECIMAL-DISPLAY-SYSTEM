library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_entity is
    port(
    input1: in std_logic_vector(3 downto 0);
    input2: in std_logic_vector(3 downto 0);
    input3: in std_logic_vector(3 downto 0);
    input4: in std_logic_vector(3 downto 0);
    clock:  in std_logic; 
    resetting: in std_logic;
    output_anode:   out STD_LOGIC_VECTOR (3 downto 0);
    output_cathode: out STD_LOGIC_VECTOR (6 downto 0)
    );
end top_entity;

architecture Behavioral of top_entity is
	component mux4x1 is
    	port(
    	i1: in std_logic_vector(3 downto 0);
    	i2: in std_logic_vector(3 downto 0);
    	i3: in std_logic_vector(3 downto 0);
    	i4: in std_logic_vector(3 downto 0);
    	sel:in std_logic_vector(1 downto 0);
    	outputkar:out std_logic_vector(3 downto 0)
    );
  	end component;
	component Timing_block is
		Port (
        clk_in     : in  STD_LOGIC;  
        reset      : in  STD_LOGIC;  
        mux_select : out STD_LOGIC_VECTOR(1 downto 0);  
        anodes     : out STD_LOGIC_VECTOR(3 downto 0)
    );
	end component;
	component bcd_7 is
		port (
        bcd_input: in std_logic_vector(3 downto 0);
        bcd_output: out std_logic_vector(6 downto 0)
    );
	end component;
signal out4x1:std_logic_vector(3 downto 0);
signal timing_out:std_logic_vector(1 downto 0);
begin
  DUT1:mux4x1 port map(input1,input2,input3,input4,timing_out,out4x1);
  DUT2:Timing_block port map(clock,resetting,timing_out,output_anode);
  DUT3:bcd_7 port map(out4x1,output_cathode);

end Behavioral;
