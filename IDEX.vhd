LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY IDEX IS
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
END IDEX;

ARCHITECTURE options OF IDEX IS
--SIGNAL RegWrite, ALUSrcB, RegDst : STD_LOGIC;
--SIGNAL ALUOp : STD_LOGIC_VECTOR (1 DOWNTO 0);
--SIGNAL RS, RT, RD : STD_LOGIC_VECTOR(2 DOWNTO 0);
--SIGNAL A,B,Imed : STD_LOGIC_VECTOR (7 DOWNTO 0);
BEGIN
	PROCESS (clock1)
	BEGIN
		IF clock1'EVENT AND clock1 = '1' THEN
		--IF clock1'EVENT AND clock1 = '0' THEN -- Realiza a escrita na descida de clock
			RegWriteEX <= RegWriteID;
			ALUSrcBEX <= ALUSrcBID;
			RegDstEX <= RegDstID;
			ALUOPEX <= ALUOPID;
			RSEX <= RSID;
			RTEX <= RTID;
			RDEX <= RDID;
			AEX <= AID;
			BEX <= BID;
			ImedEX <= ImedID;
            --RegWrite <= RegWriteID;
            --ALUSrcB <= ALUSrcBID;
            --RegDst <= RegDstID;
            --ALUOp <= ALUOPID;
            --A <= AID;
            --B <= BID;
            --Imed <= ImedID;
            --RS <= RSID;
            --RT <= RTID;
            --RD <= RDID;
        --ELSIF clock1'EVENT AND clock1 = '1' THEN -- Realiza a leitura na subida de clock
            --RegWriteEX <= RegWrite;
            --ALUSrcBEX <= ALUSrcB;
            --RegDstEX <= RegDst;
            --ALUOpEX <= ALUOp;
            --AEX <= A;
            --BEX <= B;
            --ImedEX <= Imed;
            --RSEX <= RS;
            --RTEX <= RT;
            --RDEX <= RD;
		END IF;
    END PROCESS;
END options;
