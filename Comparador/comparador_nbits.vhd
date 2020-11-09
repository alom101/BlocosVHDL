library IEEE;
use IEEE.Std_Logic_1164.all;

--                COMPARADOR GENÉRICO DE N BITS
--
--      Realiza as comparações:
--          A 'Maior' que B     S(2)
--          A 'Igual' a   B     S(1)
--          A 'Menor' que B     S(0)
--
-- feito por Arthur Leones Osorio Machado
-- disponível em https://github.com/alom101/BlocosVHDL.git

entity comparador_nbits is
    generic (
            nbits : natural := 8
            );
    port    (
            A,B:    in std_logic_vector(nbits-1 downto 0);
            S:      out std_logic_vector(2 downto 0)
            );
end comparador_nbits;


architecture arch of comparador_nbits is

    signal sig_S_COMP: std_logic_vector((nbits+1)*3 downto 1);

    component comparador_1bit is
        port    (
                A,B:        in std_logic;
                LSB_COMP:   in std_logic_vector(2 downto 0);
                S:          out std_logic_vector(2 downto 0)   -- [menor, igual, maior]
                );
    end component;

    begin
        sig_S_COMP(1) <= '0';
        sig_S_COMP(2) <= '1';
        sig_S_COMP(3) <= '0';
        
        comparadores: for i in nbits downto 1 generate
            COMP: comparador_1bit port map(A(i-1),B(i-1),sig_S_COMP(i*3 downto (i-1)*3+1),sig_S_COMP((i+1)*3 downto i*3+1));
        end generate comparadores;
        
        S(2) <= sig_S_COMP((nbits+1)*3);
        S(1) <= sig_S_COMP((nbits+1)*3-1);
        S(0) <= sig_S_COMP((nbits+1)*3-2);        
end arch;
