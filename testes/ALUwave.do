view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ns -dutycycle 50 -starttime 0ns -endtime 800ns sim:/alu/clock1 
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ns -dutycycle 50 -starttime 0ns -endtime 400ns sim:/alu/clock1 
wave create -driver freeze -pattern constant -value 00 -range 1 0 -starttime 0ns -endtime 400ns sim:/alu/ALUop 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 01 -range 1 0 -starttime 100ns -endtime 200ns Edit:/alu/ALUop 
wave modify -driver freeze -pattern constant -value 10 -range 1 0 -starttime 200ns -endtime 300ns Edit:/alu/ALUop 
wave modify -driver freeze -pattern constant -value 11 -range 1 0 -starttime 300ns -endtime 400ns Edit:/alu/ALUop 
wave create -driver freeze -pattern constant -value 01010111 -range 7 0 -starttime 0ns -endtime 400ns sim:/alu/A 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 00100011 -range 7 0 -starttime 0ns -endtime 400ns sim:/alu/B 
WaveExpandAll -1
WaveCollapseAll -1
wave clipboard restore
