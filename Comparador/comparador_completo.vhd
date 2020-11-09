library IEEE;
use IEEE.Std_Logic_1164.all;

--                COMPARADOR 'COMPLETO' DE 1 BIT
--
--      Realiza as comparações:
--          A 'Maior' que B
--          A 'Igual' a   B
--          A 'Menor' que B
--
-- feito por Arthur Leones Osorio Machado
-- disponível em https://github.com/alom101/BlocosVHDL.git

entity comparador_completo is
    port    (
            A,B:                    in std_logic;
            Maior,Igual,Menor:      out std_logic;
            );
end comparador_completo;

architecture arch of comparador_completo is
    begin
        Maior <= A and not B;
        Igual <= not(A xor B);
        Menor <= not A and B;
end arch;
