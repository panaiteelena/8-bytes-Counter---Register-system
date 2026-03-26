library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SequentialSystem is
    Port (
        clk_in : in std_logic;
        reset   : in  STD_LOGIC;                     -- Reset prioritar activ pe 1
        sel     : in  STD_LOGIC_VECTOR (1 downto 0); -- Intrare de selec?ie
        Din     : in  STD_LOGIC_VECTOR (7 downto 0); -- Datele de intrare pentru modul registru
        Dout    : out STD_LOGIC_VECTOR (7 downto 0)  -- Iesirea sistemului
    );
end SequentialSystem;

architecture Behavioral of SequentialSystem is
    signal reg : STD_LOGIC_VECTOR (7 downto 0) := (others => '0'); -- Registru intern
    signal clk1hz : STD_LOGIC;
    
begin
    process(clk_in)
    variable n : integer range 0 to 1000000000;
    begin
        if clk_in' event and clk_in = '1' then
            if n < 100000000 then
                n := n+1;
            else
                n := 0;
            end if;
            if n <= 50000000 then
                clk1hz <= '1';
            else
                clk1hz <= '0';
            end if;
        end if;
    end process;

    process(clk1hz, reset)
    begin
        if reset = '1' then
            reg <= (others => '0'); -- Resetare registru
        elsif rising_edge(clk1hz) then
            case sel is
                when "00" =>  -- Modul registru paralel
                    reg <= Din;
                when "01" =>  -- Modul numarator binar invers
                    reg <= reg - 1;
                when others =>
                    reg <= reg; -- Alte combinatii: mentine starea curenta
            end case;
        end if;
    end process;

    Dout <= reg; -- Iesirea este valoarea registrului intern

end Behavioral;