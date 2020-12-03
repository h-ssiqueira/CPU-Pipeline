LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY EXWB IS
	PORT(
            clock1, RegWriteEX  :IN STD_LOGIC;
            RDEX                :IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            ResultEX            :IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            RegWriteWB          :OUT STD_LOGIC;
            RDWB                :OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
            ResultWB            :OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
END EXWB;

ARCHITECTURE options OF EXWB IS
SIGNAL RegWrite : STD_LOGIC;
SIGNAL RD : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL Result : STD_LOGIC_VECTOR (7 DOWNTO 0);
BEGIN
	PROCESS (clock1)
	BEGIN
		IF clock1'EVENT AND clock1 = '0' THEN -- Realiza a escrita na descida de clock
            RegWrite <= RegWriteEX;
            RD <= RDEX;
            Result <= ResultEX;
        ELSIF clock1'EVENT AND clock1 = '1' THEN -- Realiza a leitura na subida de clock
            RegWriteWB <= RegWrite;
            RDWB <= RD;
            ResultWB <= Result;
		END IF;
    END PROCESS;
END options;
