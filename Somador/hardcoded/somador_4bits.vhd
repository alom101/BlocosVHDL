library IEEE;
use IEEE.Std_Logic_1164.all;


--                     SOMADOR 4 BITS
--
-- feito por Arthur Leones Osorio Machado
-- disponível em https://github.com/alom101/BlocosVHDL.git

entity somador_4bits is
	port(
		A,B:   in std_logic_vector(3 downto 0);
		Ci:	 in std_logic;
		S:		out std_logic_vector(3 downto 0);
		Co:	out std_logic
		 );
end somador_4bits;

architecture arch of somador_4bits is

	signal C: std_logic_vector(2 downto 0);

	component somador_completo is

		port(
			A,B,Ci:  in std_logic;
			S,Co:		out std_logic
			 );
	end component;

	begin
		S0: somador_completo port map(A(0),B(0),Ci  ,S(0),C(0));
		S1: somador_completo port map(A(1),B(1),C(0),S(1),C(1));
		S2: somador_completo port map(A(2),B(2),C(1),S(2),C(2));
		S3: somador_completo port map(A(3),B(3),C(2),S(3),Co);
end arch;
