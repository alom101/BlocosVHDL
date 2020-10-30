library IEEE;
use IEEE.Std_Logic_1164.all;


--                      MEIO SOMADOR
--
-- feito por Arthur Leones Osorio Machado
-- disponível em https://github.com/alom101/BlocosVHDL.git

entity somador is
	port(
		A,B:  in std_logic;
		S,Co:out std_logic
		 );
end somador;

architecture arch of somador is
	begin
		S <= A xor B;
		Co<= A and B;
end arch;
