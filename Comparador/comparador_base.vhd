library IEEE;
use IEEE.Std_Logic_1164.all;

--                COMPARADOR BASE
--
--      Realiza as comparações:
--          A 'Maior' que B
--          A 'Igual' a   B
--          A 'Menor' que B
--
-- feito por Arthur Leones Osorio Machado
-- disponível em https://github.com/alom101/BlocosVHDL.git

entity comparador_base is
    port    (
            A,B:    in std_logic;
            S:      out std_logic_vector(2 downto 0)   -- [menor, igual, maior]
            );
end comparador_base;

architecture arch of comparador_base is
    begin
        S(2) <= A and not B;
        S(1) <= not(A xor B);
        S(0) <= not A and B;
end arch;
