view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ns -dutycycle 50 -starttime 0ns -endtime 300ns sim:/idex/clock1 
wave create -driver freeze -pattern constant -value 1 -starttime 0ns -endtime 300ns sim:/idex/RegWriteID 
wave create -driver freeze -pattern constant -value 0 -starttime 0ns -endtime 300ns sim:/idex/ALUSrcBID 
wave modify -driver freeze -pattern constant -value 1 -starttime 100ns -endtime 200ns Edit:/idex/ALUSrcBID 
wave create -driver freeze -pattern constant -value 0 -starttime 0ns -endtime 300ns sim:/idex/RegDstID 
wave modify -driver freeze -pattern constant -value 1 -starttime 200ns -endtime 300ns Edit:/idex/RegDstID 
wave create -driver freeze -pattern constant -value 00 -range 1 0 -starttime 0ns -endtime 300ns sim:/idex/ALUOPID 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 10 -range 1 0 -starttime 200ns -endtime 300ns Edit:/idex/ALUOPID 
wave modify -driver freeze -pattern constant -value 01 -range 1 0 -starttime 100ns -endtime 200ns Edit:/idex/ALUOPID 
wave create -driver freeze -pattern constant -value 000 -range 2 0 -starttime 0ns -endtime 300ns sim:/idex/RSID 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 100 -range 2 0 -starttime 100ns -endtime 200ns Edit:/idex/RSID 
wave modify -driver freeze -pattern constant -value 110 -range 2 0 -starttime 200ns -endtime 300ns Edit:/idex/RSID 
wave create -driver freeze -pattern constant -value 001 -range 2 0 -starttime 0ns -endtime 300ns sim:/idex/RTID 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 011 -range 2 0 -starttime 100ns -endtime 200ns Edit:/idex/RTID 
wave modify -driver freeze -pattern constant -value 101 -range 2 0 -starttime 200ns -endtime 300ns Edit:/idex/RTID 
wave create -driver freeze -pattern constant -value 111 -range 2 0 -starttime 0ns -endtime 300ns sim:/idex/RDID 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 101 -range 2 0 -starttime 100ns -endtime 200ns Edit:/idex/RDID 
wave create -driver freeze -pattern constant -value 01010101 -range 7 0 -starttime 0ns -endtime 300ns sim:/idex/AID 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 10101010 -range 7 0 -starttime 100ns -endtime 200ns Edit:/idex/AID 
wave create -driver freeze -pattern constant -value 00001111 -range 7 0 -starttime 0ns -endtime 300ns sim:/idex/BID 
wave create -driver freeze -pattern constant -value 00001111 -range 7 0 -starttime 0ns -endtime 300ns sim:/idex/BID 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 11110000 -range 7 0 -starttime 100ns -endtime 200ns Edit:/idex/BID 
wave modify -driver freeze -pattern constant -value 11100010 -range 7 0 -starttime 200ns -endtime 300ns Edit:/idex/BID 
wave create -driver freeze -pattern constant -value 00110011 -range 7 0 -starttime 0ns -endtime 300ns sim:/idex/ImedID 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 11001100 -range 7 0 -starttime 100ns -endtime 200ns Edit:/idex/ImedID 
wave modify -driver freeze -pattern constant -value 11001001 -range 7 0 -starttime 200ns -endtime 300ns Edit:/idex/ImedID 
WaveCollapseAll -1
wave clipboard restore
