
entity mux4x1 is
    port(
    i1: in std_logic_vector(3 downto 0);
    i2: in std_logic_vector(3 downto 0);
    i3: in std_logic_vector(3 downto 0);
    i4: in std_logic_vector(3 downto 0);
    sel:in std_logic_vector(1 downto 0);
    outputkar:out std_logic_vector(3 downto 0)
    );
end mux4x1;

architecture Behavioral of mux4x1 is

begin
    process(sel, i1, i2, i3, i4)
    begin
        case sel is
            when "00" =>
                outputkar <= i1;
            when "01" =>
                outputkar <= i2;
            when "10" =>
                outputkar <= i3;
            when "11" =>
                outputkar <= i4;
            when others =>
                outputkar <= (others => '0'); -- default case (although "others" should not be needed here)
        end case;
    end process;

end Behavioral;


Standard frequency of fpga. (100MHz)
n kitna liya 50000
Is n pe kitni frequency h 1kHz
Frequency kitni honi chahiye taaki acha dikkhe (60 hz se 1khz )
Kya höga
-agar freq 10 hz h
-agar freq 2Mhz hui to 
-agar anode select 0000 kr diye to kya hoca
-agar 1111 kar diye to 
Koi bhi cathode ke PIN number tao
Freq badhayenge ghatayenge to kya hoga
