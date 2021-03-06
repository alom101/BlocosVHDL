library IEEE;
use IEEE.Std_Logic_1164.all;

--                SOMADOR GENÉRICO DE N BITS
--
-- feito por Arthur Leones Osorio Machado
-- disponível em https://github.com/alom101/BlocosVHDL.git

entity somador_nbits is
    generic (
            nbits : natural := 8
            );
    port(
        A,B:    in std_logic_vector(nbits-1 downto 0);
        Ci:     in std_logic;
        S:      out std_logic_vector(nbits-1 downto 0);
        Co:     out std_logic
         );
end somador_nbits;

architecture arch of somador_nbits is

    signal C:   std_logic_vector(nbits downto 0);

    component somador_completo is

        port(
            A,B,Ci: in std_logic;
            S,Co:   out std_logic
             );
    end component;

    begin
        
        C(0)    <= Ci;
        Co      <= C(nbits);
        
        generate_somador: for i in 0 to nbits-1 generate
            Somador_n: somador_completo port map(A(i),B(i),C(i),S(i),C(i+1));
        end generate generate_somador;

end arch;
