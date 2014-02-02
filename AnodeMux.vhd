----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:47:34 02/02/2014 
-- Design Name: 
-- Module Name:    AnodeMux - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AnodeMux is
    Port ( anodeSelector : in  STD_LOGIC_VECTOR (1 downto 0);
           anodeMap : out  STD_LOGIC_VECTOR (3 downto 0);
			  inputDisplayA :  in  STD_LOGIC_VECTOR (6 downto 0);
			  inputDisplayB :  in  STD_LOGIC_VECTOR (6 downto 0);
			  inputDisplayC :  in  STD_LOGIC_VECTOR (6 downto 0);
			  inputDisplayD :  in  STD_LOGIC_VECTOR (6 downto 0);
           outputDisplay : out  STD_LOGIC_VECTOR (6 downto 0));
end AnodeMux;

architecture Behavioral of AnodeMux is
begin
	mux_proc: process(anodeSelector, inputDisplayA, inputDisplayB, inputDisplayC, inputDisplayD)
	begin
		case anodeSelector IS
			when "00" => anodeMap <= "0111";
				outputDisplay <= inputDisplayA;
			when "01" => anodeMap <= "1011";
				outputDisplay <= inputDisplayB;
			when "10" => anodeMap <= "1101";
				outputDisplay <= inputDisplayC;
			when "11" => anodeMap <= "1110";	
				outputDisplay <= inputDisplayD;
			when others => anodeMap <= "1111";	
				outputDisplay <= "1111111";
		end case;
	end process;


end Behavioral;

