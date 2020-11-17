library IEEE;
use IEEE.Std_Logic_1164.all;

--                Registrador de n bits
--
-- feito por Arthur Leones Osorio Machado
-- disponível em https://github.com/alom101/BlocosVHDL.git

entity registrador is
    generic (
            nbits : natural := 8
            );
    port    (
            D:          in std_logic_vector(nbits-1 downto 0);
            EN,CLK,RST: in  std_logic;
            Q:          out std_logic_vector(nbits-1 downto 0)
            );
end registrador;

architecture arch of registrador is

    component d_ff is
        port (
            D,EN,CLK,RST: in  std_logic;
            Q:            out std_logic
            );
    end component;

    begin
        generate_registrador: for i in 0 to nbits-1 generate
            d_ff_n: d_ff port map(D(i),EN,CLK,RST,Q(i));
        end generate generate_registrador;

end arch;
