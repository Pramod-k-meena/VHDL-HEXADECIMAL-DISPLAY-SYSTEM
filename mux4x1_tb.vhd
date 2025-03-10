library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;


entity mux4x1_tb is
end mux4x1_tb;


architecture tb of mux4x1_tb is
component mux4x1
port(
    i1: in std_logic_vector(3 downto 0);
    i2: in std_logic_vector(3 downto 0);
    i3: in std_logic_vector(3 downto 0);
    i4: in std_logic_vector(3 downto 0);
    sel:in std_logic_vector(1 downto 0);
    outputkar:out std_logic_vector(3 downto 0)
    );	
end component;
signal i1,i2,i3,i4,outputkar: std_logic_vector(3 downto 0);
signal sel: std_logic_vector(1 downto 0);
begin
  UUT: mux4x1 port map(i1,i2,i3,i4,sel,outputkar);
  test: process
    begin
        for s in 0 to 3 loop
	    sel <= std_logic_vector(to_unsigned(s, 2));  
            for i in 0 to 15 loop  
                i1 <= std_logic_vector(to_unsigned(i, 4));
                i2 <= std_logic_vector(to_unsigned((i + 1) mod 16, 4));  
                i3 <= std_logic_vector(to_unsigned((i + 2) mod 16, 4));  
                i4 <= std_logic_vector(to_unsigned((i + 3) mod 16, 4));  
                
                wait for 10 ns;
            end loop;
        end loop;

        wait;
    end process;
    
end tb;