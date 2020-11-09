library IEEE;
use IEEE.Std_Logic_1164.all;

--                MUX GENÉRICO DE 4 CANAIS E N BITS
--
-- feito por Arthur Leones Osorio Machado
-- disponível em https://github.com/alom101/BlocosVHDL.git

entity mux_4canais_nbits is
    generic (
            nbits : natural := 8
            );
    port    (
            A,B,C,D:    in std_logic_vector(nbits-1 downto 0);
            sel:    in std_logic_vector(1 downto 0);
            S:      out std_logic_vector(nbits-1 downto 0)
            );
end mux_4canais_nbits;

architecture arch of mux_4canais_nbits is

    signal S1,S2: std_logic;

    component mux_2canais_nbits is
        generic (
                nbits : natural := 8
                );
        port    (
                A,B:    in std_logic_vector(nbits-1 downto 0);
                sel:    in std_logic;
                S:      out std_logic_vector(nbits-1 downto 0)
                );
    end component;

    begin
        MUX1: mux_2canais_nbits generic map(nbits)
                                port map(A,B,sel(0),S1);
        MUX2: mux_2canais_nbits generic map(nbits)
                                port map(C,D,sel(0),S2);
        MUX3: mux_2canais_nbits generic map(nbits)
                                port map(S1,S2,sel(1),S);
end arch;
