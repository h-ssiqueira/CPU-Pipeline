view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ns -dutycycle 50 -starttime 0ns -endtime 400ns sim:/registers/clock1 
wave create -driver freeze -pattern constant -value 1 -starttime 0ns -endtime 400ns sim:/registers/RESET1 
wave modify -driver freeze -pattern constant -value 0 -starttime 0ns -endtime 100ns Edit:/registers/RESET1 
wave create -driver freeze -pattern constant -value 1 -starttime 0ns -endtime 400ns sim:/registers/RegWrite1 
wave modify -driver freeze -pattern constant -value 0 -starttime 0ns -endtime 100ns Edit:/registers/RegWrite1 
wave create -driver freeze -pattern constant -value 100 -range 2 0 -starttime 0ns -endtime 400ns sim:/registers/Rs1 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 001 -range 2 0 -starttime 0ns -endtime 400ns sim:/registers/Rt1 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 000 -range 2 0 -starttime 0ns -endtime 400ns sim:/registers/Rd1 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 01010101 -range 7 0 -starttime 0ns -endtime 400ns sim:/registers/data 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 010 -range 2 0 -starttime 100ns -endtime 200ns Edit:/registers/Rd1 
wave modify -driver freeze -pattern constant -value 010 -range 2 0 -starttime 100ns -endtime 200ns Edit:/registers/Rt1 
wave modify -driver freeze -pattern constant -value 111 -range 2 0 -starttime 200ns -endtime 300ns Edit:/registers/Rd1 
wave modify -driver freeze -pattern constant -value 111 -range 2 0 -starttime 200ns -endtime 300ns Edit:/registers/Rs1 
wave modify -driver freeze -pattern constant -value 000 -range 2 0 -starttime 300ns -endtime 400ns Edit:/registers/Rt1 
WaveCollapseAll -1
wave clipboard restore
