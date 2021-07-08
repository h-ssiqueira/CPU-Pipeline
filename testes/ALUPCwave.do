view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ns -dutycycle 50 -starttime 0ns -endtime 300ns sim:/alupc/CLOCK1 
wave create -driver freeze -pattern constant -value 00000000 -range 7 0 -starttime 0ns -endtime 300ns sim:/alupc/PC 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 00000100 -range 7 0 -starttime 100ns -endtime 200ns Edit:/alupc/PC 
wave modify -driver freeze -pattern constant -value 00001000 -range 7 0 -starttime 200ns -endtime 300ns Edit:/alupc/PC 
WaveCollapseAll -1
wave clipboard restore
