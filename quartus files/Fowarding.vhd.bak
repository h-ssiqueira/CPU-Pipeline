LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Fowarding IS
	PORT( 	clock1, RegWriteWB   :IN STD_LOGIC;
			EXRS, EXRT, WBRD    :IN	STD_LOGIC_VECTOR(2 DOWNTO 0);
			FWDA, FWDB		    :OUT STD_LOGIC);
END Fowarding;

ARCHITECTURE options OF Fowarding IS
BEGIN
	PROCESS (clock1, RegWriteWB, EXRS, EXRT, WBRD)
	BEGIN
		IF clock1'EVENT AND clock1 = '1' THEN -- Verifica Forwarding na subida de clock
            IF RegWriteWB = '1' AND WBRD /= "000" AND EXRS = WBRD THEN
                FWDA <= '1';
            ELSE
                FWDA <= '0';
            END IF;
            IF RegWriteWB = '1' AND WBRD /= "000" AND EXRT = WBRD THEN
                FWDB <= '1';
            ELSE
                FWDB <= '0';
            END IF;
		END IF;
	END PROCESS;
END options;

--if(EX/WB.RegWrite == '1' && EX/WB.RD != "000" && ID/EX.RS == EX/WB.RD)
--FORWARD A

--if(EX/WB.RegWrite == '1' && EX/WB.RD != "000" && ID/EX.RT == EX/WB.RD)
--FORWARD B
