----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/28 16:08:17
-- Design Name: 
-- Module Name: vote - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vote is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           undone: out STD_LOGIC := '1'; -- whether or not the program has a result
           done  : out STD_LOGIC := '0';
           result : out STD_LOGIC_VECTOR (2 downto 0)); -- the result of the vote
end vote;

architecture Behavioral of vote is
signal temp : std_logic_vector(2 downto 0) := "000";

begin

process(clk, reset)
variable count, s000, s001, s010, s011, s100, s101, s110, s111: integer := 0;
begin
    if reset = '1' then
        count := 0;
        s000 := 0;
        s001 := 0;
        s010 := 0;
        s011 := 0;
        s100 := 0;
        s101 := 0;
        s110 := 0;
        s111 := 0;
        undone <= '1';
        done <=  '0';
        temp <= "000";
        result <= "000";
                
    elsif rising_edge(clk) then
        if count < 9 then
            case A is
              when "000" =>
                s000 := s000 + 1;
              when "001" =>
                s001 := s001 + 1;
              when "010" =>
                s010 := s010 + 1;
              when "011" =>
                s011 := s011 + 1;
              when "100" =>
                s100 := s100 + 1;
              when "101" =>
                s101 := s101 + 1;
              when "110" =>
                s110 := s110 + 1;
              when "111" =>
                s111 := s111 + 1;
              when others=>
                NULL;
            end case;
            done <= '0';
            undone <= '1';
            count := count + 1;
        else
            count := 0;
            if s000 > s001 and s000 > s010 and s000 > s011 and s000 > s100 and s000 > s101 and s000 > s110 and s000 > s111 then
                temp <= "000";
            elsif s001 > s000 and s001 > s010 and s001 > s011 and s001 > s100 and s001 > s101 and s001 > s110 and s001 > s111 then
                temp <= "001";
            elsif s010 > s000 and s010 > s001 and s010 > s011 and s010 > s100 and s010 > s101 and s010 > s110 and s010 > s111 then
                temp <= "010";
            elsif s011 > s000 and s011 > s001 and s011 > s010 and s011 > s100 and s011 > s101 and s011 > s110 and s011 > s111 then
                temp <= "011";
            elsif s100 > s000 and s100 > s001 and s100 > s010 and s100 > s011 and s100 > s101 and s100 > s110 and s100 > s111 then
                temp <= "100";
            elsif s101 > s000 and s101 > s001 and s101 > s010 and s101 > s011 and s101 > s100 and s101 > s110 and s101 > s111 then
                temp <= "101";
            elsif s110 > s000 and s110 > s001 and s110 > s010 and s110 > s011 and s110 > s100 and s110 > s101 and s110 > s111 then
                temp <= "110";
            else temp <= "111";    
            end if;
            done <= '1';
            undone <= '0';
            s000 := 0;
            s001 := 0;
            s010 := 0;
            s011 := 0;
            s100 := 0;
            s101 := 0;
            s110 := 0;
            s111 := 0;
        end if;
    end if;
    result <= temp;
end process;
end Behavioral;

