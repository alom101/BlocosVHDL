library IEEE;
use IEEE.Std_Logic_1164.all;


--  _________________________________________
-- |		Somador de 8 bits com carry out 		|
-- | 														|
-- |	feito por Arthur Leones Osorio Machado	|
-- |_________________________________________|
--

entity somador_8bits is
	port(
		A,B:   in std_logic_vector(7 downto 0);
		Ci:	 in std_logic;
		S:		out std_logic_vector(7 downto 0);
		Co:	out std_logic
		 );
end somador_8bits;

architecture arch of somador_8bits is

	signal C: std_logic;
	
component somador_4bits is
	port(
		A,B:   in std_logic_vector(3 downto 0);
		Ci:	 in std_logic;
		S:		out std_logic_vector(3 downto 0);
		Co:	out std_logic
		 );
end component;

	begin
		S0: somador_4bits port map(A(3 downto 0),B(3 downto 0),Ci,S(3 downto 0),C );
		S1: somador_4bits port map(A(7 downto 4),B(7 downto 4),C ,S(7 downto 4),Co);
end arch;