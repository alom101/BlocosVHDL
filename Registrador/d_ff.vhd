library IEEE;
use IEEE.Std_Logic_1164.all;

--                Flip-flop tipo D
--
-- feito por Arthur Leones Osorio Machado
-- disponível em https://github.com/alom101/BlocosVHDL.git

entity d_ff is
    port (
        D,EN,CLK,RST: in  std_logic;
        Q:            out std_logic
        );
end d_ff;

architecture behv of d_ff is
    begin
        process (CLK,  RST, D, EN)
        begin
            if RST = '1' then
                Q <= '0';
            elsif (CLK'event and CLK = '1') then
                    if EN = '1' then
                        Q <= D;
                    end if;
            end if;
        end process;
end behv;
