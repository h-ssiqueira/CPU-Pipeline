LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY CPU IS
	PORT( 
            CLOCK,RESET :IN STD_LOGIC

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

    COMPONENT Control IS
    PORT(   clock1, reset1                                      :IN STD_LOGIC;
            opcode                                              :IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            PCWrite1, ALUSrcB1, REGWrite1, RegDst1    			:OUT STD_LOGIC;
            ALUOp1                         						:OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
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

    COMPONENT MUXD IS
        PORT( 
                sinal           :IN STD_LOGIC;
                A,B			    :IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                dado    		:OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
            );
    END COMPONENT;

    COMPONENT MUXR IS
        PORT( 
                sinal           :IN STD_LOGIC;
                A,B			    :IN STD_LOGIC_VECTOR (2 DOWNTO 0);
                dado    		:OUT STD_LOGIC_VECTOR (2 DOWNTO 0)
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

    SIGNAL pcwrite, fwrA, fwrB, ALUSrcBid, ALUSrcBex, RegDstid, RegDstex, regwriteid, regwriteex, regwritewb : STD_LOGIC;
    SIGNAL ALUopid, ALUopex : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL RSex, RTex, RDex, RDEXR, RDwb : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL Imedid, Imedex, PCA, PCATT, DataAid, DataBid, DataAex, DataBex, a ,b, Bdata, resultex, resultwb : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL Memif, Memid : STD_LOGIC_VECTOR(15 DOWNTO 0);

BEGIN
    REGPC: PC PORT MAP(pcwrite,RESET,CLOCK,PCATT,PCA);

    ATTPC: ALUPC PORT MAP(CLOCK,PCA,PCATT);

    MEMORY: Memory64x4 PORT MAP(CLOCK,PCA,Memif);

    PIPEIFID: IFID PORT MAP(CLOCK,Memif,Memid);

    CPUCONTROL: Control PORT MAP(CLOCK,RESET,Memid(15 DOWNTO 12),pcwrite,ALUSrcBid,regwriteid,RegDstid,ALUopid);

    BANKREG: Registers PORT MAP(regwritewb,CLOCK,RESET,Memid(11 DOWNTO 9), Memid(8 DOWNTO 6),RDwb,resultwb,DataAid, DataBid);

    EXTEND: SignExtend PORT MAP(Memid(5 DOWNTO 0),Imedid);
    
    PIPEIDEX: IDEX PORT MAP(CLOCK,regwriteid,ALUSrcBid,RegDstid,ALUopid,Memid(11 DOWNTO 9),Memid(8 DOWNTO 6),Memid(5 DOWNTO 3),DataAid,DataBid,Imedid,regwriteex,ALUSrcBex,RegDstex,ALUopex,RSex,RTex,RDex,DataAex,DataBex,Imedex);

    FOWARDALUSRCB: Fowarding PORT MAP(CLOCK,regwritewb,RSex,RTex,RDwb,fwrA,fwrB);

    DESTINATION: MUXR PORT MAP(RegDstex,RTex,RDex,RDEXR);

    FWA: MUXD PORT MAP(fwrA,DataAex,resultwb,a);

    FWB: MUXD PORT MAP(fwrB,DataBex,resultwb,Bdata);

    ALUSRCB: MUXD PORT MAP(ALUSrcBex,Bdata,Imedex,b);  

    ULA: ALU PORT MAP(CLOCK,ALUopex,a,b,resultex);

    PIPEEXWB: EXWB PORT MAP(CLOCK,regwriteex,RDEXR,resultex,regwritewb,RDwb,resultwb);
        
    
END options;
	