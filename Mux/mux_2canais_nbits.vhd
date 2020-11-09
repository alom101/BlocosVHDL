library IEEE;
use IEEE.Std_Logic_1164.all;

--                MUX GENÉRICO DE 2 CANAIS E N BITS
--
-- feito por Arthur Leones Osorio Machado
-- disponível em https://github.com/alom101/BlocosVHDL.git

entity mux_2canais_nbits is
    generic (
            nbits : natural := 8
            );
    port    (
            A,B:    in std_logic_vector(nbits-1 downto 0);
            sel:    in std_logic;
            S:      out std_logic_vector(nbits-1 downto 0)
            );
end mux_2canais_nbits;

architecture arch of mux_2canais_nbits is
    begin
        gerador: for i in 0 to nbits-1 generate
            S(i) <= (A(i) and (not sel)) or (B(i) and sel);
        end generate gerador;
end arch;
