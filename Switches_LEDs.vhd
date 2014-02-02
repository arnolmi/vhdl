----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:35:11 01/30/2014 
-- Design Name: 
-- Module Name:    Switches_LEDs - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Switches_LEDs is
    Port ( sevenseg : out STD_LOGIC_VECTOR(6 downto 0);
			  anodes   : out STD_LOGIC_VECTOR(3 downto 0);
			  clk		  : in  STD_LOGIC;
			  dp       : out STD_LOGIC;
			  btna	  : in  STD_LOGIC);
end Switches_LEDs;

architecture Behavioral of Switches_LEDs is
	signal clock : STD_LOGIC_VECTOR(29 downto 0) := (others => '0');
	signal toggle : STD_LOGIC_VECTOR(1 downto 0);
	signal A : STD_LOGIC_VECTOR(3 downto 0);
	signal B : STD_LOGIC_VECTOR(3 downto 0);
	signal C : STD_LOGIC_VECTOR(3 downto 0);
	signal D : STD_LOGIC_VECTOR(3 downto 0);
	signal sevensegA : STD_LOGIC_VECTOR(6 downto 0);	
	signal sevensegB : STD_LOGIC_VECTOR(6 downto 0);	
	signal sevensegC : STD_LOGIC_VECTOR(6 downto 0);
	signal sevensegD : STD_LOGIC_VECTOR(6 downto 0);
	signal slow_clock : STD_LOGIC_VECTOR(29 downto 0) := (others => '0');
	
begin
	clk_proc: process(clk, toggle, A, B, C, D, sevensegA, sevensegB, sevensegC, sevensegD, btna)
	begin
		if rising_edge(clk) then
			if(btna = '1') then
				A <= "0000";
				B <= "0000";
				C <= "0000";
				D <= "0000";
			end if;
			clock <= clock +1;
			slow_clock <= slow_clock +1;
			if(slow_clock = 10000) then
				slow_clock <= "000000000000000000000000000000";
				toggle <= toggle + 1;
			end if;

			if(clock = 50000000) then
				clock <= "000000000000000000000000000000";
				A <= A + 1;
				if(A = "1001") then
					A <= "0000";
					B <= B + 1;
				end if;
				if(B = "0101" AND A = "1001") then
					B <= "0000";
					C <= C + 1;
				end if;
				if(C = "1001") then
					C <= "0000";
					D <= D + 1;
				end if;	
				if(D = "0101" AND C = "1001") then
					D <= "0000";
				end if;
			end if;		
		end if;
	end process;
	dp <= '1';
		
	DecoderA: entity BCDDecoder port map(binaryDigit => A, bcdDigit => sevensegA);
	DecoderB: entity BCDDecoder port map(binaryDigit => B, bcdDigit => sevensegB);
	DecoderC: entity BCDDecoder port map(binaryDigit => C, bcdDigit => sevensegC);
	DecoderD: entity BCDDecoder port map(binaryDigit => D, bcdDigit => sevensegD);
	
	BCDMux: entity AnodeMux port map(anodeSelector => toggle,
												anodeMap => anodes,
												outputDisplay => sevenseg,
												inputDisplayA => sevensegA,
												inputDisplayB => sevensegB,
												inputDisplayC => sevensegC,
												inputDisplayD => sevensegD
												);

end Behavioral;
