library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

entity timing_circuit_tb is
end timing_circuit_tb;


architecture tb of timing_circuit_tb is
component timing_block
Port (
        clk_in     : in  STD_LOGIC;  -- 100 MHz input clock
        reset      : in  STD_LOGIC;  -- Reset signal
        mux_select : out STD_LOGIC_VECTOR(1 downto 0);  -- Signal for the mux
        anodes     : out STD_LOGIC_VECTOR(3 downto 0)   -- Anodes signal for display
    );

end component;
signal a,b: std_logic;
signal c: std_logic_vector(1 downto 0);
signal d: std_logic_vector(3 downto 0);
constant CLOCK_PERIOD : time := 10 ns;
begin
    UUT: timing_block port map(a,b,c,d);
    clk_process : process
    begin
        a <= '0';
        wait for CLOCK_PERIOD / 2;
        a <= '1';
        wait for CLOCK_PERIOD / 2;
    end process clk_process;

    testing : process
    begin
        b <= '1';
        wait for 50 ns;
        b <= '0';
        wait for 150 ns;  
        wait;
    end process testing;
end tb;