library IEEE;
use IEEE.Std_Logic_1164.all;

--                COMPARADOR DE 1 BIT EXPANSÍVEL
--
--      Realiza as comparações:
--          A 'Maior' que B
--          A 'Igual' a   B
--          A 'Menor' que B
--
--      Para expandir, basta ligar os comparadores em série.
--
-- feito por Arthur Leones Osorio Machado
-- disponível em https://github.com/alom101/BlocosVHDL.git

entity comparador_1bit is
    port    (
            A,B:        in std_logic;
            LSB_COMP:   in std_logic_vector(2 downto 0);
            S:          out std_logic_vector(2 downto 0)   -- [menor, igual, maior]
            );
end comparador_1bit;


architecture arch of comparador_1bit is

    signal MSB_COMP: std_logic_vector(2 downto 0);
    
    component comparador_base is
    port    (
            A,B:    in std_logic;
            S:      out std_logic_vector(2 downto 0)   -- [menor, igual, maior]
            );
    end component;
    
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
        COMP: comparador_base   port    map(A,B,MSB_COMP);
        
        MUX: mux_2canais_nbits  generic map(3)
                                port    map(MSB_COMP,LSB_COMP,MSB_COMP(1),S);
end arch;
