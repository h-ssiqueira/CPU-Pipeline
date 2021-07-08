LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY ALU IS
	PORT( 	clock1			:IN	STD_LOGIC;
			ALUop			:IN	STD_LOGIC_VECTOR(1 DOWNTO 0);
			A, B			:IN	STD_LOGIC_VECTOR(7 DOWNTO 0);
			ALUout 			:OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END ALU;

ARCHITECTURE options OF ALU IS
BEGIN
	PROCESS (ALUop, A, B, clock1)
	BEGIN
		IF clock1'EVENT AND clock1 = '0' THEN -- Realiza a operação na subida de clock
			CASE ALUop IS
				WHEN "00" => -- AND
					ALUout <= A AND B;
				WHEN "01" => -- OR
					ALUout <= A OR B;
				WHEN "10" => -- ADD
					ALUout <= A + B;
				WHEN "11" => -- SUB
					ALUout <= A - B;
				WHEN OTHERS => NULL;
			END CASE; 
		END IF;
	END PROCESS;
END options;