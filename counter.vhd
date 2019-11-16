library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

Entity counter IS
 Port (clk_50, rst, start : in std_logic;
       bin_count          : out std_logic_vector(3 downto 0));
End counter;

Architecture behave of counter IS
 SIGNAL start_temp : std_logic                    := '0';
 SIGNAL count      : std_logic_vector(3 downto 0) := "0000";
 CONSTANT delay    : integer                      := 20;
 
 Begin
   bin_count <= count;
   PROCESS (clk_50, rst, start)
   Begin
     if rising_edge(start) then	
       start_temp <= '1';
	  	 end if;
	  if rst = '1' then
		 count <= "0000";
		 start_temp <= '0';
	  elsif rising_edge(clk_50) AND start_temp = '1' then
		 count <= count + '1';
		end if;
	 End PROCESS;
End behave;