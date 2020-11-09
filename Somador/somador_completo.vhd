library IEEE;
use IEEE.Std_Logic_1164.all;

--                      SOMADOR COMPLETO
--
-- feito por Arthur Leones Osorio Machado
-- disponível em https://github.com/alom101/BlocosVHDL.git

entity somador_completo is
    port(
        A,B,Ci:   in std_logic;
        S,Co:     out std_logic
        );
end somador_completo;

architecture arch of somador_completo is
    begin
        S   <= A xor B xor Ci;
        Co  <= (A and B) or (A and Ci) or (B and Ci);
end arch;
