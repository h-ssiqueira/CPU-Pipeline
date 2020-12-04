LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Memory64x4 IS
    PORT(
		  clock1			:IN STD_LOGIC;
        address			:IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- Valor de PC
        memdata			:OUT STD_LOGIC_VECTOR(15 DOWNTO 0)); -- Saída de 16 bits referente a instrução
END ENTITY;

ARCHITECTURE MEMORY OF Memory64x4 IS
	SIGNAL ADR1: INTEGER RANGE 0 TO 256;
	SIGNAL ADR2: INTEGER RANGE 0 TO 256;
	SIGNAL ADR3: INTEGER RANGE 0 TO 256;
	SIGNAL ADR4: INTEGER RANGE 0 TO 256;
    TYPE rom_array IS ARRAY (0 TO 63) OF STD_LOGIC_VECTOR (3 DOWNTO 0);
    CONSTANT rom: rom_array := ("0001", "0000", "0100", "0010",	"0000", "0010", "0001", "1000",	"0010", "0010", "1111", "0000",	"0011", "0011", "0100", "0011",	"0100", "1011", "1001", "0000",	"1001", "0011", "0000", "0110",	"0110", "1001", "0111", "1000",	"0111", "0101", "1000", "0111",	"1000", "1111", "1011", "0000",	"0101", "0011", "0000", "0010",	"0000", "1000", "0011", "1000",	"0010", "1001", "1010", "0000",	"0101", "1101", "0100", "0001",	"1001", "0110", "1100", "0100",	"0110", "0010", "1001", "0000",	"0001", "0001", "0000", "0111"); 

	-- OP | RS | RT | RD | 000
	-- OP | RS | RT | IMMEDIATE
	-- OP | RS | 000 | RD | 000 -- MOVR
	-- OP | 000 | RT | IMMEDIATE -- MOVI
BEGIN
	PROCESS(address, clock1, ADR1, ADR2, ADR3, ADR4)
	BEGIN
		ADR1 <= TO_INTEGER(UNSIGNED(address)); -- Calcula os endereços na subida de clock
		ADR2 <= ADR1 + 1;
		ADR3 <= ADR1 + 2;
		ADR4 <= ADR1 + 3;
		IF clock1'EVENT AND clock1 = '0' THEN -- Escreve ba descida de clock --CONFERIR DPS SE DA CERTO (SE NÃO DER MUDAR PARA 1)
			memdata(15 DOWNTO 12) <= rom (ADR1); -- load 4 bits
			memdata(11 DOWNTO 8) <= rom (ADR2); -- load 4 bits
			memdata(7 DOWNTO 4) <= rom (ADR3); -- load 4 bits
			memdata(3 DOWNTO 0) <= rom (ADR4); -- load 4 bits
		END IF;
	END PROCESS;
END ARCHITECTURE;