LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

ENTITY tb_top_entity IS
END tb_top_entity;

ARCHITECTURE behavior OF tb_top_entity IS 

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT top_entity
    PORT(
         input1 : IN  std_logic_vector(3 downto 0);
         input2 : IN  std_logic_vector(3 downto 0);
         input3 : IN  std_logic_vector(3 downto 0);
         input4 : IN  std_logic_vector(3 downto 0);
         clock : IN  std_logic;
         resetting : IN  std_logic;
         output_anode : OUT std_logic_vector(3 downto 0);
         output_cathode : OUT std_logic_vector(6 downto 0)
        );
    END COMPONENT;
   signal input1 : std_logic_vector(3 downto 0) := "0000";
   signal input2 : std_logic_vector(3 downto 0) := "0000";
   signal input3 : std_logic_vector(3 downto 0) := "0000";
   signal input4 : std_logic_vector(3 downto 0) := "0000";
   signal clock : std_logic := '0';
   signal resetting : std_logic := '0';

   signal output_anode : std_logic_vector(3 downto 0);
   signal output_cathode : std_logic_vector(6 downto 0);

   constant clk_period : time := 10 ns;

BEGIN

uut:top_entity PORT MAP (input1,input2,input3,input4,clock,resetting,output_anode,output_cathode);

   clock_process :process
   begin
		clock <= '0';
		wait for clk_period/2;
		clock <= '1';
		wait for clk_period/2;
   end process;

   testing_process : process
    variable i : integer;
    begin
        resetting <= '1'; 
        wait for 20 ns;
        resetting <= '0'; 
        wait for 20 ns;

        -- Apply all combinations of inputs
        for i in 0 to 15 loop
            input1 <= std_logic_vector(to_unsigned(i, 4));
            input2 <= std_logic_vector(to_unsigned((i + 1) mod 16, 4));
            input3 <= std_logic_vector(to_unsigned((i + 2) mod 16, 4));
            input4 <= std_logic_vector(to_unsigned((i + 3) mod 16, 4));
            wait for 20 ns;
        end loop;

        -- End simulation
        wait;
    end process testing_process;

END;