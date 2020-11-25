LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY memoria64x4int IS
    PORT(
		  clock,PCWrite1,reset1				:IN STD_LOGIC;
        --address			:IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- VALOR DE PC
        memdata			:OUT STD_LOGIC_VECTOR(15 DOWNTO 0) -- SAIDA DE 16 BITS PARA INSTRUCTION REGISTER
    );
END ENTITY;

ARCHITECTURE MEMORY OF memoria64x4int IS
	 SIGNAL ADR1: INTEGER RANGE 0 TO 63 := 0;
	 SIGNAL ADR2: INTEGER RANGE 0 TO 63 := 1;
	 SIGNAL ADR3: INTEGER RANGE 0 TO 63 := 2;
	 SIGNAL ADR4: INTEGER RANGE 0 TO 63 := 3;
    TYPE rom_array IS ARRAY (0 TO 63) OF STD_LOGIC_VECTOR (3 DOWNTO 0);
    CONSTANT rom: rom_array := ("0001","0000","0000","0010","0000","0000","1101","1000","0010","0000","1100","1000","0011","0011","0100","0011","0100","1010","0001","0000","1001","0011","0000","0110","0110","1001","0111","1000","0111","0101","1000","0111","1000","1111","1011","0000","0101","0011","0000","0010","0000","1001","1111","1000","0010","1000","0010","0000","0101","1101","0100","0001","1001","0110","1100","0100","0110","0010","1001","0000","0001","0000","0000","0111");

    -- op | rs | rt | rd | 000
    -- op | rs | rt | imediato
BEGIN
	PROCESS(reset1, clock, ADR1, ADR2, ADR3, ADR4, PCWrite1)
	BEGIN
		--ADR1 <= TO_INTEGER(UNSIGNED(address)); -- Calcula os endereços na subida de clock
		--ADR2 <= ADR1 + 1;
		--ADR3 <= ADR1 + 2;
        --ADR4 <= ADR1 + 3;
        IF clock'EVENT AND clock = '1' AND PCWrite1 = '1' THEN -- e escreve ba descida de clock
			  --IF reset1 = '0' THEN
					--ADR1 <= 0;
					--ADR2 <= 1;
					--ADR3 <= 2;
					--ADR4 <= 3;
			  --END IF;
            memdata(15 DOWNTO 12) <= rom (ADR1);-- load 4 bits
            memdata(11 DOWNTO 8) <= rom (ADR2);-- load 4 bits
            memdata(7 DOWNTO 4) <= rom (ADR3);-- load 4 bits
            memdata(3 DOWNTO 0) <= rom (ADR4);-- load 4 bits
		ELSIF clock'EVENT AND clock = '0' AND PCWrite1 = '1' THEN -- e escreve ba descida de clock
            ADR1 <= ADR1 + 4;
            ADR2 <= ADR2 + 4;
            ADR3 <= ADR3 + 4;
            ADR4 <= ADR4 + 4;
		END IF;
	END PROCESS;
END ARCHITECTURE;