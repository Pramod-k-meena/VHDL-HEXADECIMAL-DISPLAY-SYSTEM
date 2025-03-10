library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;


entity bcd_7_tb is
end bcd_7_tb;


architecture tb of bcd_7_tb is
component bcd_7
port (
        bcd_input:in std_logic_vector(3 downto 0);
        bcd_output:out std_logic_vector(6 downto 0)
    );
end component;
signal go_in_bcd: std_logic_vector(3 downto 0);
signal go_out_bcd: std_logic_vector(6 downto 0);
begin
  UUT: bcd_7 port map(go_in_bcd,go_out_bcd);
    testing: process
    begin
        go_in_bcd <= "0000"; 
        wait for 20 ns;
        go_in_bcd <= "0001"; 
        wait for 20 ns;
        go_in_bcd <= "0010"; 
        wait for 20 ns;
        go_in_bcd <= "0011"; 
        wait for 20 ns;
        go_in_bcd <= "0100"; 
        wait for 20 ns;
        go_in_bcd <= "0101"; 
        wait for 20 ns;
        go_in_bcd <= "0110"; 
        wait for 20 ns;
        go_in_bcd <= "0111"; 
        wait for 20 ns;
        go_in_bcd <= "1000"; 
        wait for 20 ns;
        go_in_bcd <= "1001"; 
        wait for 20 ns;
        go_in_bcd <= "1010"; 
        wait for 20 ns;
        go_in_bcd <= "1011"; 
        wait for 20 ns;
        go_in_bcd <= "1100"; 
        wait for 20 ns;
        go_in_bcd <= "1101"; 
        wait for 20 ns;
        go_in_bcd <= "1110"; 
        wait for 20 ns;
        go_in_bcd <= "1111"; 
        wait for 20 ns;

        wait;
    end process testing;

end tb;