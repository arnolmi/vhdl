----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:21:44 02/02/2014 
-- Design Name: 
-- Module Name:    BCDDecoder - Behavioral 
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

entity BCDDecoder is
    Port ( binaryDigit : in  STD_LOGIC_VECTOR (3 downto 0);
           bcdDigit : out  STD_LOGIC_VECTOR (6 downto 0));
end BCDDecoder;

architecture Behavioral of BCDDecoder is
begin
	clk_proc: process(binaryDigit)
	begin
		case binaryDigit(3 downto 0) IS
		  when "0000" => bcdDigit <= "1000000"; --0
		  when "0001" => bcdDigit <= "1111001"; --1
		  when "0010" => bcdDigit <= "0100100"; --2
		  when "0011" => bcdDigit <= "0110000"; --3
		  when "0100" => bcdDigit <= "0011001"; --4
		  when "0101" => bcdDigit <= "0010010"; --5
		  when "0110" => bcdDigit <= "0000010"; --6
		  when "0111" => bcdDigit <= "1111000"; --7
		  when "1000" => bcdDigit <= "0000000"; --8
		  when "1001" => bcdDigit <= "0011000"; --9
		  when others => bcdDigit <= "1111111";
		end case;
	end process;
end Behavioral;

