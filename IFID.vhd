LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY IFID IS
	PORT(
			clock1			:IN STD_LOGIC;
            Memdata			:IN STD_LOGIC_VECTOR (15 DOWNTO 0);
           	Instruction		:OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
END IFID;

ARCHITECTURE options OF IFID IS
SIGNAL MEM: STD_LOGIC_VECTOR (15 DOWNTO 0);
BEGIN
	PROCESS (clock1)
	BEGIN
		IF clock1'EVENT AND clock1 = '1' THEN -- Realiza a leitura na subida de clock
			Instruction <= MEM;
		ELSIF clock1'EVENT AND clock1 = '0' THEN -- Realiza a escrita na descida de clock
			MEM <= Memdata;
		END IF;
    END PROCESS;
END options;
