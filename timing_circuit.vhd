library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;


entity Timing_block is
    Port (
        clk_in     : in  STD_LOGIC;  -- 100 MHz input clock
        reset      : in  STD_LOGIC;  -- Reset signal
        mux_select : out STD_LOGIC_VECTOR(1 downto 0);  -- Signal for the mux
        anodes     : out STD_LOGIC_VECTOR(3 downto 0)   -- Anodes signal for display
    );
end Timing_block;

architecture Behavioral of Timing_block is
    constant N : integer := 50000;
    signal counter : integer := 0;
    signal new_clk : STD_LOGIC := '0';
    signal mux_select_int : integer:= 0;
begin

    -- Process 1 for dividing the clock from 100 MHz to 1 kHz
    clk_NEW: process(clk_in, reset)
    begin
        if reset = '1' then
            new_clk <= '0';
            counter <= 0;
        elsif reset='0' then
            if rising_edge(clk_in) then
                if counter = N then
                	counter <= 0;
                    new_clk <= not new_clk;
            	elsif counter<N then 
                	counter <= counter + 1;
            	end if;
        	end if;
        end if;
    end process clk_NEW;

    -- Process 2 for mux select signal 
    select_MUX: process(new_clk)
    begin
        if reset='1' then 
          mux_select_int<=0;
        elsif rising_edge(new_clk) then
          if mux_select_int<3 then
            mux_select_int <= mux_select_int + 1;
          else 
      		mux_select_int<=0;
    	  end if;
        end if;
	mux_select <= std_logic_vector(to_unsigned(mux_select_int,2));
    end process select_MUX;

    -- Process 3 for anode signal
    ANODE_select: process(mux_select_int)
    begin
        case mux_select_int is
            when 0 => anodes <= "1110";  
            when 1 => anodes <= "1101";  
            when 2 => anodes <= "1011";  
            when 3 => anodes <= "0111";  
            when others => anodes <= "1111";
        end case;
    end process ANODE_select;
end Behavioral;


