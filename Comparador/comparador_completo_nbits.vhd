library IEEE;
use IEEE.Std_Logic_1164.all;

--                COMPARADOR 'COMPLETO' GENÉRICO DE N BITS
--
--      Realiza as comparações:
--          A 'Maior' que B
--          A 'Igual' a   B
--          A 'Menor' que B
--
-- feito por Arthur Leones Osorio Machado
-- disponível em https://github.com/alom101/BlocosVHDL.git

entity comparador_completo_nbits is
    generic (
            nbits : natural := 8
            );
    port    (
            A,B:    in std_logic_vector(nbits-1 downto 0);
            S:      out std_logic_vector(nbits-1 downto 0);
            );
end comparador_completo_nbits;

architecture arch of comparador_completo_nbits is
    signal resultado:   std_logic_vector(nbits-1 downto 0);
    
    begin
        generate_comparadores_1bit: for i in 0 to nbits-1 generate
            resultado(i) <= A(i) xor B(i);
        end generate generate_somador;
        
end arch;
