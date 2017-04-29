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

signal clk, reset, output: STD_LOGIC:='0';
signal A, result: STD_LOGIC_VECTOR(2 downto 0):="000";
constant clk_period : time := 100 ns;    


begin

mapping: vote port map(A, clk, reset, output, result);

  clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;

Stim :process
begin 

    reset <= '1'; 
    A <= "000"; 
    wait for clk_period/2;
    
    reset <= '0'; 
    A <= "001"; 
    wait for clk_period/2;  --1

    wait for clk_period/2;
    
    A <= "010"; 
    wait for clk_period/2;  --2

    wait for clk_period/2;
    
    A <= "001"; 
    wait for clk_period/2;  --3

    wait for clk_period/2;
    
    A <= "111"; 
    wait for clk_period/2;  --4
    
    wait for clk_period/2;
    
    A <= "001"; 
    wait for clk_period/2;  --5
     
    wait for clk_period/2;
    
    A <= "110"; 
    wait for clk_period/2;  --6
     
    wait for clk_period/2;
    
    A <= "001"; 
    wait for clk_period/2;  --7
     
    wait for clk_period/2;
    
    A <= "001";  
    wait for clk_period/2;  --8
     
    wait for clk_period/2;
    
    A <= "001"; 
    wait for clk_period/2;  --9
    
    wait for clk_period/2;
    
    A <= "110";  
    wait for clk_period/2;  --10
    
    reset <= '1'; 
        A <= "000"; 
        wait for clk_period/2;
        
        reset <= '0'; 
        A <= "101"; 
        wait for clk_period/2;  --11
    
        wait for clk_period/2;
        
        A <= "011"; 
        wait for clk_period/2;  --12
    
        wait for clk_period/2;
        
        A <= "010"; 
        wait for clk_period/2;  --13
    
        wait for clk_period/2;
        
        A <= "111"; 
        wait for clk_period/2;  --14
        
        wait for clk_period/2;
        
        A <= "011"; 
        wait for clk_period/2;  --15
         
        wait for clk_period/2;
        
        A <= "111"; 
        wait for clk_period/2;  --16
         
        wait for clk_period/2;
        
        A <= "001"; 
        wait for clk_period/2;  --17
         
        wait for clk_period/2;
        
        A <= "000";  
        wait for clk_period/2;  --18
         
        wait for clk_period/2;
        
        A <= "001"; 
        wait for clk_period/2;  --19
        
        wait for clk_period/2;
        
        A <= "101";  
        wait for clk_period/2;  --20            
    
    wait;
end process;
    

end Behavioral;

