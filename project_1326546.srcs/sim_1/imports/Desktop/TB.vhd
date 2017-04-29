----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/28 16:09:12
-- Design Name: 
-- Module Name: TB - Behavioral
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

entity TB is
--  Port ( );
end TB;

architecture Behavioral of TB is

component vote is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           output : out STD_LOGIC;
           result: out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal clk, reset, output: STD_LOGIC;
signal A, result: STD_LOGIC_VECTOR(2 downto 0);


begin

mapping: vote port map(A, clk, reset, output, result);

process
begin
    reset <= '1'; A <= "000"; clk <= '0'; wait for 50 ns;
    reset <= '0'; A <= "001"; clk <= '1'; wait for 50 ns;  --1
    clk <= '0'; wait for 50 ns;
    A <= "010"; clk <= '1'; wait for 50 ns;  --2
    clk <= '0'; wait for 50 ns;
    A <= "001"; clk <= '1'; wait for 50 ns;  --3
    clk <= '0'; wait for 50 ns;
    A <= "111"; clk <= '1'; wait for 50 ns;  --4
    clk <= '0'; wait for 50 ns;
    A <= "001"; clk <= '1'; wait for 50 ns;  --5
    clk <= '0'; wait for 50 ns;
    A <= "110"; clk <= '1'; wait for 50 ns;  --6
    clk <= '0'; wait for 50 ns;
    A <= "001"; clk <= '1'; wait for 50 ns;  --7
    clk <= '0'; wait for 50 ns;
    A <= "001"; clk <= '1'; wait for 50 ns;  --8
    clk <= '0'; wait for 50 ns;
    A <= "001"; clk <= '1'; wait for 50 ns;  --9
    clk <= '0'; wait for 50 ns;
    A <= "110"; clk <= '1'; wait for 50 ns;  --10
    wait;
end process;
    

end Behavioral;

