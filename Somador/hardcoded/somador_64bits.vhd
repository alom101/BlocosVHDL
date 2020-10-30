library IEEE;
use IEEE.Std_Logic_1164.all;


--  _________________________________________
-- |		Somador de 32 bits com carry out 	|
-- | 														|
-- |	feito por Arthur Leones Osorio Machado	|
-- |_________________________________________|
--

entity somador_64bits is
	port(
		A,B:   in std_logic_vector(63 downto 0);
		Ci:	 in std_logic;
		S:		out std_logic_vector(63 downto 0);
		Co:	out std_logic
		 );
end somador_64bits;

architecture arch of somador_64bits is

	signal C: std_logic;
	
component somador_32bits is
	port(
		A,B:   in std_logic_vector(31 downto 0);
		Ci:	 in std_logic;
		S:		out std_logic_vector(31 downto 0);
		Co:	out std_logic
		 );
end component;

	begin
		S0: somador_32bits port map(A(31 downto 0),B(31  downto 0),Ci,S(31  downto 0),C );
		S1: somador_32bits port map(A(63 downto 32),B(63 downto 32),C ,S(63 downto 32),Co);
end arch;