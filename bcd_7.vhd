library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

entity bcd_7 is
    port (
        bcd_input:in std_logic_vector(3 downto 0);
        bcd_output:out std_logic_vector(6 downto 0)
    );
end bcd_7;
architecture Behavioral of bcd_7 is
	signal a,b,c,d:std_logic;
begin
	a<=bcd_input(0);
	b<=bcd_input(1);
	c<=bcd_input(2);
	d<=bcd_input(3);
	

    bcd_output(6) <= (not a and not b and not c and d) or (not a and b and not c and not d) or (a and b and not c and d) or (a and not b and c and d);
    bcd_output(5) <= (not a and b and not c and d) or (a and b and not c and not d) or (b and c and not d) or (a and c and d);
    bcd_output(4) <= (not a and not b and c and not d) or (a and  b and not c and not d) or (a and b and c);
    bcd_output(3) <= (not a and not b and not c and d) or (not a and b and not c and not d) or (b and c and d) or (a and not b and c and not d) ;

    bcd_output(2) <= (not a and d) or (not a and b and not c) or (not b and not c and d);

    bcd_output(1) <= (not a and not b and c) or (not a and not b and d) or (not a and c and d) or (a and b and not c and d);

    bcd_output(0) <= (not a and not b and not c) or (not a and b and c and d) or (a and b and not c and not d);

end behavioral;

