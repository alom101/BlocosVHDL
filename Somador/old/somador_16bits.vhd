library IEEE;
use IEEE.Std_Logic_1164.all;


--                     SOMADOR 16 BITS
--
-- feito por Arthur Leones Osorio Machado
-- disponível em https://github.com/alom101/BlocosVHDL.git

entity somador_16bits is
	port(
		A,B:   in std_logic_vector(15 downto 0);
		Ci:	 in std_logic;
		S:		out std_logic_vector(15 downto 0);
		Co:	out std_logic
		 );
end somador_16bits;

architecture arch of somador_16bits is

	signal C: std_logic;
	
component somador_8bits is
	port(
		A,B:   in std_logic_vector(7 downto 0);
		Ci:	 in std_logic;
		S:		out std_logic_vector(7 downto 0);
		Co:	out std_logic
		 );
end component;

	begin
		S0: somador_8bits port map(A(7  downto 0),B(7  downto 0),Ci,S(7  downto 0),C );
		S1: somador_8bits port map(A(15 downto 8),B(15 downto 8),C ,S(15 downto 8),Co);
end arch;
