LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY IFID IS
	PORT( 
            Memdata			:IN STD_LOGIC_VECTOR (15 DOWNTO 0);
           	Instruction		:OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
END IFID;

ARCHITECTURE options OF IFID IS
BEGIN
	PROCESS (clock)
    BEGIN
		IF clock'EVENT AND clock = '1' THEN
			Memdata <= Instruction;
		END IF;
    END PROCESS;
END options;
