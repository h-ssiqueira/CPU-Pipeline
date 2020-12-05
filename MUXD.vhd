LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY MUXD IS
	PORT( 
            sinal           :IN STD_LOGIC;
            A,B			    :IN STD_LOGIC_VECTOR (7 DOWNTO 0);
           	dado    		:OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END MUXD;

ARCHITECTURE options OF MUXD IS
BEGIN
	PROCESS (sinal,A,B)
    BEGIN
        CASE sinal IS
            WHEN '0' => 
                dado <= A;
            WHEN '1' => 
                dado <= B;
            WHEN OTHERS => 
                NULL;
        END CASE;
    END PROCESS;
END options;
	