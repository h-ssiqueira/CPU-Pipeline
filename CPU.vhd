LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY CPU IS
	PORT( 
            CLOCK,RESET :IN STD_LOGIC;

        );
END CPU;

ARCHITECTURE options OF CPU IS
    COMPONENT ALU IS
        PORT( 	
                clock1			:IN	STD_LOGIC;
                ALUop			:IN	STD_LOGIC_VECTOR(1 DOWNTO 0);
                A, B			:IN	STD_LOGIC_VECTOR(7 DOWNTO 0);
                ALUout 			:OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
            );
    END COMPONENT;

    COMPONENT ALUPC IS
        PORT(   
                CLOCK1          :IN STD_LOGIC; -- Sinal de clock
                PC				:IN	STD_LOGIC_VECTOR(7 DOWNTO 0); -- Valor de PC da instruçâo atual
                PC4				:OUT STD_LOGIC_VECTOR(7 DOWNTO 0) -- Saída de PC atualizado (PC+4)
            );
    END COMPONENT;

    COMPONENT EXWB IS
        PORT(
                clock1, RegWriteEX  :IN STD_LOGIC;
                RDEX                :IN STD_LOGIC_VECTOR(2 DOWNTO 0);
                ResultEX            :IN STD_LOGIC_VECTOR(7 DOWNTO 0);
                RegWriteWB          :OUT STD_LOGIC;
                RDWB                :OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                ResultWB            :OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
            );
    END COMPONENT;

    COMPONENT Fowarding IS
        PORT( 	
                clock1, RegWriteWB   :IN STD_LOGIC;
                EXRS, EXRT, WBRD    :IN	STD_LOGIC_VECTOR(2 DOWNTO 0);
                FWDA, FWDB		    :OUT STD_LOGIC
            );
    END COMPONENT;

    COMPONENT IDEX IS
        PORT(
                clock1, RegWriteID, ALUSrcBID, RegDstID			:IN STD_LOGIC;
                ALUOPID                                         :IN STD_LOGIC_VECTOR(1 DOWNTO 0);
                RSID, RTID, RDID                                :IN STD_LOGIC_VECTOR(2 DOWNTO 0);
                AID, BID, ImedID                                :IN STD_LOGIC_VECTOR(7 DOWNTO 0);
                RegWriteEX, ALUSrcBEX, RegDstEX     			:OUT STD_LOGIC;
                ALUOPEX                                         :OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
                RSEX, RTEX, RDEX                                :OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                AEX, BEX, ImedEX                                :OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
            );
    END COMPONENT;

    COMPONENT IFID IS
        PORT(
                clock1			:IN STD_LOGIC;
                Memdata			:IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                Instruction		:OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
            );
    END COMPONENT;

    COMPONENT Memory64x4 IS
        PORT(
                clock1			:IN STD_LOGIC;
                address			:IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- Valor de PC
                memdata			:OUT STD_LOGIC_VECTOR(15 DOWNTO 0) -- Saída de 16 bits referente a instrução
            ); 
    END COMPONENT;

    COMPONENT MUX IS
        PORT( 
                sinal           :IN STD_LOGIC;
                A,B			    :IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                dado    		:OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
            );
    END COMPONENT;

    COMPONENT PC IS
        PORT( 	
                PCWrite1, RESET1, CLOCK1	:IN STD_LOGIC; -- Sinal de escrita de PC e clock
                ADDRESS						:IN	STD_LOGIC_VECTOR(7 DOWNTO 0); -- Valor Atualizado de PC (PC+4)
                ADDR						:OUT STD_LOGIC_VECTOR(7 DOWNTO 0) -- Saída de PC
            );
    END COMPONENT;

    COMPONENT Registers IS
        PORT(
                RegWrite1,clock1,RESET1			:IN	STD_LOGIC;							-- Sinal do controlador de escrita
                Rs1, Rt1, Rd1					:IN	STD_LOGIC_VECTOR(2 DOWNTO 0); 		-- Endereço dos registradores a serem usados
                data							:IN STD_LOGIC_VECTOR(7 DOWNTO 0);		-- Valor a ser escrito
                RA1, RB1						:OUT STD_LOGIC_VECTOR(7 DOWNTO 0)       -- Saída de informações dos registradores
            );
    END COMPONENT;

    COMPONENT SignExtend IS
        PORT( 	
                Immediate		:IN	STD_LOGIC_VECTOR(5 DOWNTO 0);
                ExtImmediate	:OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
            );
    END COMPONENT;

BEGIN
	
        
    
END options;
	