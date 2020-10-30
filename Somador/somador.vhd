library IEEE;
use IEEE.Std_Logic_1164.all;

--  _________________________________________
-- |					Meio Somador 					|
-- | 														|
-- |	feito por Arthur Leones Osorio Machado	|
-- |_________________________________________|
--

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