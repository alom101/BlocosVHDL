library IEEE;
use IEEE.Std_Logic_1164.all;


--  _________________________________________
-- |		Somador de 32 bits com carry out 	|
-- | 														|
-- |	feito por Arthur Leones Osorio Machado	|
-- |_________________________________________|
--

entity somador_32bits is
	port(
		A,B:   in std_logic_vector(31 downto 0);
		Ci:	 in std_logic;
		S:		out std_logic_vector(31 downto 0);
		Co:	out std_logic
		 );
end somador_32bits;

architecture arch of somador_32bits is

	signal C: std_logic;
	
component somador_16bits is
	port(
		A,B:   in std_logic_vector(15 downto 0);
		Ci:	 in std_logic;
		S:		out std_logic_vector(15 downto 0);
		Co:	out std_logic
		 );
end component;

	begin
		S0: somador_16bits port map(A(15  downto 0),B(15  downto 0),Ci,S(15  downto 0),C );
		S1: somador_16bits port map(A(31 downto 16),B(31 downto 16),C ,S(31 downto 16),Co);
end arch;